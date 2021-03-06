/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-22 00:39:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import edu.thu.cs.*;
import jdbc.*;
import java.net.*;
import java.util.*;
import java.text.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("   <meta charset=\"utf-8\">\n");
      out.write("    <title>Java:Our New Info!</title>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <!-- Bootstrap -->\n");
      out.write("    <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"bootstrap/css/bootstrap-responsive.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"bootstrap/css/docs.css\" rel=\"stylesheet\">\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("  \n");
      out.write("  ");
 
	if(request.getParameter("quit")!=null)
		session.setAttribute("user", null);
	JdbcDao jdbc = new JdbcDao();
	User user = (User)session.getAttribute("user");
	if(user != null){
		user = jdbc.getUser(user);
		if(user.permit_login > 0)
			session.setAttribute("user",user);
		else
		{
			session.removeAttribute("user");
			user = null;
		}
	}//update user information

      out.write("\n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \t<div class=\"navbar nav-pills navbar-fixed-top\">\n");
      out.write("  <div class=\"navbar-inner\">\n");
      out.write("    <a class=\"brand\" href=\"#\">INFO</a>\n");
      out.write("    <ul class=\"nav\">\n");
      out.write("      <li class=\"active\"><a href=\"home.jsp\">首页</a></li>\n");
      out.write("      ");
 
      	if(user == null)
      	{
      		
      out.write("<li class=\"divider-vertical\" font face = \"微软雅黑\"><a href=\"account/login.jsp\">登陆/注册</a></li> ");

      	}
      	else
      	{
      		String url = "account/user_info.jsp?id="+user.id;
      		
      out.write("<li class=\"divider-vertical\" font face = \"微软雅黑\"><a href=");
      out.print(url);
      out.write('>');
      out.print(user.nickname);
      out.write("</a></li> ");

      	}
      
      
      out.write("<li class=\"divider-vertical\"><a href=\"discussion/index.jsp\">公共讨论区</a></li>");

      
      if(user != null)
      {
	      	
      out.write("<li class=\"divider-vertical\"><a href=\"courses/index.jsp\">网络学堂</a></li>\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"notice/index.jsp\">教务公告</a></li>\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"media/index.jsp\">外部资源</a></li>");

      }
 	  
      
      out.write("<li class=\"divider-vertical\"><a href=\"intro.jsp\">师资力量</a></li>\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"author.jsp\">开发人员</a></li>\n");
      out.write("    \n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"bs-docs-example\">\n");
      out.write("              <div id=\"myCarousel\" class=\"carousel slide\">\n");
      out.write("                <ol class=\"carousel-indicators\">\n");
      out.write("                  <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"\"></li>\n");
      out.write("                  <li data-target=\"#myCarousel\" data-slide-to=\"1\" class=\"active\"></li>\n");
      out.write("                  <li data-target=\"#myCarousel\" data-slide-to=\"2\" class=\"\"></li>\n");
      out.write("                </ol>\n");
      out.write("                <div class=\"carousel-inner\">\n");
      out.write("                  <div class=\"item\">\n");
      out.write("                    <img src=\"picture/1.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"carousel-caption\">\n");
      out.write("                      <h4>凌晨一点</h4>\n");
      out.write("                      <p>我们完成了所有框架的设计</p>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"item active\">\n");
      out.write("                    <img src=\"picture/2.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"carousel-caption\">\n");
      out.write("                      <h4>凌晨两点</h4>\n");
      out.write("                      <p>我们开始学习bootstrap</p>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"item\">\n");
      out.write("                    <img src=\"picture/3.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"carousel-caption\">\n");
      out.write("                      <h4>凌晨三点</h4>\n");
      out.write("                      <p>隔壁宿舍同学也还没睡，希望一切能够顺利！java大作业加油！</p>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">‹</a>\n");
      out.write("                <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">›</a>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("    \n");
      out.write("    <script src=\"http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("    <script src=\"http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    <script src=\"http://cdn.bootcss.com/holder/2.0/holder.min.js\"></script>\n");
      out.write("    <script src=\"asset/js/google-code-prettify/prettify.js\"></script>\n");
      out.write("\n");
      out.write("    <script src=\"assets/js/application.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    <script src=\"http://code.jquery.com/jquery.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("  </body>\n");
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
