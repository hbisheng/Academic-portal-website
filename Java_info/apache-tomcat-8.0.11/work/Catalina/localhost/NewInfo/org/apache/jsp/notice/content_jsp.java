/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-22 00:32:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import edu.thu.cs.*;
import jdbc.*;
import java.util.*;

public final class content_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <style type=\"text/css\">\r\n");
      out.write("      body {\r\n");
      out.write("        padding-top: 40px;\r\n");
      out.write("        padding-bottom: 40px;\r\n");
      out.write("        background-color: #f5f5f5;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .form-signin {\r\n");
      out.write("        max-width: 1000px;\r\n");
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
      
      
      out.write("<li class=\"divider-vertical\"><a href=\"../discussion/index.jsp\">公共讨论区</a></li>");

      
      if(user_tmp != null)
      {
	      	
      out.write("<li class=\"divider-vertical\"><a href=\"../courses/index.jsp\">网络学堂</a></li>\r\n");
      out.write("\t      \t<li class=\"active\"><a href=\"../notice/index.jsp\">教务公告</a></li>\r\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"../media/index.jsp\">外部资源</a></li>");

      }
 	  
      
      out.write("<li class=\"divider-vertical\"><a href=\"../intro.jsp\">师资力量</a></li>\r\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"../author.jsp\">开发人员</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container form-signin\">\r\n");
      out.write("<div class=\"row-fluid\">\r\n");

	JdbcDao jdbc = new JdbcDao();
	User user = (User)session.getAttribute("user");
	if(user != null)
	{
		user = jdbc.getUser(user);
		session.setAttribute("user",user);
	}

      out.write("\r\n");
      out.write("\r\n");
  
	int post_id = Integer.parseInt(request.getParameter("id"));
	Post post = jdbc.getPost(post_id);
	List<Reply> c=null;
	c = jdbc.getReplyList(post.id);
	int cnt = 0;

      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul>\r\n");
      out.write("<font size = 4 face =\"微软雅黑\" >\r\n");
 
	if(c!=null){
		for(Reply reply: c)
		{ 
			
      out.write("<strong>标题:</strong> ");
      out.print(post.topic );
      out.write("<br><br>");

					
			
      out.write('作');
      out.write('者');
      out.write('：');
      out.print(post.initiator );
      out.write("<br>");

			
      out.write('时');
      out.write('间');
      out.write(':');
      out.print(post.time);
      out.write("<br>");

			
      out.write('内');
      out.write('容');
      out.write(':');
      out.print(reply.content );
      out.write("<br>");

		}
	}

      out.write("\r\n");
      out.write("</font>\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
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
