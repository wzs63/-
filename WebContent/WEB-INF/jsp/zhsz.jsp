<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="UTF-8">

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>账户设置</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style2.css" rel="stylesheet">
<style>
	.img-circle{border-radius:50%}
	.input-submit {
			background-color:transparent;
            width: 78px;
            height: 40px;
            border: 0;position: relative;top: 10px;opacity: 0 ;
            left:-60px;
        } 
        .backgr{
    background: url("image/pic4.jpeg")no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
  .tx{
        	 width: 40px;
            height: 40px;
        }
</style>
</head>

<body class="backgr"> 
<nav class="navbar navbar-expand-lg navbar-dark rgba(0, 0, 0, 0) rgba-orange-light fixed-top" >
    <!--nav class="navbar navbar-expand-lg navbar-dark primary-color"-->

      <div class="container">

        <!-- Navbar brand -->
        <a class="navbar-brand" href="#">小商品作业</a>

        <!-- Collapse button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="basicExampleNav">

          <!-- Links -->
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="zhuye.do">主页</a>
            </li>
            <li id="cwsjli" class="nav-item">
              <a class="nav-link" href="cwsj.do">成为商家</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="gwc.do">购物车</a>
            </li>
            
			<c:if test="${isStore==1}">
			<li class="nav-item">
              <a class="nav-link" href="sc.do">上传商品</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="listsc.do">我的上传</a>
            </li>
			</c:if>
			
          </ul>
          <!-- Links -->

          <form class="form-inline" action="search.do" method="post">
            <div class="md-form my-0">
              <input class="form-control mr-sm-2" name="part"  type="text" placeholder="Search" aria-label="Search">
               <i class="fa fa-search text-white" aria-hidden="true"></i>
               <input type="submit" value=""  class=" fa fa-search text-white input-submit">
            </div>
          </form>
               
            
        </div>
        <!-- Collapsible content -->
 
      </div>
      		<ul class="navbar-nav mr-auto">
      			  
      			  <c:if test="${uid==null }"><li class="nav-item dropdown"><a class="dropdown-item pull-right" href="login.do" >登录</a></li></c:if>
				  <c:if test="${uid!=null }">
				  <li class="nav-item">
				   <a href="ggtx.html"><img class="img-circle tx" src="image/${tximg}"></a>
				  </li>
				  <li class="nav-item dropdown">
				   <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
>${uid}</a>
				    <div class="dropdown-menu dropdown-primary pull-right" aria-labelledby="navbarDropdownMenuLink">
					 <a class="dropdown-item pull-right" href="login.do">退出登录</a>
					 <a class="dropdown-item pull-right" href="#">账户设置</a>
					 <a class="dropdown-item pull-right" href="#">更多</a>
				    </div>
				  </li>
					  </c:if>
					
				 </ul>
    </nav>
<main>
  <div class=" container">
  	<form action="xgpassword.do" method="post">
    <div class=" text-center mx-auto p-3 mt-5 jumbotron ">
    
        <div class="view view-cascade py-3 gradient-card-header w-responsive mx-auto black white-text">
            <h5 class="mb-0 ">密码修改</h5>
        </div>
        <div class="md-form w-50  mx-auto ">
            <textarea type="text" name="oldPassword" class="md-textarea form-control" rows="1"></textarea>
            <label>旧密码</label>
        </div>
        <div class="md-form w-50  mx-auto ">
            <textarea type="text"  name="newPassword" class="md-textarea form-control" rows="1"></textarea>
            <label ><i class="fa fa-pencil-alt prefix"></i>新密码</label>
        </div>
        
        <button type="submit" class="btn  btn-primary ml-3 ">
            <i class="fa fa-upload"aria-hidden="true">  确定</i>
        </button>
    </div>
    </form>
  </div>
</main>
</body>

<!-- SCRIPTS -->
<script type="text/javascript">
	function isStore(){
		// 拿到待删除节点:
		var self = document.getElementById('cwsjli');
		// 拿到父节点:
		var parent = self.parentElement;
		// 删除:
		 parent.removeChild(self);
	}
	<c:if test="${isStore==1}">
		isStore();
	</c:if>

	
	if('${xgpwMassage}'!=''){
		alert('${xgpwMassage}');
	}
   </script>
<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
</html>