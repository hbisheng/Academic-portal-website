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
<div class="container form-signin">
 <div class="row-fluid">



<h4>资源列表</h4>
<%
	String this_url = "media_manage.jsp"; 	
	JdbcDao jdbc = new JdbcDao();
	String action = request.getParameter("action");
	System.out.println(action);
	if(action != null)//删除某个课程
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
			%><td><%=media.url%></td><%
			%><td><%=media.type%></td><%
			%><td><a href="<%=show_url%>">查看</a></td><%
			%><td><a href="<%=del_url%>">删除</a></td></tr><%
		}
		%></table><%
	}
%>
 <table class="table table-striped text-center">
<hr><form name="添加外部资源"action=<%=this_url%> method="post">
	<p class="text-info">添加资源界面：</p>
	<tr><td>资源类型</td><td><input type="text" name="type" /></td></tr>
	<tr><td>资源链接</td><td><input type="text" name="url" /></td></tr>
	<tr><td>资源名称</td><td><input type="text" name="name" /></td></tr>
	<tr><td>资源描述</td><td><input type="text" name="content" /></td></tr>
	<tr><td><input type="submit" name="add_confirm" value="确认" /></td></tr>
</form>
</table>

<%
	if(request.getParameter("add_confirm")!=null)//发布新课程
	{
		System.out.println("in add_confirm");
		try {
			Media m = new Media();
			String type = request.getParameter("type");
			if(type!=null)
				m.type = Integer.parseInt(type);
			m.name = request.getParameter("name");
			m.url = request.getParameter("url");
			m.content = request.getParameter("content");
			if(m.isValid())
			{
				jdbc.addMedia(m);
				System.out.println("加入mediaID！");				
				response.sendRedirect(this_url);
			}
			else{	
				%>
				<p class="text-error">请补全所有信息，并注意type的表示（1：图片  2：音频  3：视频）</p>
				<%
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
%>

	
<hr><a href="../home.jsp">返回首页</a>
</div>
</div>
</body>
</html>