/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-21 21:54:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.discussion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import edu.thu.cs.*;
import jdbc.*;
import java.util.*;

public final class posts_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<link href=\"../bootstrap/css/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"assets/css/docs.css\" rel=\"stylesheet\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("      body {\r\n");
      out.write("        padding-top: 40px;\r\n");
      out.write("        padding-bottom: 40px;\r\n");
      out.write("        background-color: #f5f5f5;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .form-signin {\r\n");
      out.write("        max-width: 1100px;\r\n");
      out.write("        padding: 19px 29px 29px;\r\n");
      out.write("        margin: 0 auto 20px;\r\n");
      out.write("        background-color: #fff;\r\n");
      out.write("        border: 1px solid #e5e5e5;\r\n");
      out.write("        -webkit-border-radius: 5px;\r\n");
      out.write("           -moz-border-radius: 5px;\r\n");
      out.write("                border-radius: 5px;\r\n");
      out.write("        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("                box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("      }\r\n");
      out.write("      .form-signin .form-signin-heading,\r\n");
      out.write("      .form-signin .checkbox {\r\n");
      out.write("        margin-bottom: 10px;\r\n");
      out.write("      }\r\n");
      out.write("      .form-signin input[type=\"text\"],\r\n");
      out.write("      .form-signin input[type=\"password\"] {\r\n");
      out.write("        font-size: 16px;\r\n");
      out.write("        height: auto;\r\n");
      out.write("        margin-bottom: 15px;\r\n");
      out.write("        padding: 7px 9px;\r\n");
      out.write("      }\r\n");
      out.write("\t\r\n");
      out.write("    </style>\r\n");
      out.write("<link href=\"../bootstrap/css/bootstrap-responsive.css\" rel=\"stylesheet\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"navbar nav-pills navbar-fixed-top\">\r\n");
      out.write("  <div class=\"navbar-inner\">\r\n");
      out.write("    <a class=\"brand\" href=\"#\">INFO</a>\r\n");
      out.write("    <ul class=\"nav\">\r\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"../home.jsp\">首页</a></li>\r\n");
      out.write("      ");
 
      	User user_tmp = (User)session.getAttribute("user");
      	if(user_tmp == null)
      	{
      		
      out.write("<li class=\"divider-vertical\" font face = \"微软雅黑\"><a href=\"../account/login.jsp\">登陆/注册</a></li> ");

      	}
      	else
      	{
      		String url = "../account/user_info.jsp?id="+user_tmp.id;
      		
      out.write("<li class=\"divider-vertical\"  font face = \"微软雅黑\"><a href=");
      out.print(url);
      out.write('>');
      out.print(user_tmp.nickname);
      out.write("</a></li> ");

      	}
      
      
      out.write("<li class=\"active\"><a href=\"../discussion/index.jsp\">公共讨论区</a></li>");

      
      if(user_tmp != null)
      {
	      	
      out.write("<li class=\"divider-vertical\"><a href=\"../courses/index.jsp\">网络学堂</a></li>\r\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"../notice/index.jsp\">教务公告</a></li>\r\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"../media/index.jsp\">外部资源</a></li>");

      }
 	  
      
      out.write("<li class=\"divider-vertical\"><a href=\"../intro.jsp\">师资力量</a></li>\r\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"../author.jsp\">开发人员</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container form-signin\">\r\n");
      out.write(" <div class=\"row-fluid\">\r\n");

	User user = (User)session.getAttribute("user");
	JdbcDao jdbc = new JdbcDao();
	if(user != null){
		user = jdbc.getUser(user);
		session.setAttribute("user",user);

	}else
	{
      out.write("\r\n");
      out.write("\t\t<div class=\"alert alert-error\">\r\n");
      out.write("\t  \t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n");
      out.write("\t \t<strong>Warning!</strong> 你还没登陆\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t");
  
	}
	//int category_id = Integer.parseInt(request.getParameter("category_id"));
    int category_id=1;
	Category category = jdbc.getCategory(category_id);
	List<Integer> c=null;
	c = jdbc.getPostIndex(category.id);

	int cnt = 0;
	String last_url = "index.jsp";
	String this_url = "posts.jsp?category_id="+category_id;

      out.write("\t\r\n");
      out.write("\r\n");
      out.write("<font size = 5 face =\"微软雅黑\" ><p><b>\r\n");
      out.write("<p class=\"form-signin-heading text-success\"><b>你选择进入了 ");
      out.print(category.name );
      out.write("讨论区 </b></p>\r\n");
      out.write("</b></p>\r\n");
      out.write("</font>\r\n");
      out.write("\r\n");
      out.write("<h3 class=\"text-warning\">帖子列表：</h3>\r\n");
      out.write("<font size = 4 face =\"微软雅黑\">\r\n");
 
	if(c!=null){

      out.write("\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"font-family:微软雅黑\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<tr> <td>帖序号</td><td>主题</td><td>发帖人</td><td>时间</td><td></td><td>&nbsp</td></tr>");

		
		for(Integer i: c)
		{ 
			Post post = jdbc.getPost(i);
			String post_url = "post.jsp?post_id="+post.id;
			String user_url = "../account/user_info.jsp?user="+post.initiator;
			++cnt;
			
      out.write("<b><tr><td>");
      out.print(cnt);
      out.write("</td> <td> <a href=");
      out.print(post_url );
      out.write('>');
      out.print(post.topic);
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<td><a href=");
      out.print(user_url);
      out.write('>');
      out.print(post.initiator);
      out.write("</a></td> <td>");
      out.print(post.time );
      out.write("</td></b>");

			
			if(user != null)
			{
				if(post.initiator.equals(user.nickname))
				{		
					
      out.write("<td><form action=");
      out.print(this_url);
      out.write(" method = \"post\"><input type =\"hidden\" name = \"post_id\" value =\"");
      out.print(post.id);
      out.write("\"/>\r\n");
      out.write("\t\t\t\t\t<input type =\"submit\" class=\"text-warning\" value=\"删除我的帖子\" name = \"delete\"/></form></td>");

				}
				else if(user.permit_admin>0)
				{
					
      out.write("<td><form action=");
      out.print(this_url);
      out.write(" method = \"post\"><input type =\"hidden\" name = \"post_id\" value =\"");
      out.print(post.id);
      out.write("\"/>\r\n");
      out.write("\t\t\t\t\t<input type =\"submit\"class=\"text-warning\" value=\"管理员删帖\" name = \"delete\"/></form></td>");

				}
			}
				
      out.write("</tr>");

		} 
		
      out.write("</table>");

	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</ul>\r\n");
 
	
	if(user != null)
	{
		if(user.permit_post <= 0)
		{
			
      out.write("\r\n");
      out.write("\t\t\t<p class=\"text-error\">你被管理员禁言了，不能发言</p>\r\n");
      out.write("\t\t\t");
  
			
			return;
		}
		
      out.write("<p class=\"text-success\">发表新帖子\r\n");
      out.write("\t\t<form action = ");
      out.print(this_url );
      out.write(" method = \"post\">\r\n");
      out.write("\t\t<span style=\"vertical-align: top\"><p class=\"text-info\">主题:</span><textarea class=\"span3\" rows=\"1\" cols=\"200\" name =\"topic\"></textarea><br><br>\r\n");
      out.write("\t\t<span style=\"vertical-align: top\"><p class=\"text-info\">内容:</span><textarea class=\"span8\" rows=\"10\" cols=\"200\" name=\"content\"></textarea>\r\n");
      out.write("\t\t<br><br>\r\n");
      out.write("\t\t<input type =\"submit\" class=\"btn btn-primary\"value=\"确认发表\" name = \"deliver\"/>\r\n");
      out.write("\t\t</form>");
	
		if(request.getParameter("deliver")!=null)
		{
			Post post = new Post();
			post.category_id = category.id;
			post.topic = request.getParameter("topic");
			post.initiator = user.nickname;
					
			Reply reply = new Reply();
			reply.content = request.getParameter("content");
			reply.post_id = jdbc.addPost(post);
			reply.user_id= user.id;
			
			jdbc.addReply(reply);
			response.sendRedirect(this_url);
		}
		if(request.getParameter("delete")!=null)
		{
			int post_id = Integer.parseInt(request.getParameter("post_id"));
			jdbc.delPost(post_id);
			response.sendRedirect(this_url);
		}
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</font>\r\n");
      out.write("<hr><a href=");
      out.print(last_url);
      out.write(">返回上一级</a>  <br><a href=\"../home.jsp\">返回首页</a>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
