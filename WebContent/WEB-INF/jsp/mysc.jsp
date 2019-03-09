<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script type="text/javascript" src="bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="css/mdb.min.css" rel="stylesheet">
     <!-- Font Awesome -->
    
    <style>
    main{ position:relative;top:100px} 
    .img-circle{border-radius:50%}
	.input-submit {
			background-color:transparent;
            width: 78px;
            height: 40px;
            border: 0;position: relative;top: 10px;opacity: 0 ;
            left:-60px;
        } 
    .uid{
            border: 0;   
			background-color:transparent;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>


<body class="backgr" >
  <!--Main Navigation-->
  <!--Navbar-->
  <nav class="navbar navbar-expand-lg navbar-dark rgba(255, 152, 0, 0.3) rgba-orange-light fixed-top" >
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
            <li class="nav-item">
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

          <form class="form-inline" action="search.do?first=0" method="post">
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
  <!--/.Navbar-->
  <!--Main Navigation-->

  <!--Main layout-->
  <main>
     <div class="w-responsive text-center mx-auto p-3 mt-2 jumbotron" id="biaoge">
         <table class="table table-striped">
	  <thead class="black white-text">
	  <tr>
	     <th>商品号</th>
	     <th>商品名</th>
	     <th>库存量</th>
	     <th>单价</th>
	  </tr>
	  </thead>
  <tbody>
      <c:forEach items="${listsc}" var="c">
     <tr>
         <td>${c.cid }</td>
	     <td>${c.cname }</td>
	     <td>${c.cs }</td>
	     <td>${c.cp }</td>
	 </tr>
	 
	 </c:forEach>
	 
	</tbody>
	
</table> 
<c:if test="${page.list.size()==0}">
 	<h1>空空如也(˘•ω•˘)</h1>
</c:if>
      </div>
  </main>
  <!--Main layout-->



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
	//if(${isStore}==1){
		//isStore();
	//}
		  

   </script>
   
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
	
<script>
var biaoge = document.getElementById("biaoge");
biaoge.onmouseover=function(){
	biaoge.style.opacity=1;
}
biaoge.onmouseout=function(){
	biaoge.style.opacity=0.7;
}
	
</script>
</body>

</html>