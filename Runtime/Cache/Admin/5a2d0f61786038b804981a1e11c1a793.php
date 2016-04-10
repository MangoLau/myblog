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
        <div class="altCategory pop-container">
            <h2>add文章</h2>
            <form>
                <div class="opt-nav"><label>标题</label><input type="text" name="title" id="title" class="opt-input" maxlength="64"/></div>
                <div class="opt-nav"><label>文章内容</label>
                    <!-- 加载编辑器的容器 里面写你的初始化内容-->
                    <textarea id="container" name="content"><?php echo ($list["content"]); ?></textarea>
                </div>
                <div class="opt-nav"><input type="button" name="submit" value="添加" class="button sure"/></div>
            </form>
        </div>
    </div>

    </div>




    <script src="/myblog/Public/Admin/js/jquery.min.js"></script>
    <script src="/myblog/Public/Admin/js/jquery.ui.custom.js"></script>
    <script src="/myblog/Public/Admin/js/bootstrap.min.js"></script>
    <script src="/myblog/Public/Admin/js/unicorn.js"></script>



    <!-- 配置文件 -->
    <script type="text/javascript" src="/myblog/Public/UEditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/myblog/Public/UEditor/ueditor.all.js"></script>

    <script type="application/javascript">
        //实例化编辑器
        var editor = UE.getEditor('container', {
            UEDITOR_HOME_URL : '/myblog/Public/UEditor/',//为编辑器实例添加一个路径，这个不能被注释
            serverUrl : "/myblog/Public/UEditor/php/controller.php", // 服务器统一请求接口路径
            initialFrameWidth : 960,
            initialFrameHeight : 400
        });
        $(document).ready(function(){
            $('form .sure').click(function(){
                var _title = $('#title').val(),
                        _content = editor.getContent();//获取html内容
                if(_title.trim == '' && _content.trim() ==''){
                    alert('标题不能为空！');
                    return false;
                } else {
                    $.ajax({
                        type: "POST",
                        url: "<?php echo U('Content/addContent');?>",
                        data: {title:_title,content:_content},
                        success: function(result){
                            if(result.success){
                                alert('添加成功！');
                                $('#main .content').load("<?php echo U('Content/index');?>");
                            } else {
                                alert(result.msg);
                            }
                        }
                    });
                }
            });
        });
    </script>

</body>
</html>