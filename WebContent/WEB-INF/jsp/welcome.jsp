<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>COMMODITY</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">

  <!-- Your custom styles (optional) -->
  <style type="text/css">
    html,
    body,
    header,
  	#intro {
    height: 100%;
}

	#intro {
		background: url(image/02.jpeg) center;
	    -webkit-background-size: cover;
	    -moz-background-size: cover;
	    -o-background-size: cover;
	    background-size: cover;
	    
	}
	.img-circle{border-radius:50%}
	.input-submit {
			background-color:transparent;
            width: 78px;
            height: 40px;
            border: 0;position: relative;top: 10px;opacity: 0 ;
            left:-60px;
        } 
    
        .tx{
        	 width: 40px;
            height: 40px;
        }
  </style>
<title>Welcome!</title>
</head>
<body>

  <!-- Start your project here-->
  <!-- Main Navigation-->
  <header>
    <!--Navbar-->
    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-color rgba(255, 152, 0, 0.3) fixed-top" >
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
            <li class="nav-item ">
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
               <input type="submit" class=" fa fa-search text-white input-submit">
            </div>
          </form>
               
            
        </div>
        <!-- Collapsible content -->
 
      </div>
      		<ul class="navbar-nav mr-auto">
      			  
      			  <c:if test="${uid==null }"><li class="nav-item dropdown"><a class="dropdown-item pull-right" href="login.do" >登录</a></li>
      			  <li class="nav-item dropdown"><a class="dropdown-item pull-right" href="adlogin.do" >管理员身份登录</a></li>
      			  </c:if>
				  <c:if test="${uid!=null }">
				  <li class="nav-item">
				   <a href="ggtx.html">
				   <img class="img-circle tx" src="/tximg/${tximg } ">
				   </a>
				  </li>
				  <li class="nav-item dropdown">
				   <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
>${uid}</a>
				    <div class="dropdown-menu dropdown-primary pull-right" aria-labelledby="navbarDropdownMenuLink">
					 <a class="dropdown-item pull-right" href="zhuxiao.do">注销</a>
					 <a class="dropdown-item pull-right" href="zhsz.do">账户设置</a>
					  </div>
				  </li>
					  </c:if>
					
				  
				 </ul>
				
		
         
    </nav>
    <!--/.Navbar-->
    <!--Mask-->
    <!--Mask-->
    <div id="intro" class="view">

      <div class="mask rgba-black-strong">

        <div class="container-fluid d-flex align-items-center justify-content-center h-100">

          <div class="row d-flex justify-content-center text-center">

            <div class="col-md-10">

              <!-- Heading -->
              <h2 class="display-4 font-weight-bold white-text pt-5 mb-2">Welcome</h2>

              <!-- Divider   一条线？？？-->
              <hr class="hr-light">

              <!-- Description -->
              <h4 class="white-text my-4">数据库大作业</h4>
              <button type="button" class="btn btn-outline-white" onclick="change()">more</button>

            </div>

          </div>

        </div>

      </div>

    </div>
    <!--/.Mask-->
    <!--/.Mask-->
  </header>
  <!-- Main Navigation-->

 
  <!--Main layout-->
  <main class="mt-5">
    <div class="container">

      <!--Section: Best Features-->
      <section id="best-features" class="text-center">

        <!-- Heading -->
        <h2 class="mb-5 font-weight-bold">商品分类</h2>

       <!--Grid row-->
        <div class="row d-flex justify-content-center mb-4">

        </div>
        <!--Grid row-->

        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-md-4 mb-1">
            <a href="sportslist.do?first=0"><i class="fa fa-camera-retro fa-4x orange-text"></i></a>
            <h4 class="my-4 font-weight-bold">运动器材</h4>
            <p class="green-text">篮球，足球，羽毛球拍，乒乓球拍等。</p>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-4 mb-1">
            <a href="zspslist.do?first=0"><i class="fa fa-futbol-o fa-4x orange-text" aria-hidden="true"></i></a>
            <h4 class="my-4 font-weight-bold">小物品装饰</h4>
            <p class="green-text">台灯，镜子，手办等</p>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-4 mb-1">
            <a href="bookslist.do?first=0"><i class="fa fa-pencil fa-4x orange-text" aria-hidden="true"></i></a>
            <h4 class="my-4 font-weight-bold">书</h4>
            <p class="green-text">教材，卷子，小说等。</p>
          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </section>
      <!--Section: Best Features-->

      <hr class="my-5">

      <!--Section: Examples-->
      <section id="examples" class="text-center">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-4 col-md-12 mb-4">
              <div class="view overlay z-depth-1-half">
              <img src="https://mdbootstrap.com/img/Photos/Others/images/48.jpg" class="img-fluid" alt="">
              <a href="#!"><!--rediret if user clicks any of the images-->
                <div class="mask "></div>
              </a>
              </div>
              <h4 class="my-4 font-weight-bold">Heading</h4>
              <p class="grey-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores nam,
                aperiam minima
                assumenda deleniti hic.</p>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-4 col-md-6 mb-4">

            </div>
            <!--Grid column-->
            <!--Grid column-->
            <div class="col-lg-4 col-md-12 mb-4">

            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->
        <!--Grid row-->
        <div class="row">
          <!--Grid column-->
          <div class="col-lg-4 col-md-12 mb-4">

          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-lg-4 col-md-6 mb-4">

          </div>
          <!--Grid column-->
          <!--Grid column-->
          <div class="col-lg-4 col-md-12 mb-4">

          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->




      </section>
      <!--Section: Examples-->

      <hr class="my-5">

      <!--Section: Gallery-->
      <section id="gallery">



      </section>
      <!--Section: Gallery-->

      <hr class="my-5">

      <!--Section: Contact-->
      <section id="contact">



      </section>
      <!--Section: Contact-->

    </div>
  </main>
  <!--Main layout-->


  <!--Footer-->
  <!-- Footer -->
  <footer class="page-footer font-small blue pt-4 mt-4">

    <!-- Footer Links -->
    <div class="container-fluid text-center text-md-left">

      <!-- Grid row -->
      <div class="row">

        <hr class="clearfix w-100 d-md-none pb-3">


        
      </div>
      <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <!-- Copyright -->
    
    <!-- Copyright -->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- JavaScript -->
 <script type="text/javascript">
	  
	function change(){
	   	var intro = document.getElementById("intro");
	   	var i = intro.style.backgroundImage.charAt('12');//获取图片编号
	   	i=(i+1)%7+1;//1~3
	   	intro.style.background='url(image/0'+i+'.jpeg) center';
	  }
	
	function isStore(){
		// 拿到待删除节点:
		var self = document.getElementById('cwsjli');
		// 拿到父节点:
		var parent = self.parentElement;
		// 删除:
		 parent.removeChild(self);
	}
	if('${isStore}'==1){
		isStore();
	}
   </script>
  <script type="text/javascript" src="js/mdb.min.js"></script>
  
</body>
</html>