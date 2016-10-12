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
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 800px;
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
<title>Insert title here</title>
</head>
<body>

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
      
      %><li class="divider-vertical"><a href="../discussion/index.jsp">公共讨论区</a></li><%
      
      if(user_tmp != null)
      {
	      	%><li class="divider-vertical"><a href="../courses/index.jsp">网络学堂</a></li>
	      	<li class="active"><a href="../notice/index.jsp">教务公告</a></li>
	      	<li class="divider-vertical"><a href="../media/index.jsp">外部资源</a></li><%
      }
 	  
      %><li class="divider-vertical"><a href="../intro.jsp">师资力量</a></li>
      <li class="divider-vertical"><a href="../author.jsp">开发人员</a></li>
    </ul>
  </div>
</div>

<div class="container form-signin">
  <div class="row-fluid">
<%
	User user = (User)session.getAttribute("user");
	JdbcDao jdbc = new JdbcDao();
	if(user != null)
	{
		user = jdbc.getUser(user);
		session.setAttribute("user",user);
	}
%>

<%  
	List<Integer> c=null;
	c = jdbc.getPostIndex(1000);
	int cnt = 0;
%>	

<h2 class="form-signin-heading text-success">教务公告如下</h2>


<font size = 4 face ="微软雅黑" >

<table class="table table-striped">
<% 
	if(c!=null){
		for(Integer i: c)
		{ 
			Post post = jdbc.getPost(i);
			String post_url = "content.jsp?id="+post.id;
			String del_url = "index.jsp?action=delete&id="+post.id;
			String edit_url = "edit.jsp?id="+post.id;
			++cnt;
			%>
			<tr>
			<td><%=cnt%>. <a href= <%=post_url %> > <%=post.topic%> </a></td>
			<td><%=post.initiator%></td>
			<td><%=post.time%></td>
			<%
			
			if(user != null && user.permit_admin >0)
			{	
				%> 
				<td><a href= <%=del_url %> > 删除 </a>  
				</td>
				<td><a href= <%=edit_url %> > 编辑 </a> 
				</td>
				</tr> <% 
			}			
			
		}
	}
%>
</table>

<%
	if(user != null && user.permit_admin >0)
	{	
		%><h2 class="form-signin-heading text-warning">发表新教务公告</h2>
		<table class="table table-striped">
		<form action = "index.jsp" method = "post">
		<tr>
		<td><span style="vertical-align: top">主题:</td><td></span><textarea rows="1" cols="50" name ="topic"></textarea></td>
		</tr>
		<tr>
		<td><span style="vertical-align: top">内容:</td><td></span><textarea rows="20" cols="50" name="content"></textarea></td>
		</tr>
		<tr>
		<td><input type ="submit" value="确认提交" name = "deliver"/></td>
		</tr>
		</form>
		</table>
		<%	
		
		if(request.getParameter("deliver")!=null)
		{
			
			Post post = new Post();
			post.category_id = 1000;
			
			post.topic = request.getParameter("topic");
			post.initiator = user.nickname;
					
			Reply reply = new Reply();
			reply.content = request.getParameter("content");
			reply.post_id = jdbc.addPost(post);
			
			reply.user_id= user.id;
			jdbc.addReply(reply);
			
			response.sendRedirect("index.jsp");
		}
		
		if(request.getParameter("action")!=null)
		{
			int post_id = Integer.parseInt(request.getParameter("id"));
			System.out.println();
			jdbc.delPost(post_id);
			response.sendRedirect("index.jsp");
		}
		
	}
//添加直接加窗口
//删除用本页的action来完成
//编辑的话新开一个页面

%>

 <script src="asset/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    <script src="js/bootstrap.min.js"></script>
</div>
</div>
</body>
</html>