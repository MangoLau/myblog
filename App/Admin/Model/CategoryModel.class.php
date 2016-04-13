<?php
/**
 * Created by PhpStorm.
 * User: mangolau
 * Date: 2/9/16
 * Time: 11:55 PM
 */
namespace Admin\Model;
use Think\Model;

class CategoryModel extends Model{
    /**
     * @var array
     * 自动验证
     */
    protected $_validate = array(
        array('name','require','标题必须！', self::MUST_VALIDATE),
        array('name','1,64','类型名长度不能超过64位',self::MUST_VALIDATE,'length',self::MODEL_BOTH),
        array('remark','0,64','备注长度不能超过64位',self::MUST_VALIDATE,'length',self::MODEL_BOTH),
    );

    /**
     * @var array
     * 自动完成
     */
    protected $_auto = array (
        array('created','datetime',self::MODEL_INSERT,'callback'),
        array('modified','datetime',self::MODEL_BOTH,'callback'),
    );

    /**
     * @return bool|string
     * 当前时间
     */
    protected function datetime(){
        return date('Y-m-d H:i:s');
    }

    /**
     * @param $id
     * @return mixed
     * 删除$id的类型，并删除这个类型下的所有子类
     */
    public function delCategorys($id) {
        if ( ! is_numeric($id)) return false;
        $idArrs = $this->seleteChilds($id);
        if ($idArrs) {
            $idStr = implode(',', $idArrs);
            $idStr .= ','.$id;
        } else {
            $idStr = $id;
        }
        return $this->delete($idStr);
    }

    /**
     * @param $pid
     * @return array|mixed
     * 查找id下的所有子类id
     */
    protected function seleteChilds($pid) {
        global $idArrs;
        if (is_array($pid)) {
            foreach($pid as $v) {
                $where['pid'] = $v;
                $ids = $this->where($where)->getField('id', true);
                if ($ids) $idArrs[] = $ids;
                $this->seleteChilds($ids);
            }
        } elseif (is_numeric($pid)){
            $where['pid'] = $pid;
            $ids = $this->where($where)->getField('id', true);
            if ($ids) $idArrs[] = $ids;
            $this->seleteChilds($ids);
        } else {
            return false;
        }

        $temp = array();
        foreach($idArrs as $k => $v) {
            if (is_array($v)) {
                $temp = array_merge($temp, $v);
            } elseif (is_numeric($v)) {
                $temp[] = $v;
            }
        }
        return array_unique($temp);
    }
}

?>