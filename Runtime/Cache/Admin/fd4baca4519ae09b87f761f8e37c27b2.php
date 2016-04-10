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
        <style>
            .pop-altCategory{
                position: absolute;
                top: 50%;
                left: 50%;
                margin-top: -110px;
                margin-left: -250px;
                display: none;
            }
            .altCategory{
                width: 500px;
                height: 200px;
                background: #eee;
            }
            .opt-nav{
                display: block;
                width: 300px;
                height: auto;
                margin: 18px auto;
                overflow: hidden;
            }
            .opt-nav label{
                display: block;
                width: 100px;
                float: left;
                margin-right: 20px;
            }
            .opt-nav .opt-input{
                width: 150px;
            }
            .pop-delCategory{
                width: 500px;
                height: 200px;
                background: #eee;
                margin: 100px auto;
                z-index: 99;
                display: none;
            }
            .pop-delCategory p{
                width: 80%;
                line-height: 150px;
                margin: 0 auto;
            }
            .pop-delCategory p span{
                font-weight: bold;
            }
            .pop-delCategory .choose{
                width: 40%;
                margin: 0 auto;
            }
        </style>
        <h2>类型列表</h2>
        <table class="sportstype">
            <caption><?php echo ($captionTitle); ?></caption>
            <tr><th>id</th><th>类型名</th><th>操作</th></tr>
            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr><td><?php echo ($vo["id"]); ?></td><td><span class="catName"><?php echo ($vo["pad"]); echo ($vo["name"]); ?></span></td><td><span class="act alter" title="<?php echo ($vo["name"]); ?>" remark="<?php echo ($vo["remark"]); ?>" pid="<?php echo ($vo["pid"]); ?>" actid="<?php echo ($vo["id"]); ?>">修改</span>｜<span class="act add" title="<?php echo ($vo["name"]); ?>" actid="<?php echo ($vo["id"]); ?>">添加子类</span>｜<span class="act del" title="<?php echo ($vo["name"]); ?>" actid="<?php echo ($vo["id"]); ?>">删除</span></td></tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </table>
        <div class="altCategory pop-altCategory">
            <form>
                <div class="opt-nav">
                    <label>父类型</label>
                    <select name="pCategory" class="opt-input">
                        <option value="0" selected="selected">大类</option>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
                <div class="opt-nav"><label>类型名</label><input type="text" name="categoryName" class="opt-input" maxlength="64"/></div>
                <div class="opt-nav"><label>备注</label><input type="text" name="remark" class="opt-input" maxlength="64"/></div>
                <div class="opt-nav"><input type="button" name="submit" class="button sure" value="修改"/><input type="button" value="取消" class="button cancel"/></div>
            </form>
        </div>
        <div class="pop-delCategory">
            <p>删除类型:<span>足球</span>吗？</p>
            <div class="choose">
                <input type="button" class="sure button" value="确定"/>
                <input type="button" class="cancel button" value="取消"/>
            </div>
        </div>
    </div>

    </div>




    <script src="/myblog/Public/Admin/js/jquery.min.js"></script>
    <script src="/myblog/Public/Admin/js/jquery.ui.custom.js"></script>
    <script src="/myblog/Public/Admin/js/bootstrap.min.js"></script>
    <script src="/myblog/Public/Admin/js/unicorn.js"></script>


</body>
</html>