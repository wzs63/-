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


<body class="backgr">
  <!--Main Navigation-->
  <!--Navbar-->
  <nav class="navbar navbar-expand-lg navbar-dark rgba(255, 152, 0, 0.3) rgba-orange-light fixed-top" >
    <!--nav class="navbar navbar-expand-lg navbar-dark primary-color"-->

      <div class="container">
          <form class="form-inline" action="search.do?first=0" method="post">
            <div class="md-form my-0">
              <input class="form-control mr-sm-2" name="part"  type="text" placeholder="Search" aria-label="Search">
               <i class="fa fa-search text-white" aria-hidden="true"></i>
               <input type="submit" value=""  class=" fa fa-search text-white input-submit">
            </div>
          </form>
               
            
        </div>
        <!-- Collapsible content -->
      		<ul class="navbar-nav mr-auto">
      		
				  <li class="nav-item dropdown">
				   <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
>${uid}</a>
				    <div class="dropdown-menu dropdown-primary pull-right" aria-labelledby="navbarDropdownMenuLink">
					 <a class="dropdown-item pull-right" href="adlogin.do">退出登录</a>
					 <a class="dropdown-item pull-right" href="#">账户设置</a>
					 <a class="dropdown-item pull-right" href="#">更多</a>
				    </div>
				  </li>
					
				 </ul>
				
		
         
    </nav>
  <!--/.Navbar-->
  <!--Main Navigation-->

  <!--Main layout-->
  <main>
     <div class="w-responsive text-center mx-auto p-3 mt-2 jumbotron" id=biaoge >
         <table class="table table-striped">
	  <thead class="black white-text">
	  <tr>
	     <th>用户名</th>
	     <th>密码</th>
	     <th>QQ</th>
	     <th>地址</th>
	     <th>删除</th>
	  </tr>
	  </thead>
  <tbody>
      <c:forEach items="${list}" var="c">
     <tr>
         <td>${c.uid }</td>
	     <td>${c.up }</td>
	     <td>${c.upn }</td>
	     <td>${c.uar }</td>
	    
	 	<td>
               	<a href="deleteuser.do?uid=${c.uid }">删除</a>
        </td>
	 </tr>
	 
	 </c:forEach>
	 
	</tbody>
	
</table> 
<c:if test="${list.size()==0}">
	 	<h1>空空如也(˘•ω•˘)</h1>
	 </c:if>
   
      </div>
  </main>
  
  <script type="text/javascript">
	
	var biaoge = document.getElementById("biaoge");
	biaoge.onmouseover=function(){
		biaoge.style.opacity=1;
	}
	biaoge.onmouseout=function(){
		biaoge.style.opacity=0.7;
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
	
	<script>
function jiagwc(cid,cname,cp){
	
	$.ajax({
		async:false,
		type: "POST",
		url: "addpurchase.do",//注意路径
		data:{'cid':cid,"cname":cname,'cp':cp},
		dataType:"json",
		success:function(data){
			if(data.result=='操作成功'){
				alert("成功");
			}else{
				alert("失败，失败原因【" + data + "】");
			}
		},
		error:function(data){
			alert(data.result);
		}
		});
}

	
	
	
</script>
</body>

</html>