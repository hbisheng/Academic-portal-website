<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String this_url = "user_manage.jsp"; 	
	JdbcDao jdbc = new JdbcDao();
	int course_id = Integer.parseInt(request.getParameter("id"));
	List<Integer> c= jdbc.getUserCourse(course_id);
	Course course = jdbc.getCourse(course_id);
	out.println("课程"+course.name+"的用户列表如下：");
%>

<hr>
<%	
	
	int cnt = 0;
	if(c!=null){
		for(Integer i : c)
		{ 
			++cnt;
			User tmp = new User(); tmp.id = i;
			User user = jdbc.getUser(tmp);
			%><li><p><%=cnt%>.<%=user.account%>|<%=user.realname%>|<%=user.nickname%>|<%=user.address%></p></li><%
		} 
}
%>

<hr><a href="../home.jsp">返回首页</a>
</body>
</html>