<%@page import="mail.MailTest" %>
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
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
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
		color:white;
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


<div class="container form-signin">
<div class="row-fluid">
	<form name="登陆"action="regain.jsp" method="post">
	<p class="form-signin-heading text-warning text-center" ><font size =5>输入你的注册邮箱账号：</p>
	<input type = "text" class="span6 input-block-level" name = "account"/> 
	<br/>
	<input type="submit" class="btn btn-large btn-info" name = "confirm" value="密码找回" />
	</form>
	<p class="text-success">join us <i class="icon-hand-right"></i><a href="register.jsp" class="lead" style=" color:blue"><strong>注册</strong></a></p>
<%
		try {
			JdbcDao jdbc = new JdbcDao();
			if(request.getParameter("confirm")!=null)
			{
				String a = request.getParameter("account");
				if(a == null||a=="")
				{	
					%>
					<br/>
					<div class="alert">
	  				<button type="button" class="close" data-dismiss="alert">&times;</button>
	 				<strong>Warning!</strong>您没有输入邮箱
					</div>
					<%
					return;
				}
				User user = new User();
				user.id=0;
				user.account = a;
				user = jdbc.getUser(user);
				if(user == null)
				{
					%>
					<div class="alert">
	  				<button type="button" class="close" data-dismiss="alert">&times;</button>
	 				<strong>Error!</strong>这个用户还没有被注册
					</div>
					<%
				}
				else{
				Token token = new Token();
				token.operation = 2;
				token.user_id = user.id;
				Calendar c = Calendar.getInstance();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				token.content = session.getId()+df.format(c.getTime());
				jdbc.addToken(token);
				InetAddress host = InetAddress.getLocalHost();
				String address = host.getHostAddress();
				MailTest.sendmail(user.account,"http://"+address+":8060/NewInfo/account/remote.jsp?token="+token.content);
				%>邮件已经发出<%
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
%>	


<script src="asset/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    <script src="js/bootstrap.min.js"></script>
 </div>
</div>
</body>
</html>