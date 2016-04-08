<?php
/**
 * Created by PhpStorm.
 * User: mangolau
 * Date: 2/11/16
 * Time: 9:50 PM
 */
function menuLinks(){
    $menuLinks = array(
        array(
            'name'=>'Category',
            'title'=>'类型',
            'childs' => array(
                array(
                    'name' => 'index',
                    'title' => '类型列表'
                ),
                array(
                    'name' => 'addCategory',
                    'title' => '添加类型'
                ),
            ),
        ),
        array(
            'name'=>'Content',
            'title'=>'文章',
            'childs' => array(
                array(
                    'name' => 'index',
                    'title' => '文章列表'
                ),
                array(
                    'name' => 'addContent',
                    'title' => '添加文章'
                ),
            ),
        ),
        array(
            'name'=>'User',
            'title'=>'用户',
            'childs' => array(
                array(
                    'name' => 'index',
                    'title' => '用户列表'
                ),
                array(
                    'name' => 'addUser',
                    'title' => '添加用户'
                ),
            ),
        ),
        array(
            'name'=>'Node',
            'title'=>'节点',
            'childs' => array(
                array(
                    'name' => 'index',
                    'title' => '节点列表'
                ),
                array(
                    'name' => 'addNode',
                    'title' => '添加节点'
                ),
            ),
        ),
        array(
            'name'=>'Role',
            'title'=>'角色',
            'childs' => array(
                array(
                    'name' => 'index',
                    'title' => '角色列表'
                ),
                array(
                    'name' => 'addRole',
                    'title' => '添加角色'
                ),
            ),
        )
    );
    return $menuLinks;
}

/**
 * 递归重组节点信息为多维数组
 * @param unknown $node  要处理的节点数组
 * @param number $pid	 父级id
 */
function node_merge($node, $access = NULL, $pid = 0) {
    $arr = array();

    foreach ($node as $v) {
        if (is_array($access)) {
            $v['access'] = in_array($v['id'], $access) ? 1 : 0;
        }
        if ($v['pid'] == $pid) {
            $v['child'] = node_merge($node, $access, $v['id']);
            $arr[] =$v;
            unset($v);
        }
    }
    return $arr;
}

/**
 * 初始化多级栏目显示，防止递归产生值错误
 * 显示多级栏目层次表
 * @param array $array  栏目数组结构信息 array(栏目ID=>父栏目ID,)
 * @param string $pid   要搜索的父栏目ID 0为顶级栏目
 * @param string $pad   间隔字符
 * @param int $padnum   要间隔的字符数量
 * @return array()
 */
function indent_merge($array,$pid=0,$padnum=0,$pad='++'){
    global $clist;
    $list = array();
    foreach ($array as $v){
        if ($v['pid'] == $pid) {
            $list[] = $v;
            unset($v);					//释放词数组键值对
        }
    }
    if (!empty($list)) {
        foreach ($list as $v){
            $v['pad'] = str_repeat($pad,$padnum);
            $clist[] = $v;
            indent_merge($array,$v['id'],$padnum+1,$pad);
        }
    }
    return $clist;
}
?>