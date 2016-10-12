<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 500px;
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
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<% 
	if(request.getParameter("quit")!=null)
		session.setAttribute("user", null);
	JdbcDao jdbc = new JdbcDao();
	User user = (User)session.getAttribute("user");
	if(user != null){
		user = jdbc.getUser(user);
		if(user.permit_login > 0)
			session.setAttribute("user",user);
		else
		{
			session.removeAttribute("user");
			user = null;
		}
	}//update user information
%>
  
  	<div class="navbar nav-pills navbar-fixed-top">
  <div class="navbar-inner">
    <a class="brand" href="#">INFO</a>
    <ul class="nav">
      <li class="divider-vertical"><a href="home.jsp">首页</a></li>
      <% 
      	if(user == null)
      	{
      		%><li class="divider-vertical" font face = "微软雅黑"><a href="account/login.jsp">登陆/注册</a></li> <%
      	}
      	else
      	{
      		String url = "account/user_info.jsp?id="+user.id;
      		%><li class="divider-vertical" font face = "微软雅黑"><a href=<%=url%>><%=user.nickname%></a></li> <%
      	}
      
      %><li class="divider-vertical"><a href="discussion/index.jsp">公共讨论区</a></li><%
      
      if(user != null)
      {
	      	%><li class="divider-vertical"><a href="courses/index.jsp">网络学堂</a></li>
	      	<li class="divider-vertical"><a href="notice/index.jsp">教务公告</a></li>
	      	<li class="divider-vertical"><a href="media/index.jsp">外部资源</a></li><%
      }
 	  
      %><li class="active"><a href="intro.jsp">师资力量</a></li>
      <li class="divider-vertical"><a href="author.jsp">开发人员</a></li>
    
    </ul>
  </div>
</div>


<div class="container form-signin">
 <div class="row-fluid">
 	<img src="picture/5.png" width="100" height="100" />
 	<strong>BinXu(许斌)</strong>
 	<br/>
	• AssociateProfessor,IEEEMember, ACM Professional Member
	<br/>
	• E‐mail: xubin@tsinghua.edu.cn
	<br/>
	• Homepage: keg.cs.tsinghua.edu.cn/persons/xubin
	<br/>
	• Research:Webservice,SemanticWeb,MobileComputing
	<br/>
	• Teaching:TenyearsofJava,morethan2000students
	<br/>
	• Honor: Java Champion, Web Service Challenge Champion
	<br/>
	
    
 </div>
 </div>

</body>
</html>