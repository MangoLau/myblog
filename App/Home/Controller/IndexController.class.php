<?php
/**
 * Created by PhpStorm.
 * User: MangoLau
 * Date: 2016/4/21 0021
 * Time: 15:00
 */

namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index() {
        $Content = M('Content');
        // 最新的10篇文章
        $newestContent = $Content->where(array('status'=>1))->order('created desc')->limit(10)->select();
        // 最热的10篇文章
        $hotestContent = $Content->field('id,title')->where(array('status'=>1))->order('hits desc,created desc')->limit(10)->select();
        // 归档显示5个月

        $this->assign('newest', $newestContent);
        $this->assign('hotest', $hotestContent);
        $this->display();
    }
}