<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<!-- container-fluid -->
<head>
    
        <title>MangoLau Admin</title>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
        <link rel="stylesheet" href="/myblog/Public/Admin/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/myblog/Public/Admin/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="/myblog/Public/Admin/css/unicorn.main.css" />
        <link rel="stylesheet" href="/myblog/Public/Admin/css/unicorn.grey.css" class="skin-color" />
    
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>


<div id="header">
    <h1><a href="<?php echo U('Index/index');?>">MangoLau Admin</a></h1>
</div>

<!--<div id="search">
    <input type="text" placeholder="Search here..." /><button type="submit" class="tip-right" title="Search"><i class="icon-search icon-white"></i></button>
</div>-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
        <li class="btn btn-inverse"><a title="" href="<?php echo U('Public/logout');?>"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
</div>


    <div id="sidebar">
        <a href="<?php echo U('Index/index');?>" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="active"><a href="<?php echo U('Index/index');?>"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>节点管理</span> <span class="label">2</span></a>
                <ul>
                    <li><a href="<?php echo U('Node/index');?>">节点列表</a></li>
                    <li><a href="<?php echo U('Node/addNode');?>">节点添加</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>角色管理</span> <span class="label">2</span></a>
                <ul>
                    <li><a href="<?php echo U('Role/index');?>">角色列表</a></li>
                    <li><a href="<?php echo U('Role/addRole');?>">角色添加</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>用户管理</span> <span class="label">2</span></a>
                <ul>
                    <li><a href="<?php echo U('User/index');?>">用户列表</a></li>
                    <li><a href="<?php echo U('User/addUser');?>">用户添加</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>文章类别</span> <span class="label">2</span></a>
                <ul>
                    <li><a href="<?php echo U('Category/index');?>">文章类别列表</a></li>
                    <li><a href="<?php echo U('Category/addCategory');?>">文章类别添加</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>文章</span> <span class="label">2</span></a>
                <ul>
                    <li><a href="<?php echo U('Content/index');?>">文章列表</a></li>
                    <li><a href="<?php echo U('Content/addContent');?>">文章添加</a></li>
                </ul>
            </li>
        </ul>

    </div>


<div id="style-switcher">
    <i class="icon-arrow-left icon-white"></i>
    <span>Style:</span>
    <a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
    <a href="#blue" style="background-color: #2D2F57;"></a>
    <a href="#red" style="background-color: #673232;"></a>
</div>


    <div id="content">
        <div id="content-header">
            <h1><?php echo ($h); ?></h1>
        </div>
        <div id="breadcrumb">
            <a href="<?php echo U('Index/index');?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
            <?php if(is_array($breadcrumb)): $i = 0; $__LIST__ = $breadcrumb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a href="<?php echo ($v["link"]); ?>" class="current"><?php echo ($v["title"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        
    <div class="container-fluid">
        <h2>文章列表</h2>
        <table class="sportstype">
            <caption><?php echo ($captionTitle); ?></caption>
            <tr>
                <th>id</th>
                <th>文章</th>
                <th>状态</th>
                <th>创建时间</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr>
            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td><?php echo ($vo["id"]); ?></td>
                    <td><a href="javascript:void(0);" class="catName" title="<?php echo ($vo["title"]); ?>"><?php echo ($vo["title"]); ?></a></td>
                    <td><span class="catName"><?php echo ($vo["status"]); ?></span></td>
                    <td><span class="catName"><?php echo ($vo["created"]); ?></span></td>
                    <td><span class="catName"><?php echo ($vo["modified"]); ?></span></td>
                    <td><span class="act alter" title="<?php echo ($vo["title"]); ?>" actid="<?php echo ($vo["id"]); ?>">修改</span>｜<span class="act del" title="<?php echo ($vo["title"]); ?>" actid="<?php echo ($vo["id"]); ?>">删除</span></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </table>
    </div>

    </div>




    <script src="/myblog/Public/Admin/js/jquery.min.js"></script>
    <script src="/myblog/Public/Admin/js/jquery.ui.custom.js"></script>
    <script src="/myblog/Public/Admin/js/bootstrap.min.js"></script>
    <script src="/myblog/Public/Admin/js/unicorn.js"></script>


</body>
</html>