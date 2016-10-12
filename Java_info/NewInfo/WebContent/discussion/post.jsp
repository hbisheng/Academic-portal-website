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
        max-width: 1100px;
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



<div class="container form-signin">
 <div class="row-fluid">
 <%
	JdbcDao jdbc = new JdbcDao();
	User user = (User)session.getAttribute("user");
	if(user != null)
	{
		user = jdbc.getUser(user);
		session.setAttribute("user",user);
	}
%>

<%  
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	Post post = jdbc.getPost(post_id);
	List<Reply> c=null;
	c = jdbc.getReplyList(post.id);
	int cnt = 0;
	String last_url = "posts.jsp?category_id="+post.category_id;
	String this_url = "post.jsp?post_id="+post_id;
%>	

<font size = 6 face ="微软雅黑" ><p><b>

<p class="form-signin-heading text-success"><b>帖子标题 <%=post.topic %></b></p>
	
</b></p>
</font>

<h3 class="text-warning">回复列表：</h3>

<ul>
<font size = 4 face ="微软雅黑" >
<% 
	if(c!=null){
		JdbcDao jdbc_ = new JdbcDao();
		
		%><table class="table table-striped" style="font-family:微软雅黑">
		<tr><td>楼层</td><td>回复者</td> <td>时间</td> <td><td> <tr><%
		
		for(Reply reply: c)
		{ 
			++cnt;
			User t = new User(); t.id = reply.user_id;
			User u = jdbc_.getUser(t);
			
			%><td><b><%=cnt%>楼： <%=reply.content%> </a></b> </td>
			<td><b><font color = "red"><%=u.nickname%> </td> 
			<td><%=reply.time %></td><%
			
			if(cnt!= 1 && reply.user_id == user.id)
			{		
				%><td><form action=<%=this_url%> method = "post"><input type ="hidden" name = "reply_id" value ="<%=reply.id%>"/>
				<input type ="submit"  class="btn btn-warning" value="删除我的回复" name = "delete"/></form></td><%
			}
			
			%></tr><%
		} 
		%></table><%
	}
%>
</font>
</ul>

<% 

	if(user != null)
	{
		if(user.permit_post <= 0)
		{
			%>
			<p class="text-error">你被管理员禁言了，不能发言</p>
			<%
			
			return;
		}
		
		%>
		<form action = <%=this_url %> method = "post">
		<span style="vertical-align: top" class="text-success">回复:</span><textarea class="span6" rows="10" cols="50" name="content"></textarea>
		<br><br><input type ="submit" class="btn btn-success" value="确认回复" name = "deliver"/>
		</form><%	
		if(request.getParameter("deliver")!=null)
		{
			Reply reply = new Reply();
			reply.content = request.getParameter("content");
			reply.user_id= user.id;
			reply.post_id= post.id;
			JdbcDao jdbc_ = new JdbcDao();
			jdbc_.addReply(reply);
			
			response.sendRedirect(this_url);
		}
		if(request.getParameter("delete")!=null)
		{
			int reply_id = Integer.parseInt(request.getParameter("reply_id"));
			jdbc.delReply(reply_id);
			response.sendRedirect(this_url);
		}
	}
%>

<hr><a href=<%=last_url%>>返回上一级</a>  <br><a href="../home.jsp">返回首页</a>

<hr><%
	if(user != null){
 	}else
	{
 		%>
		<p class="text-error">你还没有登陆</p>
		<%
	}
%>

</div>
</div>
</body>
</html>