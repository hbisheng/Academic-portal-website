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
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<h3 class="text-success">用户权限管理</h3>

<%
	String this_url = "user_manage.jsp"; 	
	JdbcDao jdbc = new JdbcDao();
	List<Integer> c= jdbc.getUserIndex();
	String action = null;
	action = request.getParameter("action");
	if(action != null)
	{
		User user = new User(); 
		user.id = Integer.parseInt(request.getParameter("id"));
		user = jdbc.getUser(user);
		if(action.equals("not_login"))
			user.permit_login = 0;
		else if(action.equals("yes_login"))
			user.permit_login = 1;
		else if(action.equals("not_post"))
			user.permit_post = 0;
		else if(action.equals("yes_post"))
			user.permit_post = 1;
		else if(action.equals("yes_admin"))
			user.permit_admin = 1;
		else if(action.equals("not_admin"))
			user.permit_admin = 0;
		jdbc.updateUser(user);
		response.sendRedirect(this_url);
	}
%>

<hr>
<table class="table table-striped text-center">
<%	
	int cnt = 0;
	if(c!=null){
		for(Integer i : c)
		{ 
			++cnt;
			User tmp = new User(); tmp.id = i;
			User user = jdbc.getUser(tmp);
			 
			String not_login = this_url+"?id="+user.id+"&action=not_login";
			String yes_login = this_url+"?id="+user.id+"&action=yes_login";
			String not_post = this_url+"?id="+user.id+"&action=not_post";
			String yes_post = this_url+"?id="+user.id+"&action=yes_post";
			String not_admin = this_url+"?id="+user.id+"&action=not_admin";
			String yes_admin = this_url+"?id="+user.id+"&action=yes_admin";
			
			%>
			<tr>
			<td><%=cnt%>.<%=user.account%>|<%=user.nickname%>|</td>
			<td>登录权限<%=user.permit_login%></td>
			<td>发帖权限<%=user.permit_post%></td>
			<td>管理员权限<%=user.permit_admin%></td>
			
			<td><a href = <%=not_login%>>禁止登陆</a></td>  
			<td><a href = <%=yes_login%>>恢复登陆</a></td>
			<td><a href = <%=not_post %>>禁止发帖 </a></td>
			<td><a href = <%=yes_post %>>恢复发帖</a></td>
			<td><a href = <%=yes_admin %>>升级为管理员 </a></td>
			<td><a href = <%=not_admin %>>取消管理员 </a></td>
			</tr>
			<%
		} 
}
%>

</table>
<hr><a href="../home.jsp" style="color:green">返回首页</a>
</body>
</html>