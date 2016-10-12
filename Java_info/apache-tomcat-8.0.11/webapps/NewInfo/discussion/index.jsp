<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/docs.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 600px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
	
    </style>
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">


<div class="navbar nav-pills navbar-fixed-top">
  <div class="navbar-inner">
    <a class="brand" href="#">INFO</a>
    <ul class="nav">
      <li class="divider-vertical"><a href="../home.jsp">首页</a></li>
      <% 
      	User user_tmp = (User)session.getAttribute("user");
      	if(user_tmp == null)
      	{
      		%><li class="divider-vertical" font face = "微软雅黑"><a href="../account/login.jsp">登陆/注册</a></li> <%
      	}
      	else
      	{
      		String url = "../account/user_info.jsp?id="+user_tmp.id;
      		%><li class="divider-vertical"  font face = "微软雅黑"><a href=<%=url%>><%=user_tmp.nickname%></a></li> <%
      	}
      
      %><li class="active"><a href="../discussion/index.jsp">公共讨论区</a></li><%
      
      if(user_tmp != null)
      {
	      	%><li class="divider-vertical"><a href="../courses/index.jsp">网络学堂</a></li>
	      	<li class="divider-vertical"><a href="../notice/index.jsp">教务公告</a></li>
	      	<li class="divider-vertical"><a href="../media/index.jsp">外部资源</a></li><%
      }
 	  
      %><li class="divider-vertical"><a href="../intro.jsp">师资力量</a></li>
      <li class="divider-vertical"><a href="../author.jsp">开发人员</a></li>
    </ul>
  </div>
</div>






<title>Insert title here</title>
</head>
<body>

<div class="container form-signin">
 <div class="row-fluid">


<%
	User user = (User)session.getAttribute("user");
	JdbcDao jdbc = new JdbcDao();
	if(user != null)
	{
		user = jdbc.getUser(user);
		session.setAttribute("user",user);
		if(user.permit_admin > 0){
			%><h4 class="text-success">你是管理员，可以删除版块</h4><br> <%
		}
	}
	

	
	List<Integer> c=null;
	c = jdbc.getCategoryIndex();
	if(user==null)
	{
		%>
		<div class="alert">
	  	<button type="button" class="close" data-dismiss="alert">&times;</button>
	 	<strong>Sorry!</strong> 你还没有登陆
		</div>
		<% 
	}	
	int cnt = 0;
%>	

<font size = 6 face ="微软雅黑" >
<p class="form-signin-heading text-success"><b>讨论区的版块如下</b></p>
</font>


<table class="table table-striped text-center">
<% 
	if(c!=null){
		for(Integer i: c)
		{ 
			Category category = jdbc.getCategory(i);
			String post_url = "posts.jsp?category_id="+category.id;
			String del_url = "index.jsp?id="+category.id+"&action=delete";
			++cnt;
			%>
			<tr>
			<td><%=cnt%>.</td> 
			<td><a href= <%=post_url %> > <%=category.name%> </a></td>
			
			<%
			if(user != null && user.permit_admin > 0){
				%>
				<td><a href = <%=del_url%>><font color = "red">删除</font></a></td>
				<%
			}
			%></tr>	
		<%		
		} 
	}
%>
</table>


<%  
	if(user != null && user.permit_admin > 0)
	{
		if(request.getParameter("deliver")!=null)
		{
			Category category = new Category(); 	
			category.name = request.getParameter("board");
			if(category.validate())
			{
				if(category.isOld())
				{
					%>
					<p class="text-warning">该Category已经存在了</p>
					<%
				}
				else
				{
					jdbc.addCategory(category);
					response.sendRedirect("index.jsp");
				}
			}
			else
			{
				%>
				<p class="text-warning">Category不能为空</p>
				<%
			}
		}		
		String action = request.getParameter("action");
		if(action != null && action.equals("delete"))
		{
			int category_id = Integer.parseInt(request.getParameter("id"));
			jdbc.delCategory(category_id);
			response.sendRedirect("index.jsp");
		}
		%><h4 class="text-info">你是管理员，可以新开一个版块</h4>
		<form action = "index.jsp" method = "post">
		<span style="vertical-align: top"><p class="text-info">新开一个版块:</span><textarea rows="1" cols="50" name ="board"></textarea><br><br>
		<input type ="submit" class="btn btn-primary"value="确认发表" name = "deliver"/></form><%	
	}

%>
</div>
</div>
 <script src="asset/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    <script src="js/bootstrap.min.js"></script>
</body>
</html>