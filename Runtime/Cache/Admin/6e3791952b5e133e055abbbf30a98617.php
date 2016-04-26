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
                        <h5>文章列表</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>文章</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th>修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                    <td><?php echo ($vo["id"]); ?></td>
                                    <td><a href="javascript:void(0);" class="catName" title="<?php echo ($vo["title"]); ?>"><?php echo ($vo["title"]); ?></a></td>
                                    <td><span class="catName"><?php echo ($vo["status"]); ?></span></td>
                                    <td><span class="catName"><?php echo ($vo["created"]); ?></span></td>
                                    <td><span class="catName"><?php echo ($vo["modified"]); ?></span></td>
                                    <td>
                                        <a title="修改" href="<?php echo U('altContent', array('aid' => $vo['id']));?>"><i class="icon-pencil"></i></a>
                                        <a class="del" href="javascript:void(0);" data-id="<?php echo ($vo['id']); ?>" title="删除" data-title="<?php echo ($vo['title']); ?>"><i class="icon-trash"></i></a></td>
                                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            <tr><td colspan="6"><?php echo ($page); ?></td></tr>
                            </tbody>
                        </table>
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


    <script type="application/javascript">
        $(function () {
            //删除
            $('.del').click(function(){
                var _id = $(this).attr('data-id'),_title = $(this).attr('data-title');
                if (!confirm('确定删除《'+_title+'》？')) {
                    return false;
                }
                $.ajax({
                    type: "GET",
                    url: "<?php echo U('Content/delContent');?>",
                    data: {id:_id},
                    success: function(result){
                        if(result.success){
                            alert('删除成功！');
                            window.location.reload();
                        } else {
                            alert(result.msg);
                        }
                    }
                });
            });
        });
    </script>

</body>
</html>