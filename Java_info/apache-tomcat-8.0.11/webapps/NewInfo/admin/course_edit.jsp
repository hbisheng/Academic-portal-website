<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>

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
	int course_id = Integer.parseInt(request.getParameter("id"));
	JdbcDao jdbc = new JdbcDao();
	Course course = jdbc.getCourse(course_id);
	String url_this = "course_edit.jsp?id="+course_id;
	
	if(request.getParameter("confirm") != null)
	{//press the confirm button
		Course tmp = new Course();
		System.out.println("The Course c's id"+course.id);
		tmp.id = course.id;
		
		
		tmp.name = request.getParameter("name");
		tmp.teacher = request.getParameter("teacher");

		tmp.classtime = request.getParameter("classtime");
		
		if(request.getParameter("capacity")!=null && !request.getParameter("capacity").equals(""))
			tmp.capacity = Integer.parseInt(request.getParameter("capacity"));
		
		tmp.valid = 1;

		tmp.content = request.getParameter("content");
		tmp.start_time = request.getParameter("start_time");
		tmp.end_time = request.getParameter("end_time");
		
		
		int validation = tmp.isValid();
		if(validation == 0)
		{
			%>课程信息没有补全<%
		}
		else if(validation == -1)
		{
			%>上课时间信息不合法<%
		}
		else if(validation == 1)
		{
			jdbc.updateCourse(tmp);
			response.sendRedirect("../courses/course.jsp?id="+course_id);
		}
		
	}
%>

<form name="添加课程" action=<%=url_this%> method="post">
	添加课程界面：
	<br/>
	课程名称
	<input type="text" name="name" value="<%=course.name %>"/>
	<br/>
	授课老师
	<input type="text" name="teacher" value="<%=course.teacher %>"/>
	<br/>
	上课时间 
	<input type="text" name="classtime" value="<%=course.classtime %>"/>
	<br/>
	客容量
	<input type="text" name="capacity" value="<%=course.capacity %>"/>
	<br/>
	课程介绍
	<input type="text" name="content" value="<%=course.content %>"/>
	<br/>
	开始选课时间
	<input type="text" name="start_time" value="<%=course.start_time %>"/>
	<br/>
	结束选课时间
	<input type="text" name="end_time" value="<%=course.end_time %>"/>
	<br/>
	<input type="submit" name = "confirm" value="确认" />
	</form>
<hr><a href="../home.jsp">返回首页</a>
</body>
</html>