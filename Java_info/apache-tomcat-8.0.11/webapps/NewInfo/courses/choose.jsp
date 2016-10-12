<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">

<title>Insert title here</title>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
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
	      	%><li class="active"><a href="../courses/index.jsp">网络学堂</a></li>
	      	<li class="divider-vertical"><a href="../notice/index.jsp">教务公告</a></li>
	      	<li class="divider-vertical"><a href="../media/index.jsp">外部资源</a></li><%
      }
 	  
      %><li class="divider-vertical"><a href="../intro.jsp">师资力量</a></li>
      <li class="divider-vertical"><a href="../author.jsp">开发人员</a></li>
    </ul>
  </div>
</div>

<%
	JdbcDao jdbc = new JdbcDao();
	Status s = jdbc.getStatus();
	if(s.choose == 0)
	{
		%>
		<div class="alert alert-error">
  		<button type="button" class="close" data-dismiss="alert">&times;</button>
 		 <strong>Warning!</strong> 选课开关没有打开，现在不是选课时间
		</div>
		<% 
		return;
	}
%>




<%
	User user = (User)session.getAttribute("user");
	if(user != null){
	%>
	<div class="container-fluid">
  	<div class="row-fluid">
    <div class="span3">
    <br><br>
    
    
    <font size = 3 face ="微软雅黑"><p class="text-success">你的名字：<%=user.realname %><br></p></font>
	<font size = 3 face ="微软雅黑"><p class="text-success">你的昵称：<%=user.nickname %><br></p></font>
	<font size = 3 face ="微软雅黑"><p class="text-success">你的地址：<%=user.address %><br></p></font>
	<font size = 3 face ="微软雅黑"><p class="text-success">你的手机：<%=user.phone %><br></p></font>
	
<% 	}%>
    </div>
    <div class="span9">
    
	<br><br>
    
    <font size = 5 face ="微软雅黑"><p class="text-info"><b>所有可选课程</b></p></font>
<%  
	List<Integer> c=null; 
	user = (User)session.getAttribute("user");
	if(user==null)
	{
		%>
		<div class="alert alert-error">
  		<button type="button" class="close" data-dismiss="alert">&times;</button>
 		 <strong>Warning!</strong> 你还没有登陆，所以没有课程可以选择
		</div>
		<% 
		return;
	}
	else
		c = jdbc.getCourseIndex(0);
	int cnt = 0;
%>	
	
<% 
	if(request.getParameter("fail")!=null)
	{
		if(request.getParameter("fail").equals("left"))
		{
			%><div class="alert">
	  						<button type="button" class="close" data-dismiss="alert">&times;</button>
	 						 <strong>Warning!</strong> 没有课余量了！
							</div>
							<%
		}
		else if(request.getParameter("fail").equals("time"))
		{
			%><div class="alert">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		 	<strong>Warning!</strong> 选课与已有课程冲突了！
			</div>
			<%
		}
	}
%>


<table class="table table-striped text-center">
<% 
	if(c!=null){
		%><tr><td>课程序号</td><td>课程名称</td><td>授课教师</td><td>上课时间</td><td>课容量</td><td>课余量</td><td>选课操作</td><tr><%
		
		for(Integer i : c)
		{
			Course course = jdbc.getCourse(i);
			String info_url = "course.jsp?id="+course.id+"&type=1";
			String in_url = "getin.jsp?cid="+course.id+"&uid="+user.id;
			
			int ans = jdbc.checkUserCourse(user.id, course.id);
			int left = course.capacity - jdbc.getUserCourse(course.id).size();
			++cnt;
			%>  
			<tr align ="center">
			<td><%=cnt%>.</td>
    		<td><a href= <%=info_url %> > <%=course.name%></a></td><td><%=course.teacher %></td>
    		<td><%=course.classtime%></td>
			<td><%=course.capacity %></td>
			<td><%=left%></td>
			
			<%	
			
			if(ans == 0 && left > 0)
			{
				%><td><a href= <%=in_url %>> 选课 </a></td> <%
			}
			else if(left==0)
			{
				%><td>无课余量</td> <%
			}
			else
			{
				%><td>&nbsp</td> <%
			}
			
			%></tr><%
		} 
	}
%>
</table>
<br/>

<font size = 5 face ="微软雅黑"><p class="text-info"><b>我的课程</b></p></font>
<table class="table table-striped" >
<% 
	int [][]map = new int[10][10];
	%><tr><td>序号</td><td>课程名称</td><td>授课老师</td><td>上课时间</td><td>退课操作</td></tr><% 
	List<Integer> course_list=null;
	course_list = jdbc.getCourseIndex(user.id);
	if(course_list!=null){
		cnt = 0;
		for(Integer i : course_list)
		{ 
			Course course = jdbc.getCourse(i);
			String info_url = "course.jsp?id="+course.id+"&type=1";
			String out_url = "getout.jsp?cid="+course.id+"&uid="+user.id;
			++cnt;
			
			int time = Integer.parseInt(course.classtime);
			map[time/10][time%10] = course.id;//time from 11-77
			
			%>
			<tr>
			<td><%=cnt%></td>
			<td><a href= <%=info_url %> > <%=course.name%> </a></td>
			<td><%=course.teacher%></td>
			
			<td><%=course.classtime %></td>
			
			<td><a href= <%=out_url%> >退课 </a></td>
			
			</tr>
			<%
		} 
	}
%>
</table>


<font size = 5 face ="微软雅黑"><p class="text-info"><b>我的课表</b></p></font>
<table class="table table-striped" style="font-family:微软雅黑">
<% 
	String a ="一二三四五六七八";
	for(int i = 0;i != 7; i++)
	{
		%><tr><% 
		for(int j = 0; j != 8; j++)
		{
			String tmp = null;
			Course course = null;
			if(i + j == 0)
				tmp = "";
			else if(j == 0)
				tmp = "第"+a.charAt(i-1)+"大节";
			else if(i == 0)
				tmp = "星期"+a.charAt(j-1);	 
			else if( map[j][i] > 0)// 7 6
			{
				course = jdbc.getCourse(map[j][i]);
				tmp = course.name;
			}
			else
				tmp="";
			%><td><%=tmp%></td><%
		}	
		%></tr><%
	}
	
%>
</table>


<br/>
<font size = 5 face ="微软雅黑"><p class="text-info"><b>选课历史记录</b></p></font>

<table class="table table-striped">
<% 
	List<UserCourse> history = jdbc.getUserCourseHistory(user.id);
	%><tr><td>操作</td> <td>课程名称 </td> <td>时间</td> </tr><% 
	
	for(UserCourse entry:history)
	{
		%><tr><%
		Course course= jdbc.getCourse(entry.course_id);
		if(entry.operation == 1)
		{%>
		<td><font color="green">选课</font></td>
		<%}
		else
		{%>
		<td><font color="red">退课</font></td>
		<%}
		
		%><td> <%=course.name%>  </td>
		<td><%=entry.time.substring(0, 19)%> </td></tr><% 
	}
	
	
%>

</table>
    </div>
  </div>
</div>


</body>
</html>