/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-21 21:04:03 UTC
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

public final class intro_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("      body {\n");
      out.write("        padding-top: 40px;\n");
      out.write("        padding-bottom: 40px;\n");
      out.write("        background-color: #f5f5f5;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      .form-signin {\n");
      out.write("        max-width: 500px;\n");
      out.write("        padding: 19px 29px 29px;\n");
      out.write("        margin: 0 auto 20px;\n");
      out.write("        background-color: #fff;\n");
      out.write("        border: 1px solid #e5e5e5;\n");
      out.write("        -webkit-border-radius: 5px;\n");
      out.write("           -moz-border-radius: 5px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);\n");
      out.write("           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);\n");
      out.write("                box-shadow: 0 1px 2px rgba(0,0,0,.05);\n");
      out.write("      }\n");
      out.write("      .form-signin .form-signin-heading,\n");
      out.write("      .form-signin .checkbox {\n");
      out.write("        margin-bottom: 10px;\n");
      out.write("      }\n");
      out.write("      .form-signin input[type=\"text\"],\n");
      out.write("      .form-signin input[type=\"password\"] {\n");
      out.write("        font-size: 16px;\n");
      out.write("        height: auto;\n");
      out.write("        margin-bottom: 15px;\n");
      out.write("        padding: 7px 9px;\n");
      out.write("      }\n");
      out.write("\t\n");
      out.write("    </style>\n");
      out.write("<link href=\"bootstrap/css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
 
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
      out.write("  \t<div class=\"navbar nav-pills navbar-fixed-top\">\n");
      out.write("  <div class=\"navbar-inner\">\n");
      out.write("    <a class=\"brand\" href=\"#\">INFO</a>\n");
      out.write("    <ul class=\"nav\">\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"home.jsp\">首页</a></li>\n");
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
 	  
      
      out.write("<li class=\"active\"><a href=\"intro.jsp\">师资力量</a></li>\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"author.jsp\">开发人员</a></li>\n");
      out.write("    \n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container form-signin\">\n");
      out.write(" <div class=\"row-fluid\">\n");
      out.write(" \t<img src=\"picture/5.png\" width=\"100\" height=\"100\" />\n");
      out.write(" \t<strong>BinXu(许斌)</strong>\n");
      out.write(" \t<br/>\n");
      out.write("\t• AssociateProfessor,IEEEMember, ACM Professional Member\n");
      out.write("\t<br/>\n");
      out.write("\t• E‐mail: xubin@tsinghua.edu.cn\n");
      out.write("\t<br/>\n");
      out.write("\t• Homepage: keg.cs.tsinghua.edu.cn/persons/xubin\n");
      out.write("\t<br/>\n");
      out.write("\t• Research:Webservice,SemanticWeb,MobileComputing\n");
      out.write("\t<br/>\n");
      out.write("\t• Teaching:TenyearsofJava,morethan2000students\n");
      out.write("\t<br/>\n");
      out.write("\t• Honor: Java Champion, Web Service Challenge Champion\n");
      out.write("\t<br/>\n");
      out.write("\t\n");
      out.write("    \n");
      out.write(" </div>\n");
      out.write(" </div>\n");
      out.write("\n");
      out.write("</body>\n");
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
