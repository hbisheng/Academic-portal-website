/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-21 19:44:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mail.MailTest;
import edu.thu.cs.*;
import jdbc.*;
import java.net.*;
import java.util.*;
import java.text.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<link href=\"../bootstrap/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("      body {\n");
      out.write("        padding-top: 40px;\n");
      out.write("        padding-bottom: 40px;\n");
      out.write("        background-color: #f5f5f5;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      .form-signin {\n");
      out.write("        max-width: 300px;\n");
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
      out.write("      \t\n");
      out.write("    </style>\n");
      out.write("<link href=\"../bootstrap/css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"navbar nav-pills navbar-fixed-top\">\n");
      out.write("  <div class=\"navbar-inner\">\n");
      out.write("    <a class=\"brand\" href=\"#\">INFO</a>\n");
      out.write("    <ul class=\"nav\">\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"../home.jsp\">首页</a></li>\n");
      out.write("      ");
 
      	User user_tmp = (User)session.getAttribute("user");
      	if(user_tmp == null)
      	{
      		
      out.write("<li class=\"active\" font face = \"微软雅黑\"><a href=\"../account/login.jsp\">登陆/注册</a></li> ");

      	}
      	else
      	{
      		String url = "../account/user_info.jsp?id="+user_tmp.id;
      		
      out.write("<li class=\"active\"  font face = \"微软雅黑\"><a href=");
      out.print(url);
      out.write('>');
      out.print(user_tmp.nickname);
      out.write("</a></li> ");

      	}
      
      
      out.write("<li class=\"divider-vertical\"><a href=\"../discussion/index.jsp\">公共讨论区</a></li>");

      
      if(user_tmp != null)
      {
	      	
      out.write("<li class=\"divider-vertical\"><a href=\"../courses/index.jsp\">网络学堂</a></li>\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"../notice/index.jsp\">教务公告</a></li>\n");
      out.write("\t      \t<li class=\"divider-vertical\"><a href=\"../media/index.jsp\">外部资源</a></li>");

      }
 	  
      
      out.write("<li class=\"divider-vertical\"><a href=\"../intro.jsp\">师资力量</a></li>\n");
      out.write("      <li class=\"divider-vertical\"><a href=\"../author.jsp\">开发人员</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container form-signin\">\n");
      out.write("  <div class=\"row-fluid\">\n");
      out.write("   \n");
      out.write("      <form  action=\"login.jsp\" method=post>\n");
      out.write("        <h2 class=\"form-signin-heading text-warning\">Please sign in</h2>\n");
      out.write("        <br/>\n");
      out.write("        <input type=\"text\" class=\"input-block-level\" placeholder=\"Email address\" name=\"name\">\n");
      out.write("        <br/>\n");
      out.write("        <input type=\"password\" class=\"input-block-level\" placeholder=\"Password\" name=\"password\">\n");
      out.write("         <br/>\n");
      out.write("        <button class=\"btn btn-large btn-success\" type=\"submit\" name=\"login\">登陆</button>\n");
      out.write("        <button class=\"btn btn-large btn-success\"><b><a href=\"register.jsp\" style=\"color:white\">注册</a></b></button>\n");
      out.write("      </form>\n");
      out.write("\n");
      out.write("      \n");
      out.write("  \t\t<p class=\"text-success\">Forget password? <i class=\"icon-hand-right\"></i><a href=\"regain.jsp\" class=\"lead\" style=\"text-decoration:none color:white\">找回密码</a></p>\n");
      out.write("   \n");

	JdbcDao jdbc = new JdbcDao();
	if(request.getParameter("login")!=null)
	{
		System.out.println("In login");
		try {
			String a = request.getParameter("name");
			String b = request.getParameter("password");
			if(a != null && b != null){
				
				User tmp = new User(); 
				tmp.id=0;
				tmp.account = a;
				User tar = jdbc.getUser(tmp);
				
				if(tar == null)
				{
					
      out.write("<div class=\"alert\">\n");
      out.write("\t  \t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t \t\t\t\t<strong>Warning!</strong>找不到该用户<i class=\"icon-hand-right\"></i>\n");
      out.write("\t\t\t\t\t</div>");

					return;
				}
				System.out.println("login:before validate");
				if(tar.verify<=0)
				{	
					
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"alert\">\n");
      out.write("\t  \t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t \t\t\t\t<strong>Warning!</strong> 您的账户还没有验证，请登录邮箱验证!如找不到邮件了？点击这里来重发一封邮件<i class=\"icon-hand-right\"></i>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<form name=\"登陆\"action=\"login.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(tar.id);
      out.write("\" name = \"user_id\">\n");
      out.write("\t\t\t\t\t<input type=\"submit\" class= \"btn btn-warning\"value=\"重发邮件\" name = \"regain\"/>\n");
      out.write("\t\t\t\t\t</form>");

					return;
				}
				System.out.println("login:permission");
				if(tar.permit_login <= 0)
				{	
					
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"alert-error\">\n");
      out.write("\t  \t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t \t\t\t\t<strong>Error!</strong>您的账号已经被管理员屏蔽\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t");

					return;
				}
				if(tar != null){
					if(tar.password.equals(b))
					{
						
						
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"text-success\">\n");
      out.write("\t\t  \t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"success\">&times;</button>\n");
      out.write("\t\t  \t\t\t\t\n");
      out.write("\t\t \t\t\t\t<strong>你好！");
      out.print(tar.realname);
      out.write(" 过两秒钟后自动跳转到主页</strong>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t");
		
								
								
						session.setAttribute("user", tar);
						response.setHeader("refresh","2;url=../home.jsp");			
					}	
					else
					{
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"alert-error\">\n");
      out.write("\t\t  \t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t\t \t\t\t\t<strong>Error!</strong>密码不正确！\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t");

					}
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	if(request.getParameter("regain")!=null)
	{
		
		Token token = new Token();
		token.operation = 1;
		token.user_id = Integer.parseInt((request.getParameter("user_id")));
		
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		token.content = session.getId()+df.format(c.getTime());
		jdbc.addToken(token);
		
		InetAddress host = InetAddress.getLocalHost();
		String address = host.getHostAddress();
		
		User o_user = new User();
		o_user.id = token.user_id;
		o_user = jdbc.getUser(o_user);
		MailTest.sendmail(o_user.account,"http://"+address+":8060/NewInfo/account/remote.jsp?token="+token.content);
		
      out.write("<p class=\"text-success\"><br>邮件已经发送</p>");

		return;
	}

      out.write("\t\n");
      out.write("  <script src=\"asset/js/google-code-prettify/prettify.js\"></script>\n");
      out.write("    <script src=\"assets/js/application.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write(" </div>\n");
      out.write("</div>\n");
      out.write("\n");
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
