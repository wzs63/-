<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link type="text/css" rel="stylesheet" 
    href="bootstrap-3.3.5-dist/css/bootstrap.min.css" />
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
  <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
  <script src="js/jquery.md5.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
 
<style type="text/css">
     .box1{ position:absolute; width:200px; height:200px; left:234px; top:200px} 
     label{
     	color:#FFFFFF
     }
  </style>

</head>
<body>

    <div class="col-md-6 col-md-offset-3 box1">
        <form action="registerwc.do" method="post" onsubmit="return checkForm()">
        <div class="form-group">
           <label>账户</label>
           <input type="text" name="uid" placeholder="用户名" class="form-control" style="width:300px"/>
        </div>
         <div class="form-group">
           <label>邮箱</label>
           <input type="text" name="email" id="emailAddress" placeholder="邮箱" class="form-control" style="width:300px"/>
           <button id="checkEmail" type="button" class="btn btn-primary">验证邮箱</button>
        </div>
          <div class="form-group">
           <label>验证码</label>
           <input type="text" id="emailCode" placeholder="验证码" class="form-control" style="width:300px"/>
          </div>
         <div class="form-group">
           <label>密码</label>
           <input type="password" id="input-password" placeholder="密码" class="form-control" style="width:300px"/>
       	 </div>  
        
        <div class="form-group">
           <label>确认密码</label>
           <input type="password" id="input-password2" placeholder="确认密码" class="form-control" style="width:300px"/>
        </div> 
        
      <input type="hidden" name="up" />
      
        <div class="form-group">
              <button type="submit" class="btn btn-primary">确定</button>
        </div> 
          <div class="form-group">
              <a href="login.do">返回</a>
        </div> 
        
      <!--   <div class="form-group" style="color:red;">${message}</div> -->
         </form>
     </div> 
     
<!-- particles.js container -->
<div id="particles-js"></div>

<!-- scripts -->
 <script>
function checkForm() {
	  var emailCode = document.getElementById("emailCode").value;//输入的验证码
	  var p1 = document.getElementById("input-password").value;//设置密码
	  var p2 = document.getElementById("input-password2").value;//重复输入密码
	  var md5_pwd = document.getElementsByName('up')[0];
	  if(emailCode != code) {
		   alert("邮箱验证码错误");
		   return false;
	   }
	   if(p1 === p2) {
		   alert("bingo"+p1+" "+p2);
		  	// 把用户输入的明文变为MD5:
		  	md5_pwd.value = $.md5(p1);
		  	// alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
		  	console.log("md:" + md5_pwd.value);
		  	//alert("bingo"+p1+" "+p2+" "+md5_pwd.value);
		   return true;
	   }else{
		   alert("两次密码不相同");
		   return false;
	   }
	   return true;
}
var code = "6f3b22a5f28c40509cd17473597b405e"
var checkEmail = document.getElementById("checkEmail")
checkEmail.onclick = function() {
	 $.ajax({
     	async:true,
         url: "checkEmail.do",
         type: "POST",
         data:{"emailAddress":document.getElementById("emailAddress").value},
         dataType: "json",
         success:function(data){
        	//console.log(data);
         	//console.log(data.code);
         	code = data.code;
         }

		 });
	
	// 
	// var emailAddress =  document.getElementById("emailAddress").value;
	// // 创建 AJAX 对象
	// var r = new XMLHttpRequest();
	// // 设置请求方法和请求地址
	// r.open('POST', 'checkEmail.do', true);
	// // 设置发送的数据的格式
	// r.setRequestHeader('Content-Type', 'application/json');
	// // 注册响应函数
	// r.onreadystatechange = function() {
//	  //   if (r.readyState === 4) {
//	         //console.log('state change', r, r.status, r.response);
//	       //  var response = JSON.parse(r.response);
	// 
//	         console.log( response);
//	     //} else {
//	       //  alert("发送验证信息失败，请确认邮箱无误后重试");
//	     //    console.log('change');
//	   //  }
	// }
	// // 发送请求
	// var account = {
//	 //    emailAddress : emailAddress
	// }
	// var data = JSON.stringify(account)
	// console.log(data);
	// r.send(data)
	
	
	
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