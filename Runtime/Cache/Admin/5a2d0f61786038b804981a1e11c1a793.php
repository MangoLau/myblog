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

    <div id="content">
        <div id="breadcrumb">
            <a href="<?php echo U('Index/index');?>" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
            <?php if(is_array($breadcrumb)): $i = 0; $__LIST__ = $breadcrumb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a href="<?php echo ($v["link"]); ?>" class="current"><?php echo ($v["title"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
						<span class="icon">
							<i class="icon-th"></i>
						</span>
                        <h5>文章添加</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">文章标题</label>
                                <div class="controls">
                                    <input type="text" id="title" name="title" maxlength="64" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">所属类别</label>
                                <div class="controls">
                                    <select name="cid" id="cid">
                                        <option value="0">请选择类别</option>
                                        <?php if(is_array($categoryArr)): $i = 0; $__LIST__ = $categoryArr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo['id']); ?>"><?php echo ($vo['pad']); echo ($vo['name']); endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">SEO关键词</label>
                                <div class="controls">
                                    <input type="text" id="keyword" name="keyword" maxlength="256" placeholder="关键词之间用英文符 , 隔开" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">SEO描述</label>
                                <div class="controls">
                                    <input type="text" id="description" name="description" maxlength="256" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">文章内容</label>
                                <div class="controls">
                                    <textarea id="container" name="content" >
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="button" class="btn btn-primary sure">保存</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
            initialFrameHeight : 300
        });
        $(document).ready(function(){
            $('form .sure').click(function(){
                var _title = $('#title').val(),
                        _cid = $('#cid').val(),
                        _keyword = $('#keyword').val(),
                        _description = $('#description').val(),
                        _content = editor.getContent();//获取html内容
                if(_title.trim() == '' && _content.trim() ==''){
                    alert('标题不能为空！');
                    return false;
                } else if(_cid == 0){
                    alert('请选择所属类别！');
                    return false;
                } else {
                    $.ajax({
                        type: "POST",
                        url: "<?php echo U('Content/addContent');?>",
                        data: {title:_title,cid:_cid,keyword:_keyword,description:_description,content:_content},
                        success: function(result){
                            if(result.success){
                                alert('添加成功！');
                                window.location.href = "<?php echo U('Content/index');?>";
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