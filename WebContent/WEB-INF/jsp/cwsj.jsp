<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>商家信息填写</title>
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link type="text/css" rel="stylesheet" 
    href="bootstrap-3.3.5-dist/css/bootstrap.min.css" />
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
  <style type="text/css">
     .box1{ position:absolute; width:200px; height:200px; left:300px; top:200px} 
     label{
     	color:#FFFFFF
     }
  </style>
</head>

<body>

 <div class="col-md-6 col-md-offset-3 box1">

        <form action="cwsjwc.do" method="post">
        
        <div class="form-group">
           <label>地址</label>
           <input type="text" name="uar" placeholder="地址" class="form-control"  style="width:300px"/>
        </div>
         
         <div class="form-group">
           <label>QQ</label>
           <input type="text" name="upn" placeholder="QQ" class="form-control"  style="width:300px"/>
         </div>  
        <div class="form-group">
              <button type="submit" class="btn btn-primary">确定</button>
        </div> 
        </form>
</div> 

<!-- particles.js container -->
<div id="particles-js"></div>

<!-- scripts -->
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