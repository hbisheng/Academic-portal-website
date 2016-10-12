<%@page import="mail.MailTest" %>
<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
        max-width: 300px;
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
   
      <form  action="login.jsp" method=post>
        <h2 class="form-signin-heading text-warning">Please sign in</h2>
        <br/>
        <input type="text" class="input-block-level" placeholder="Email address" name="name">
        <br/>
        <input type="password" class="input-block-level" placeholder="Password" name="password">
         <br/>
        <button class="btn btn-large btn-success" type="submit" name="login">登陆</button>
        <button class="btn btn-large btn-success"><b><a href="register.jsp" style="color:white">注册</a></b></button>
      </form>

      
  		<p class="text-success">Forget password? <i class="icon-hand-right"></i><a href="regain.jsp" class="lead" style="text-decoration:none color:white">找回密码</a></p>
   
<%
	JdbcDao jdbc = new JdbcDao();
	if(request.getParameter("login")!=null)
	{
		System.out.println("In login");
		try {
			String a = request.getParameter("name");
			String b = request.getParameter("password");
			if(a != null && b != null){
				
				User tmp = new User(); 
				tmp.id=0;
				tmp.account = a;
				User tar = jdbc.getUser(tmp);
				
				if(tar == null)
				{
					%><div class="alert">
	  				<button type="button" class="close" data-dismiss="alert">&times;</button>
	 				<strong>Warning!</strong>找不到该用户<i class="icon-hand-right"></i>
					</div><%
					return;
				}
				System.out.println("login:before validate");
				if(tar.verify<=0)
				{	
					%>
					<div class="alert">
	  				<button type="button" class="close" data-dismiss="alert">&times;</button>
	 				<strong>Warning!</strong> 您的账户还没有验证，请登录邮箱验证!如找不到邮件了？点击这里来重发一封邮件<i class="icon-hand-right"></i>
					</div>
					<form name="登陆"action="login.jsp" method="post">
					<input type="hidden" value="<%=tar.id%>" name = "user_id">
					<input type="submit" class= "btn btn-warning"value="重发邮件" name = "regain"/>
					</form><%
					return;
				}
				System.out.println("login:permission");
				if(tar.permit_login <= 0)
				{	
					%>
					<div class="alert-error">
	  				<button type="button" class="close" data-dismiss="alert">&times;</button>
	 				<strong>Error!</strong>您的账号已经被管理员屏蔽
					</div>
					<%
					return;
				}
				if(tar != null){
					if(tar.password.equals(b))
					{
						
						
						%>
						<div class="text-success">
		  				<button type="button" class="close" data-dismiss="success">&times;</button>
		  				
		 				<strong>你好！<%=tar.realname%> 过两秒钟后自动跳转到主页</strong>
						</div>
						<%		
								
								
						session.setAttribute("user", tar);
						response.setHeader("refresh","2;url=../home.jsp");			
					}	
					else
					{
						%>
						<div class="alert-error">
		  				<button type="button" class="close" data-dismiss="alert">&times;</button>
		 				<strong>Error!</strong>密码不正确！
						</div>
						<%
					}
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	if(request.getParameter("regain")!=null)
	{
		
		Token token = new Token();
		token.operation = 1;
		token.user_id = Integer.parseInt((request.getParameter("user_id")));
		
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		token.content = session.getId()+df.format(c.getTime());
		jdbc.addToken(token);
		
		InetAddress host = InetAddress.getLocalHost();
		String address = host.getHostAddress();
		
		User o_user = new User();
		o_user.id = token.user_id;
		o_user = jdbc.getUser(o_user);
		MailTest.sendmail(o_user.account,"http://"+address+":8060/NewInfo/account/remote.jsp?token="+token.content);
		%><p class="text-success"><br>邮件已经发送</p><%
		return;
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