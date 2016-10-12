<%@page import="edu.thu.cs.*" %>
<%@page import="jdbc.JdbcDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }
      .form-signin {
        max-width: 430px;
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
      a{
		text-decoration: none;
		color:blue;
		}
    </style>
    
<div class="navbar nav-pills navbar-fixed-top">
  <div class="navbar-inner">
    <a class="brand" href="#">INFO</a>
    <ul class="nav">
      <li class="divider-vertical"><a href="../home.jsp">首页</a></li>
      <% 
      	User user_tmp = (User)session.getAttribute("user");
      	if(user_tmp == null)
      	{
      		%><li class="active" font face = "微软雅黑"><a href="../account/login.jsp">登陆/注册</a></li> <%
      	}
      	else
      	{
      		String url = "../account/user_info.jsp?id="+user_tmp.id;
      		%><li class="active"  font face = "微软雅黑"><a href=<%=url%>><%=user_tmp.nickname%></a></li> <%
      	}
      
      %><li class="divider-vertical"><a href="../discussion/index.jsp">公共讨论区</a></li><%
      
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
    
    
    
<title>用户信息</title>
</head>
<body>

 <div class="container form-signin">
  <div class="row-fluid">
<% 
	String nickname  = request.getParameter("user");
	String id_string = request.getParameter("id");
	System.out.println("In user_info: nickname "+nickname);
	System.out.println("In id_string: id "+id_string);
	
	String this_url = "user_info.jsp";
	JdbcDao jdbc = new JdbcDao();
	User who = new User();
	if(nickname != null)
	{	
		who.id=0;
		who.nickname = nickname;
		who = jdbc.getUser(who);
		if(who==null)
			return;
	}
	else if(id_string != null)
	{
		who.id = Integer.parseInt(id_string);
		who = jdbc.getUser(who);
		if(who==null)
			return;
	}
%>

<%
	if(who != null){
		%><h2 class="form-signin-heading text-warning"><%=who.nickname%>的资料</h2><%
		%><font size = 3 face ="微软雅黑" color=black>
		<b>账户：</b><%=who.account %><br>
		<b>名字：</b><%=who.realname %><br>
		<b>ID：</b><%=who.id %><br>
		<b>昵称：</b><%=who.nickname %><br>
		<b>生日：</b><%=who.birth %><br>
		<b>地址：</b><%=who.address %><br>
		<b>e_name:</b><%=who.e_name %><br>
		<b>e_phone:</b><%=who.e_phone %><br>
		<b>sex:</b><%=who.sex %><br>
		<b>qq:</b> <% if(who.qq!=null&&!who.qq.equals("")){out.println(who.qq);}%><br>
		
		<b>登陆权限:</b><%=who.permit_login %><br>
		<b>发帖权限:</b><%=who.permit_post %><br>
		<b>管理员权限:</b><%=who.permit_admin %><br>
		<%
		User user = (User)session.getAttribute("user");
		if(user != null)
		{
			user = jdbc.getUser(user);
			session.setAttribute("user", user);
			
			if(user.id == who.id)
			{
				%><a href = "modify.jsp"><b>修改个人资料</b></a><%
			}
			else if(user.permit_admin > 0)
			{
				String not_login = this_url+"?id="+who.id+"&action=not_login";
				String yes_login = this_url+"?id="+who.id+"&action=yes_login";
				String not_post = this_url+"?id="+who.id+"&action=not_post";
				String yes_post = this_url+"?id="+who.id+"&action=yes_post";
				String not_admin = this_url+"?id="+who.id+"&action=not_admin";
				String yes_admin = this_url+"?id="+who.id+"&action=yes_admin";	
				%><h4>管理员可以修改他人权限</h4>
				<a href = <%=not_login%>>禁止登陆</a>  
				<a href = <%=yes_login%>>恢复登陆</a><br>
				<a href = <%=not_post %>>禁止发帖 </a>
				<a href = <%=yes_post %>>恢复发帖</a><br>
				<a href = <%=yes_admin %>>升级为管理员 </a>
				<a href = <%=not_admin %>>取消管理员 </a><%
				
				String action = null;
				action = request.getParameter("action");
				if(action != null)
				{
					User user_ = new User(); 
					user_.id = Integer.parseInt(request.getParameter("id"));
					System.out.println(user_.id);
					user_ = jdbc.getUser(user_);
					if(action.equals("not_login"))
						user_.permit_login = 0;
					else if(action.equals("yes_login"))
						user_.permit_login = 1;
					else if(action.equals("not_post"))
						user_.permit_post = 0;
					else if(action.equals("yes_post"))
						user_.permit_post = 1;
					else if(action.equals("yes_admin"))
						user_.permit_admin = 1;
					else if(action.equals("not_admin"))
						user_.permit_admin = 0;
					jdbc.updateUser(user_);
					
					if(nickname != null)
						response.sendRedirect(this_url+"?user="+nickname);
					else
						response.sendRedirect(this_url+"?id="+who.id);
				}	
			}
		}
	}
%>
</font>

<hr>
<button class="btn btn-primary" ><a href="../home.jsp" style="color:white">返回首页</a></button>

<% 
	User user_now = (User)session.getAttribute("user");
	if(user_now != null && user_now.id==who.id)
	{	
		%><button class="btn btn-success" ><a href="../home.jsp?quit=yes" style="color:white">注销登陆</a></button><%
		
		String change_url = this_url+"?action=1&id="+who.id;
		String remain_url = this_url+"?id="+who.id;
		
		%><button class="btn btn-primary" ><a href=<%=change_url%> style="color:white">修改密码</a></button><%
		
		if(request.getParameter("action")!= null)
		{
			%><br><br>
			<form action=<%=remain_url %> method="post">
			<p class="form-signin-heading text-warning " ><font size =3>请输入你的新密码：</p>
			<input type = "password" class="span6 input-block-level" name = "password"/> 
			<br/>
			<input type="submit" class="btn btn-large btn-info" name = "regain" value="确认" />
			</form>
			<%
		}
		else if(request.getParameter("regain")!=null)
		{
			String password = request.getParameter("password"); 
			user_now.password = password;
			jdbc.updateUser(user_now);
			%>
			<div class="alert alert=success">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				你好!<strong> <%=user_now.realname%> </strong>密码修改成功!
			</div>
			<% 
			session.setAttribute("user", user_now);
		}

	}

	if(user_now != null && user_now.id==who.id && user_now.permit_admin > 0)
	{	
		%><button class="btn btn-danger" ><a href="../admin/index.jsp" style="color:white">管理员界面</a></button><%
	}
%>
	
</div>
</div>
</body>
</html>