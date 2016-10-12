<%@page import="mail.MailTest" %>
<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
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

<title>Register</title>
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

 <form name="注册"action="register.jsp" method="post">
	<h1 class="text-center text-warning ">注册界面</h1>
	<table class="table table-striped">
	<tr><td><strong>*用户名: </strong></td> <td><input placeholder="Letter and Number" type="text"  name="account"  /></td></tr>
	<tr><td><strong>*密码: </strong></td>  <td><input placeholder="password" type="password" name="password"  /></td></tr>
	<tr><td><strong>*真实姓名: </strong></td> <td> <input placeholder="realname" type="text" name="realname" /></td></tr>
	<tr><td><strong>*昵称: </strong></td> <td> <input placeholder="nickname" type="text" name="nickname" "/></td></tr>
	<tr><td><strong>*性别: </strong></td> <td> <input placeholder="male/female" type="text" name="sex" /></td></tr>
	<tr><td><strong>*生日: </strong></td> <td> <input placeholder="94/01/01" type="text" name="birth" /></td></tr>
	<tr><td><strong>*电话号码: </strong></td><td><input placeholder="11 numbers" type="text" name="phone" /></td></tr>
	<tr><td><strong>*紧急联系人名字: </strong></td><td><input  placeholder="e_name"  type="text" name="e_name" /></td></tr>
	<tr><td><strong>*紧急联系人手机号: </strong></td><td><input placeholder="11 numbers" type="text" name="e_phone"/></td></tr>
	<tr><td><strong>*家庭住址:</strong></td><td> <input placeholder="address" type="text" name="address"/></td></tr>
	<tr><td><strong> QQ号码</strong></td><td> <input placeholder="optional" type="text" name="qq"/></td></tr>
	</table>
	<input type="submit" class="btn btn-primary" value="确认" name = "yes" />
	<button class="btn btn-success" ><a href="../home.jsp">返回首页</a></button>
</form>	
      
      <%
      try {
			if(request.getParameter("yes") != null) 
			{
				System.out.println("register:In posts");
				JdbcDao jdbc = new JdbcDao();
				User new_u = new User();
				new_u.account = request.getParameter("account");
				new_u.password = request.getParameter("password");
				new_u.realname = request.getParameter("realname");
				new_u.nickname = request.getParameter("nickname");
				new_u.sex = request.getParameter("sex");
				new_u.birth = request.getParameter("birth");

				
				new_u.phone = request.getParameter("phone");
				new_u.e_name = request.getParameter("e_name");
				new_u.e_phone = request.getParameter("e_phone");
				new_u.address = request.getParameter("address");
				new_u.qq = request.getParameter("qq");
				new_u.verify = 0;
				new_u.permit_login = 1;
				new_u.permit_post = 1;
				new_u.permit_admin = 0;
				System.out.println("register:naming");
				System.out.println("register:before validation "+new_u.isValid()+"  "+new_u.isOld());
				if(new_u.isValid())
				{
					int ans = new_u.isOld();
					if(ans != 0)
					{
						if(ans == 1)
						{
							%><div class="alert">
	  						<button type="button" class="close" data-dismiss="alert">&times;</button>
	 						 <strong>Warning!</strong> 该邮箱已经被注册了
							</div>
							<%
						}
						else
						{
							%><div class="alert">
	  						<button type="button" class="close" data-dismiss="alert">&times;</button>
	 						 <strong>Warning!</strong> 该昵称已经被注册了
							</div>
							<%
						}
						return;
					}
				}
				else
				{
					System.out.println("register:Not a valid user");
					%><div class="alert">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						 <strong>Warning!</strong> 有一些必填项目没有填好
					</div>
					<%
					return;
				}
				System.out.println("register:after validation");
				
				User user = jdbc.addUser(new_u);
			
				Token token = new Token();
				token.operation = 1;
				token.user_id = user.id;
				token.content = session.getId();
				jdbc.addToken(token);

				Calendar c = Calendar.getInstance();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				System.out.println(df.format(c.getTime()));
				
				InetAddress host = InetAddress.getLocalHost();
				String address = host.getHostAddress();
				
				MailTest.sendmail(user.account,"http://"+address+":8060/NewInfo/account/remote.jsp?token="+token.content);
				
				%><div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			    <strong>Success!</strong> 请登录邮箱进行验证
				</div>
				<%
				
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