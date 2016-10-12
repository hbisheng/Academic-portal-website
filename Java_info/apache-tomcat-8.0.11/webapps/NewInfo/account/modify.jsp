<%@page import="edu.thu.cs.*" %>
<%@page import="jdbc.JdbcDao"%>
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

<%
	User mine = (User)(session.getAttribute("user")); 
	JdbcDao jdbc = new JdbcDao();
	
	try
	{
		if(request.getParameter("yes") != null)
		{
			if(mine==null) 
				return;
			if(request.getParameter("account")!=null)
				mine.account = request.getParameter("account");
			if(request.getParameter("sex")!=null)
				mine.sex = request.getParameter("sex");
			if(request.getParameter("birth")!=null)
				mine.birth = request.getParameter("birth");
			if(request.getParameter("phone")!=null)
				mine.phone = request.getParameter("phone");
			if(request.getParameter("e_name")!=null)
				mine.e_name = request.getParameter("e_name");
			if(request.getParameter("e_phone")!=null)
				mine.e_phone = request.getParameter("e_phone");
			if(request.getParameter("address")!=null)
				mine.address = request.getParameter("address");
			if(request.getParameter("qq")!=null)
				mine.qq = request.getParameter("qq");
			
			if(mine.isValid())
			{
				jdbc.updateUser(mine);
			
				%><div class="alert">
						<button type="button" class="close" data-dismiss="success">&times;</button>
					 <strong>Success!</strong>修改成功，3秒后回到刚才的页面
				</div>
				<%
					
				User user = (User)session.getAttribute("user");
				if(user != null)
					response.setHeader("refresh","3;url=user_info.jsp?id="+user.id);
				else
					response.setHeader("refresh","3;url=../home.jsp");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	


 %><form name="修改" action="modify.jsp" method="post">
	<h1 class="text-center text-warning ">修改个人信息</h1>
	<table class="table table-striped">
	
	<tr><td><strong>*用户名:</td> <td> <%=mine.account%></td></tr>
	<tr><td><strong>*真实姓名: </td> <td><%=mine.realname%></td></tr>
	<tr><td><strong>*昵称:</td> <td> <%=mine.nickname %></td></tr>
	<tr><td><strong>*性别: </strong></td> <td> <input type="text" name="sex" value = <%=mine.sex %> /></td></tr>
	<tr><td><strong>*生日: </strong></td> <td> <input type="text" name="birth" value = <%=mine.birth %> /></td></tr>
	<tr><td><strong>*电话号码: </strong></td><td><input type="text" name="phone" value = <%=mine.phone %> /></td></tr>
	<tr><td><strong>*紧急联系人名字: </strong></td><td><input type="text" name="e_name" value = <%=mine.e_name %> /></td></tr>
	<tr><td><strong>*紧急联系人手机号: </strong></td><td><input type="text" name="e_phone" value = <%=mine.e_phone %> /></td></tr>
	<tr><td><strong>*家庭住址:</strong></td><td> <input type="text" name="address" value = <%=mine.address %> /></td></tr>
	<tr><td><strong> QQ号码</strong></td><td> <input type="text" name="qq" value = <%= mine.qq %> /></td></tr>
	</table>
	
	<input type="submit" class="btn btn-primary" value="确认" name = "yes" />
	<button class="btn btn-success" ><a href="../home.jsp">返回首页</a></button>
</form>	

    <script src="asset/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    <script src="js/bootstrap.min.js"></script>

 </div>
</div>

</body>
</html>