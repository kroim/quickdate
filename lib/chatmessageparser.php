<?php
class ChatMessageParser {
    public $from = 0;
    public $to = 0;
    public $user = 0;
    public $conversationMessageList = array();
    public $chunks = array();
    public $seenprint = false;
    public $show_unread = true;
    function __construct($from, $to, $show_unread = true) {
        global $db;
        $this->to          = $to;
        $this->from        = $from;
        $this->show_unread = $show_unread;
        $this->user        = $db->objectBuilder()->where('id', $from)->getOne('users', array(
            'id',
            'avater',
            'online',
            'verified',
            'username',
            'first_name',
            'last_name'
        ));
        $this->parseTo();
        $this->parseFrom();
        usort($this->conversationMessageList, array(
            $this,
            "sortFunction"
        ));
        $i = 0;
        foreach ($this->conversationMessageList as $key => $msg) {
            $this->chunks[ $i ][]              = $msg;
            $this->chunks[ $i ][ 'container' ] = $this->getMessageContainer(ToObject($msg));
            if (isset($this->conversationMessageList[ $key + 1 ])) {
                if ($this->conversationMessageList[ $key + 1 ][ 'to' ] !== $msg[ 'to' ]) {
                    $i++;
                } else {
                }
            }
        }
    }
    function Parse() {
        $seen_count        = 0;
        $unread_msgs       = new stdClass();
        $container         = '';
        $response          = '';
        $messages          = '';
        $conversation_html = '';
        $container_array   = array();
        $messages_array    = array();
        $response_array    = array();
        foreach ($this->chunks as $key => $chunk) {
            $container         = $chunk[ 'container' ];
            $container_array[] = $container;
            $messages          = '';
            foreach ($chunk as $k => $msg) {
                if (isset($msg[ '_function' ])) {
                    $_function = $msg[ '_function' ];
                    if (method_exists($this, $_function)) {
                        if ($msg[ 'seen' ] > 0) {
                            $messages .= $this->$_function(ToObject($msg));
                            $messages_array[ $key ][] = $this->$_function(ToObject($msg));
                        } else {
                            $unread_msgs->container = $container;
                            $unread_msgs->$k        = $msg;
                            $seen_count++;
                        }
                    }
                }
            }
            $conversation_html .= str_replace('CONTENT', $messages, $container);
            $response_array[] = str_replace('CONTENT', $messages, $container);
            $container        = '';
        }
        if ($seen_count > 0) {
            if ($this->show_unread) {
                $conversation_html .= '<div class="unread_msg_line">' . $seen_count . ' ' . __('Unread Messages') . '&nbsp;&nbsp;</div>';
            }
            $unread_container = $unread_msgs->container;
            unset($unread_msgs->container);
            $unread_messages = '';
            $_msg            = LoadEndPointResource('messages');
            foreach ($unread_msgs as $k => $msg) {
                if ($_msg) {
                    if ($_msg->setMessageSeen($msg[ 'id' ], $this->from)) {
                        $unread_messages .= $this->$_function(ToObject($msg));
                    }
                }
            }
            $conversation_html .= str_replace('CONTENT', $unread_messages, $unread_container);
        }
        return $conversation_html . '<script>$(\'.seen:not(:last)\').remove();</script>';
    }
    function parseTo() {
        global $db;
        $s = $db->objectBuilder()->where('`to`', $this->from)->where('`from`', $this->to)->join("stickers s", "m.sticker=s.id", "LEFT")->orderBy('created_at', 'desc')->get('messages m', null, array(
            'm.id',
            'm.`from`',
            'm.`to`',
            'm.text',
            'm.media',
            's.file as sticker',
            'm.created_at',
            'm.seen'
        ));
        foreach ($s as $key => $value) {
            $sent_function                               = $this->getFunctionName($value);
            $this->conversationMessageList[ $value->id ] = array(
                '_function' => $sent_function,
                'id' => $value->id,
                'from' => $value->from,
                'to' => $value->to,
                'type' => 'sent',
                'user' => array(),
                'message' => $value->text,
                'media' => $value->media,
                'sticker' => $value->sticker,
                'seen' => $value->seen,
                'time_txt' => Time_Elapsed_String(strtotime($value->created_at)),
                'created_at' => $value->created_at
            );
        }
    }
    function parseFrom() {
        global $db;
        $r = $db->objectBuilder()->where('`to`', $this->to)->where('`from`', $this->from)->join("stickers s", "m.sticker=s.id", "LEFT")->orderBy('created_at', 'desc')->get('messages m', null, array(
            'm.id',
            'm.`from`',
            'm.`to`',
            'm.text',
            'm.media',
            's.file as sticker',
            'm.created_at',
            'm.seen'
        ));
        foreach ($r as $key => $value) {
            $received_function                           = $this->getFunctionName($value);
            $this->conversationMessageList[ $value->id ] = array(
                '_function' => $received_function,
                'id' => $value->id,
                'from' => $value->from,
                'to' => $value->to,
                'type' => 'received',
                'user' => array(
                    'id' => $this->user->id,
                    'avater' => GetMedia($this->user->avater),
                    'online' => $this->user->online,
                    'full_name' => $this->user->username,
                    'verified' => $this->user->verified
                ),
                'message' => $value->text,
                'media' => $value->media,
                'sticker' => $value->sticker,
                'seen' => $value->seen,
                'time_txt' => Time_Elapsed_String(strtotime($value->created_at)),
                'created_at' => $value->created_at
            );
        }
    }
    function getMessageContainer($message) {
        $class  = "";
        $avater = "";
        $sent   = "";
        if ($message->type == 'received') {
            $class  = "r";
            $avater = '     <div class="m_avatar"><img src="' . $message->user->avater . '" alt="' . $message->user->full_name . '" title="' . $message->user->full_name . '"></div>' . "\n";
        } else if ($message->type == 'sent') {
            $class = "s";
            if ($message->seen > 0) {
                $sent .= '      <div class="seen" data-seen="' . $message->seen . '" title="' . Time_Elapsed_String($message->seen) . '">' . "\n";
                $sent .= '          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="#03A9F4" d="M0.41,13.41L6,19L7.41,17.58L1.83,12M22.24,5.58L11.66,16.17L7.5,12L6.07,13.41L11.66,19L23.66,7M18,7L16.59,5.58L10.24,11.93L11.66,13.34L18,7Z" /></svg>' . "\n";
                $sent .= '      </div>' . "\n";
                $this->seenprint = true;
            }
        }
        $response = '<div class="messages messages--' . $message->type . '">' . "\n";
        $response .= '  <div class="msg_' . $class . '_combo">' . "\n";
        $response .= $avater;
        $response .= '      <div class="m_msg_part">' . "\n";
        $response .= 'CONTENT';
        $response .= '      </div>' . "\n";
        $response .= $sent;
        $response .= '  </div>' . "\n";
        $response .= '</div>' . "\n";
        return $response;
    }
    function getFunctionName($message) {
        $func = "";
        if (!empty($message->text)) {
            $func = "renderTextMessage";
        }
        if (!empty($message->media)) {
            $func = "renderMediaMessage";
        }
        if (!empty($message->sticker)) {
            $func = "renderStickerMessage";
        }
        return $func;
    }
    function renderTextMessage($message) {
        if (isset($message->message)) {
            return "        <div class=\"message\">" . htmlentities($message->message, ENT_NOQUOTES) . "</div>\n" . '';
        }
    }
    function renderMediaMessage($message) {
        if (isset($message->media)) {
            return '<div class="message image"><img src="' . GetMedia($message->media) . '"></div>';
        }
    }
    function renderStickerMessage($message) {
        if (isset($message->sticker)) {
            return '<div class="message sticker"><img src="' . GetMedia($message->sticker) . '"></div>';
        }
    }
    function sortFunction($a, $b) {
        return strtotime($a[ "created_at" ]) - strtotime($b[ "created_at" ]);
    }
}