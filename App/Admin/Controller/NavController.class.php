<?php
/**
 * Created by PhpStorm.
 * User: mangolau
 * Date: 1/14/16
 * Time: 6:16 PM
 */
namespace Admin\Controller;
use Think\Controller;
class NavController extends CommonController {
    /**
     * 导航列表
     */
    public function index(){
        $Nav = M('Nav');
        $navArr = $Nav->select();
        $navArr = indent_merge($navArr);
        // 类型
        global $clist;
        $clist = array();// 消除全局变量带来的影响
        $cat = M('Category');
        $catArr = $cat->select();
        $catArr = indent_merge($catArr);
        // 前端展示节点
        $homenodeArr = M('Homenode')->where(array('pid'=>0))->select();
        $this->assign('nodes', $homenodeArr);
        $this->assign('cats', $catArr);
        $this->assign('list', $navArr);
        $this->display();
    }

    /**
     * 修改导航
     */
    public function altNav(){
        $Nav = D('Nav');
        if ($_POST['id']) {
            if( ! trim($_POST['id'])) {
                $result['success'] = false;
                $result['msg'] = '修改数据错误';
                $this->ajaxReturn($result);
            }
            $list = $Nav ->where(array('id'=>(int)$_POST['id'])) ->find();
            if ($list['pid'] != (int)$_POST['pid']) {
                $child = $Nav->where(array('pid'=>(int)$_POST['id']))->find();
                if (isset($child) && ! empty($child)) {
                    $return['success'] = false;
                    $return['code'] = 5003;
                    $return['msg'] = '此导航下还有子导航，不能更改所属父导航！';
                    $this->ajaxReturn($return);
                }
            }
            if ( ! $Nav->create()){
                $result['code'] = 5002;
                $result['success'] = false;
                $result['msg'] = '数据修改失败';
                $this->ajaxReturn($result);
            }
            $result['data'] = $Nav->save();
            if($result['data']){
                $result['success'] = true;
                $result['msg'] = '修改成功';
                $this->ajaxReturn($result);
            } else {
                $result['success'] = false;
                $result['msg'] = '数据修改失败';
                $this->ajaxReturn($result);
            }
        }
        if (isset($_GET['id'])) {
            $where['id'] = intval($_GET['id']);
            $NavArr = $Nav->where($where)->find();
            $list = $Nav->select();
            $list = indent_merge($list);//print_r($NavArr);die;
            $this->assign('list', $list);
            $this->assign('Nav', $NavArr);
            $this->display();
        }
    }

    /**
     * 增加导航
     */
    public function addNav() {
        $Nav = D('Nav');
        if($_POST['name']){
            if ( ! $Nav->create()){
                $result['success'] = false;
                $result['msg'] = '数据新增失败';
                $result['fail'] = $Nav->getError();
                $this->ajaxReturn($result);
            }
            $result['data'] = $Nav->add();
            if ($result['data']) {
                $result['success'] = true;
                $result['msg'] = '新增成功';
                $this->ajaxReturn($result);
            } else {
                $result['success'] = false;
                $result['msg'] = '数据新增失败';
                $result['fail'] = $Nav->getError();
                $this->ajaxReturn($result);
            }
        }
        $NavArr = $Nav->select();
        $NavArr = indent_merge($NavArr);
        $pid = $_GET['pid'] ? intval($_GET['pid']) : 0;
        $this->assign('pid', $pid);
        $this->assign('list', $NavArr);
        $this->display();
    }

    /**
     * 删除导航
     */
    public function delNav(){
        $Nav = D('Nav');
        if(!trim($_GET['id'])){
            $result['success'] = false;
            $result['msg'] = '删除数据错误';
            $this->ajaxReturn($result);
        }
        $id = (int)$_GET['id'];
        $childs = $Nav->where(array('pid'=>$id))->select();
        if (isset($childs) && $childs != null) {
            $result['success'] = false;
            $result['msg'] = '此导航还有子导航，不能删除！';
            $this->ajaxReturn($result);
        }
        $result['data'] = $Nav->delete($id);
        if($result['data']){
            $result['code'] = 200;
            $result['success'] = true;
            $result['msg'] = '删除成功';
            $this->ajaxReturn($result);
        } else {
            $result['code'] = 5002;
            $result['success'] = false;
            $result['msg'] = '删除失败';
            $result['fail'] = $Nav->getError();
            $this->ajaxReturn($result);
        }
    }
}
