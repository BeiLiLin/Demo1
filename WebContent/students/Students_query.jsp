<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--根据页数读取相关的数据，适合大数据。（模型一） --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!--  
  <link href="${pageContext.request.contextPath}/css/pushy-buttons.css" rel="stylesheet">-->
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body{
		   margin:0px;
		   padding:0px;
		   background-color:#e5ebef;
		}
	#contain{
		 margin:0px;
		 padding:0px;
	}
	#top{
		
	}
	#left{
	float:left;
	}
	#left ul{
	
	list-style-type: none;
	text-align: center;
	margin: 0px;
	padding: 0px;
	padding-top: 50px;

	}
	#left li{
	margin: 0px;
	padding-top: 20px;
	padding-right: 0px;
	padding-bottom: 20px;
	padding-left: 80px;
	list-style-type: none;
	border-bottom-style: none;
	border-bottom-width: 1px;
	}
	a:link {
	color: #766960;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #766960;
}
a:hover {
	text-decoration: none;
	color: #333333;
}
a:active {
	text-decoration: none;
	color: #000000;
}
	#main{
		margin: 0px;
		padding-top:20px;
		padding-left:10px;
	}
	#pages {
	margin: 0px;
	padding-top: 20px;
	padding-left: 10px;
	position: absolute;
	right: 500px;
}
	#footer{
		
	}	
	#user{
	position:absolute;
	top:30px;
	right:30px;
	}
	#black{
	position:absolute;
	bottom:-45px;
	right:0px;
	}
	</style>
  </head>
 
  <body>
   <div id="contain">
  	<div id="top"><img src="image/top.jpg">
  				<div id="user">
  				<span style="color:#fff;">用户名：</span>
  				<span><font color="white" size="6px">${sessionScope.user }</font></span>
  				
  				<a href="http://localhost:8888/Demo1/users/LoginRegist.jsp"><font color="red" id="black">退出登录</font></a>
  				
  				</div>
  	</div>
  	<div id="left">
  		<ul>
				<li><a href="${pageContext.request.contextPath}/students/Students_query.action">数据表</a></li>
				<li><a href="${pageContext.request.contextPath}/links/Links_search.action">查询</a></li>
				<li><a href="${pageContext.request.contextPath}/links/Links_add.action">添加</a></li>			
			
			</ul>
			
  	</div>
  	<div id="main">
  	<h4 align="center">学生信息</h4> 
  		<table width="600" border="1" align="center" cellspacing="0">
  <tr>
 	<td>学生编号</td>
 		<td>学生名字</td>
 			<td>性别</td>
 				<td>生日</td>
 					<td colspan="2" align="center">数据操作</td>
 	</tr>
<s:iterator value="#session.students_list" >


 	<tr>
	<td><s:property value="stuID"/></td>
	<td><s:property value="stuName"/></td>
	<td><s:property value="sex"/></td>
	<td><s:date name="birthday" format="yyyy年MM月dd日"/></td>
	<td><a href="<%=path%>/students/Students_delete.action?stuid=<s:property value="stuID"/>" style="color:red " onclick="javascript:return confirm('确认删除？');">删除数据</a></td>
	<td><a href="<%=path%>/students/Students_modify.action?stuid=<s:property value="stuID"/>" style="color:red">修改数据</a></td>
 	</tr> 	
</s:iterator>
 	 </table>

 	 <div id="pages">
 	 
					<a href="${pageContext.request.contextPath}/students/Students_query.action?curpage=1">首页</a>
					<a href="${pageContext.request.contextPath}/students/Students_query.action?curpage=${curpage-1 }" >上一页</a>				
					<a href="${pageContext.request.contextPath}/students/Students_query.action?curpage=${curpage+1 }">下一页</a>
					<a href="${pageContext.request.contextPath}/students/Students_query.action?curpage=${pagecount }">尾页</a> 第${curpage }页/共${pagecount}页
					
				</div>
	
  	</div>
 
  	<div id="right"></div>
  	<div id="footer"></div>
  </div>
  
 	 
  </body>
</html>
