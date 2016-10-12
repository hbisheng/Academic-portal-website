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



<h2 class="form-signin-heading text-warning">资源列表</h2>
<%
	String this_url = "media_manage.jsp"; 	
	JdbcDao jdbc = new JdbcDao();
	String action = request.getParameter("action");
	System.out.println(action);
	if(action != null)
	{
		if(action.equals("delete"))
		{
			String id_string = request.getParameter("id");
			if(id_string != null)
			{
				int media_id = Integer.parseInt(id_string);
				jdbc.delMedia(media_id);
				System.out.println("delete the media");
			}
		}
	}
%>

<hr>
<%	
	List<Integer> c= jdbc.getMediaIndex(0);
	int cnt = 0;
	if(c!=null){
		%><table><%
		for(Integer i : c)
		{ 
			++cnt;
			Media media = jdbc.getMedia(i);
			String show_url= "../media/show.jsp?id="+media.id;
			String del_url = this_url+"?action=delete&id="+media.id;
			
			%><tr><td><%=media.content%></td><%		
			%><td><%=media.name%></td><%
			%><td><%
			
			if(media.type == 1)
			{
				%>图片<%
			}
			else if(media.type == 2)
			{
				%>音频<%
			}else if(media.type==3)
			{
				%>视频<%
			}
			
			%></td><%
			
			%><td><a href="<%=show_url%>">查看</a></td></tr><%
		}
		%></table><%
	}
%>
 
<hr><a href="../home.jsp">返回首页</a>
</div>
</div>
</body>
</html>