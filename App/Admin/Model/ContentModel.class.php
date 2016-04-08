<?php
/**
 * Created by PhpStorm.
 * User: mangolau
 * Date: 2/9/16
 * Time: 11:55 PM
 */
namespace Admin\Model;
use Think\Model;

class ContentModel extends Model{
    #自动验证
    protected $_validate = array(
        array('title','require','标题必须！', self::MUST_VALIDATE),
        array('title','1,64','标题长度不能超过64位',self::MUST_VALIDATE,'length',self::MODEL_BOTH),
        array('content','require','文章内容必须！',self::MUST_VALIDATE),
        array('content','1,10000','标题长度不能超过10000位',self::MUST_VALIDATE,'length',self::MODEL_BOTH),
    );

    #自动完成
    protected $_auto = array (
        array('created','datetime',self::MODEL_INSERT,'callback'),
        array('modified','datetime',self::MODEL_BOTH,'callback'),
        array('uid','getuser',self::MODEL_INSERT,'callback'),
    );

    //当前时间
    protected function datetime(){
        return date('Y-m-d H:i:s');
    }

    //用户id
    protected function getuser(){
        return $_SESSION['uid'] ? intval($_SESSION['uid']) : 1;
    }
}

?>