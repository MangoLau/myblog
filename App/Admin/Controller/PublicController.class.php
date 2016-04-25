<?php
/**
 * Created by PhpStorm.
 * User: MangoLau
 * Date: 2016/4/25 0025
 * Time: 14:35
 */
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller{
    public function login() {
        if (isset($_POST['username']) && $_POST['username'] != ''){
            if (empty($_POST['password'])) {
                $return['success'] = false;
                $return['msg'] = '密码不能为空';
                $return['code'] = 5001;
                $this->ajaxReturn($return);
            }
            if (empty($_POST['verify'])) {
                $return['success'] = false;
                $return['msg'] = '验证码不能为空';
                $return['code'] = 5001;
                $this->ajaxReturn($return);
            }
//            \Org\Util\Rbac::authenticate();


        }
        $this->display();
    }

    public function verify($length=4,$imageW=0,$imageH=0) {
        $config['length'] = $length;
        $config['imageW'] = $imageW;
        $config['imageH'] = $imageH;
        $Verify = new \Think\Verify($config);
        $Verify->entry();
    }

}