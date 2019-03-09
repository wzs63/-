<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>登录</title>
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link type="text/css" rel="stylesheet" 
    href="bootstrap-3.3.5-dist/css/bootstrap.min.css" />
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
  <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
  <style type="text/css">
     .box1{ position:absolute; width:200px; height:200px; left:300px; top:200px} 
     label{
     	color:#FFFFFF
     }
          .backgr{
    background: url("image/pic4.jpeg")no-repeat center center fixed ;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  </style>
</head>

<body class="backgr">

 <div class="col-md-6 col-md-offset-3 box1">

        <form action="loginwc.do" method="post">
        
        <div class="form-group">
           <label>账户</label>
           <input type="text" name="uid" placeholder="用户名/手机" class="form-control"  style="width:300px"/>
        </div>
         
         <div class="form-group">
           <label>密码</label>
           <input type="password" name="up" placeholder="密码" class="form-control"  style="width:300px"/>
         </div>  
        <div class="form-group">
           <label>验证码：</label>
           <input type="text" name="verifyCode" size="5" /> 
           <img src="VerifyCode.do" /> <br/>
           <input type="password" name="yzm" placeholder="验证码" class="form-control"  style="width:300px"/>
         </div> 
        <div class="form-group">
              <button type="submit" class="btn btn-primary">登录</button>
        </div> 
 
          <div class="form-group">
              <a href="register.do" style='color:#FFFFFF'>注册</a>
          </div> 
     
        
        </form>
</div> 

<!-- particles.js container -->
<div id="particles-js"></div>

<!-- scripts -->
<script>
if(${islogincg}===0){
	alert("登录失败");
	}

</script>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>

<script>









  var count_particles, stats, update;
  stats = new Stats;
  stats.setMode(0);
  stats.domElement.style.position = 'absolute';
  stats.domElement.style.left = '0px';
  stats.domElement.style.top = '0px';
  document.body.appendChild(stats.domElement);
  count_particles = document.querySelector('.js-count-particles');
  update = function() {
    stats.begin();
    stats.end();
    if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
      count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
    }
    requestAnimationFrame(update);
  };
  requestAnimationFrame(update);
</script>

</body>
</html>