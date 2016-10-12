<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body bgcolor= "#8080C0">

<% 
	if(request.getParameter("quit")!=null)
		session.setAttribute("user", null);
	JdbcDao jdbc = new JdbcDao();
	User user = (User)session.getAttribute("user");
%>

<%
	//update user infomation
	if(user != null){
		user = jdbc.getUser(user);
		session.setAttribute("user",user);
		if(user.permit_login > 0){
			String info_url = "account/user_info.jsp";
			%><font size = 3 face ="微软雅黑" color="#00FFFF">
			你的账户：<%=user.account %><br>
			你的名字：<%=user.realname %><br>
			你的ID：<%=user.id %><br>
			你的昵称：<%=user.nickname %><br>
			你的生日：<%=user.birth %><br>
			你的地址：<%=user.address %><br>
			你的e_name:：<%=user.e_name %><br>
			你的e_phone:：<%=user.e_phone %><br>
			你的sex:：<%=user.sex %><br>
			你的登陆权限:：<%=user.permit_login %><br>
			你的发帖权限:：<%=user.permit_post %><br>
			你的管理员权限:：<%=user.permit_admin %><br>
			</font>
			<form name="注册"action="home.jsp" method="post"><input type="submit" value="注销" name = "quit" /></form>
			
			<form name="注册"action=<%=info_url%> method="post"><input type="hidden" value=<%=user.nickname%> name="user"/>
			<input type="submit" value="查看个人资料" name = "confirm" /></form><% 
			}
			else{
					out.println("管理员已经屏蔽了你，请重新登录其他账号");
					user = null;
					session.removeAttribute("user");
			}
	}
	else
	{
			out.println("你还没有登录");
	}
	
	
%>
<ul>
<font size = 6 face ="微软雅黑" >导航栏</font>
<font size = 4 face ="微软雅黑" >

<% if(user == null)
{
%><li><a href="account/login.jsp"><b>账户login</b></a></li><%
%><li><a href="account/register.jsp"><b>账户register</b></a></li><%
}
else{
%><br><li><a href="courses/index.jsp"><b>我的课表</b></a></li><%
}	
%>

<br><li><a href="discussion/index.jsp"><b>公共讨论区Entrance</b></a></li>

<br><li><a href="resourse/index.jsp"><b>外部资源Page</b></a></li>

<br><li><a href="intro.jsp"><b>师资力量show</b></a></li>

<br><li><a href="author.jsp"><b>开发人员info</b></a></li>

<% 
	if(user != null && user.permit_admin == 1)
	{
		%><br><li><a href="admin/index.jsp"><font color = "red">管理员界面</font></a> </li><% 
	}
%>	

</font>
</body>
</html>