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
	int course_id = Integer.parseInt(request.getParameter("cid"));
	int user_id = Integer.parseInt(request.getParameter("uid"));

	JdbcDao jdbc=null;
	try{
		jdbc = new JdbcDao();
		
		Course course = jdbc.getCourse(course_id);
		int left = course.capacity - jdbc.getUserCourse(course.id).size();
		if(left < 1)
		{
			System.out.println("课程选择失败");
			response.sendRedirect("choose.jsp?fail=left");
			return;
		}
		
		
		List<Integer> course_list=null;
		course_list = jdbc.getCourseIndex(user_id);
		if(course_list!=null){
			for(Integer i : course_list)
			{ 
				Course c = jdbc.getCourse(i);
				if(c.classtime.equals(course.classtime))
				{
					System.out.println("时间冲突");
					response.sendRedirect("choose.jsp?fail=time");
					return;
				}
			}	
		}
		
		jdbc.addUserCourse(user_id,course_id);
		response.sendRedirect("choose.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>

</body>
</html>