<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
	  <thead>
	  <tr>
	     <th>商品号</th>
	     <th>商品名</th>
	     <th>库存量</th>
	     <th>单价</th>
	     <th>发布者</th>
	     
	  </tr>
	  </thead>
  <tbody>
      <c:forEach items="${listsc}" var="c">
     <tr>
         <td>${c.cid }</td>
	     <td>${c.cname }</td>
	     <td>${c.cs }</td>
	     <td>${c.cp }</td>
	     <td>${c.uid }</td>
	 </tr>
	 </c:forEach>
	</tbody>
</table>
</body>
</html>