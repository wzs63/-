<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%! int price = 0; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>search_comm_table</title>
   <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style2.css" rel="stylesheet">
    
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
         <table class="table">
             <thead class="black white-text">
                         <tr>
                            <th scope="col">id</th>
                             <th scope="col">名称</th>
                             <th scope="col">单价</th>
                             <th scope="col">数量</th>
                             <th scope="col">选择</th>
                         </tr>
                         </thead>
             <tbody>
                         <c:forEach items="${purchaseList}" var="purchases"  varStatus="st">
						     <tr>
						       		<td>${purchases.cid}</td>
						       		<td>${purchases.cname}</td>
						       		<td>${purchases.jiage}</td>
						            <td>${purchases.psum}</td>
						            
						            <td>
                                 <div class="custom-control custom-checkbox">
                                     <input type="checkbox" class="custom-control-input" id="Checked${st.count }" name="checked" data-cid='${purchases.cid}' data-jiage='${purchases.jiage}' data-psum='${purchases.psum}'>
                                     <label class="custom-control-label" for="Checked${st.count }">选择</label>
                                 </div>
                             </td>
                                	
                            	 
							 </tr>
							 </c:forEach>
                         </tbody>
                                
         </table>
         <c:if test="${purchaseList.size()==0}">
							 	<h1>空空如也(˘•ω•˘)</h1>
							 </c:if>
         <button type="button" class="btn  btn-info btn-rounded btn-lg" id= "buy" >
          <i class="fa fa-cart-plus"  aria-hidden="true"> 确定购买</i>
         </button>
        	
<h1 id=price>0</h1>
     </div>

  </main>
  <!--Main layout-->



  <!-- SCRIPTS -->
  
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
	<c:if test="${isStore==1}">
		isStore();
	</c:if>
	//if( ${isStore }==1){
		//isStore();
//	}
	
	var checked = document.getElementsByName("checked");
	        for (var i = 0; i <= checked.length - 1; i++) {
	            checked[i].onclick=buy;
	        }
	 var btn_buy = document.getElementById('buy');
		btn_buy.onclick = buy ;
	    function buy(eventObj) {
	    	var really;
	    	if(eventObj.target.id=='buy'){really=1;}
	    	else{really=0;}
	    	console.log("怎么肥四");
	    	var checked = document.getElementsByName("checked");
	        var cids = [];
	        var jiages = [];
	        var psums = [];
	        for (var i = 0; i <= checked.length - 1; i++) {
	            if (checked[i].checked == true) {
	                cids.push(checked[i].dataset.cid);
	                jiages.push(checked[i].dataset.jiage);
	                psums.push(checked[i].dataset.psum);
	            }
	           
	        }
	        console.log(cids);
	        console.log(jiages);
	        console.log(psums);
	        console.log(really);
	        var price=document.getElementById("price");
	        if(cids.length==0&&really==0){
                price.innerText=0;
	        }else if(cids.length==0&&really==1){
	        	price.innerText="啥都没选买个啥 (*｀皿´*)ﾉ ";
	        }else{
		        $.ajax({
	                async:false,
	                type: "POST",
	                url: "buy.do",//注意路径
	                data:{'cids':cids,"jiages":jiages,'psums':psums,'really':really},
	                dataType:"json",
	                success:function(data){
	                	var price=document.getElementById("price");
	                    price.innerText=data.result;
	                },
	                error:function(data){
	                    alert(data.result);
	                }
	            });
	        }
	    }
	    
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
   

</script>	
</body>
</html>