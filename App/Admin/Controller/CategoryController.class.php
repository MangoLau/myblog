<?php
/**
 * Created by PhpStorm.
 * User: mangolau
 * Date: 1/14/16
 * Time: 6:16 PM
 */
namespace Admin\Controller;
use Think\Controller;
class CategoryController extends Controller {
    public function index(){
        $Dao = M();
        $sql = 'SELECT `id`,`name`,`pid`,`remark` FROM `cl_category` WHERE 1=1';
        $categoryArr = $Dao->query($sql);
        $categoryArr = indent_merge($categoryArr,0,0,'--');
        $this->assign('list', $categoryArr);
        $this->assign('captionTitle', '运动类型列表');
        $this->display();
    }

    public function alterCategory(){
	$Dao = M('Category');
	if(!trim($_POST['id'])){
	    $result['success'] = false;
	    $result['msg'] = '修改数据错误';
	    $this->ajaxReturn($result);
	}
	$data = array();
	$where['id'] = intval($_POST['id']);
	$data['pid'] = intval($_POST['pid']);
	$data['name'] = strval($_POST['name']);
	$data['remark'] = strval($_POST['remark']);
    $data['modefied'] = date('Y-m-d H:i:s');
	$result['data'] = $Dao->where($where)->save($data);
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

    public function addCategory(){
        $Dao = M();
        if($_POST['name']){
            $data = array();
            $data['pid'] = intval($_POST['pid']);
            $data['name'] = strval($_POST['name']);
            $data['remark'] = strval($_POST['remark']);
            $data['created'] = date('Y-m-d H:i:s');
            $data['modified'] = date('Y-m-d H:i:s');
            $sql = 'INSERT INTO `cl_category` (`name`,`pid`,`remark`,`created`,`modified`) VALUES ("'.$data['name'].'","'.$data['pid'].'","'.$data['remark'].'","'.$data['created'].'","'.$data['modified'].'")';
            $result['data'] = $Dao->execute($sql);
            if($result['data']){
                $result['success'] = true;
                $result['msg'] = '新增成功';
                $this->ajaxReturn($result);
            } else {
                $result['success'] = false;
                $result['msg'] = '数据新增失败';
                $result['fail'] = $Dao->getDbError();
                $this->ajaxReturn($result);
            }
        }
        $sql = 'SELECT * FROM `cl_category`';
        $categoryArr = $Dao->query($sql);
        $pid = $_POST['pid'] ? intval($_POST['pid']) : 0;
        $this->assign('pid', $pid);
        $this->assign('list', $categoryArr);
        $this->display();
    }

    public function delCategory(){
        $Dao = M('Category');
        if(!trim($_POST['id'])){
            $result['success'] = false;
            $result['msg'] = '删除数据错误';
            return json_encode($result);
        }
        $data['id'] = intval($_POST['id']);
        $sql = 'DELETE FROM `cl_category` WHERE `id` = '.$data['id'];
        $result['data'] = $Dao->execute($sql);
        if($result['data']){
            $result['success'] = true;
            $result['msg'] = '删除成功';
            return json_encode($result);
        } else {
            $result['success'] = false;
            $result['msg'] = '删除失败';
            $result['fail'] = $Dao->getDbError();
            return json_encode($result);
        }
    }
}
