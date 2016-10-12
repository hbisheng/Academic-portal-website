<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	      	%><li class="divider-vertical"><a href="../courses/index.jsp">网络学堂</a></li>
	      	<li class="divider-vertical"><a href="../notice/index.jsp">教务公告</a></li>
	      	<li class="active"><a href="../media/index.jsp">外部资源</a></li><%
      }
 	  
      %><li class="divider-vertical"><a href="../intro.jsp">师资力量</a></li>
      <li class="divider-vertical"><a href="../author.jsp">开发人员</a></li>
    </ul>
  </div>
</div>



<div class="container form-signin">
  <div class="row-fluid">
<% 
	int media_id=-1;
	if(request.getParameter("id")!=null)
		media_id = Integer.parseInt(request.getParameter("id"));
	JdbcDao jdbc = new JdbcDao();
	
	Media media=null;
	if(media_id != -1)
		media = jdbc.getMedia(media_id);

	if(media != null)
	{
		if(media.type==1)
		{
			%><h2 class="form-signin-heading text-warning">图片资源</h2><%
			%><br><%=media.content%><br><%
			%><img border= "0" src = "<%=media.url%>"  height = "300"><%
		}
		else if(media.type==2)
		{
			%><h2 class="form-signin-heading text-warning">音频资源</h2><%
			%><br><%=media.content%><%
			
			%><audio controls="controls" height="100" width="100">
			  <source src="<%=media.url%>>" type="audio/mp3" />
			<embed height="100" width="100" src="song.mp3" />
			</audio><%
			
		}
		if(media.type==3)
		{
			%><h2 class="form-signin-heading text-warning">视频资源</h2><%
			%><br><%=media.content%><br><%
			%><embed src="<%=media.url%>" 
			quality="high" width="480" height="400" align="middle" allowScriptAccess="always" 
			allowFullScreen="true" mode="transparent" type="application/x-shockwave-flash"></embed><%
		}
	}
%>


<hr><br><a href="index.jsp">返回媒体列表</a>    
<a href="../home.jsp">首页</a>
</div>
</div>
</body>
</html>