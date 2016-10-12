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
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container form-signin">
 <div class="row-fluid">
 <table class="table table-striped text-center">
 <tr>
<td><button class="btn btn-block btn-success"><a href="course_manage.jsp" style="color:white">课程管理相关</a></button></td><td><font size=2>(你可以查看，添加，删除，课程)</font></td>
</tr>
<tr>
<td><button class="btn btn-block btn-warning"><a href="media_manage.jsp" style="color:white">外部资源管理</a></button></td><td><font size=2>(你可以查看，添加，删除外部资源)</font></td>
</tr>
<tr>
<td><button class="btn btn-block btn-info"><a href="user_manage.jsp" style="color:white">用户管理</a></button></td><td><font size=2>(用户的权限管理，屏蔽发帖，禁止登陆，成为管理员等)</font></td>
</tr>
<tr>
<td><button class="btn btn-block btn-primary"><a href="../discussion/index.jsp" style="color:white">讨论区管理</a></button></td><td><font size=2>(用户的权限管理，屏蔽发帖，禁止登陆，成为管理员等)</font></td>
</tr>

</table>
</div>
</div>
 <script src="asset/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    <script src="js/bootstrap.min.js"></script>
</body>
</html>