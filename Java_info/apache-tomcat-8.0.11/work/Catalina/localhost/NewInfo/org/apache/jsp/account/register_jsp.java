/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-22 00:34:21 UTC
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

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\n");
      out.write("<link href=\"../bootstrap/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write(" <style type=\"text/css\">\n");
      out.write("      body {\n");
      out.write("        padding-top: 40px;\n");
      out.write("        padding-bottom: 40px;\n");
      out.write("        background-color: #f5f5f5;\n");
      out.write("      }\n");
      out.write("      .form-signin {\n");
      out.write("        max-width: 430px;\n");
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
      out.write("      a{\n");
      out.write("\t\ttext-decoration: none;\n");
      out.write("\t\tcolor:white;\n");
      out.write("\t\t}\n");
      out.write("    </style>\n");
      out.write("<link href=\"../bootstrap/css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<title>Register</title>\n");
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
      out.write("<div class=\"container form-signin\">\n");
      out.write("<div class=\"row-fluid\">\n");
      out.write("\n");
      out.write(" <form name=\"注册\"action=\"register.jsp\" method=\"post\">\n");
      out.write("\t<h1 class=\"text-center text-warning \">注册界面</h1>\n");
      out.write("\t<table class=\"table table-striped\">\n");
      out.write("\t<tr><td><strong>*用户名: </strong></td> <td><input placeholder=\"Letter and Number\" type=\"text\"  name=\"account\"  /></td></tr>\n");
      out.write("\t<tr><td><strong>*密码: </strong></td>  <td><input placeholder=\"password\" type=\"password\" name=\"password\"  /></td></tr>\n");
      out.write("\t<tr><td><strong>*真实姓名: </strong></td> <td> <input placeholder=\"realname\" type=\"text\" name=\"realname\" /></td></tr>\n");
      out.write("\t<tr><td><strong>*昵称: </strong></td> <td> <input placeholder=\"nickname\" type=\"text\" name=\"nickname\" \"/></td></tr>\n");
      out.write("\t<tr><td><strong>*性别: </strong></td> <td> <input placeholder=\"male/female\" type=\"text\" name=\"sex\" /></td></tr>\n");
      out.write("\t<tr><td><strong>*生日: </strong></td> <td> <input placeholder=\"94/01/01\" type=\"text\" name=\"birth\" /></td></tr>\n");
      out.write("\t<tr><td><strong>*电话号码: </strong></td><td><input placeholder=\"11 numbers\" type=\"text\" name=\"phone\" /></td></tr>\n");
      out.write("\t<tr><td><strong>*紧急联系人名字: </strong></td><td><input  placeholder=\"e_name\"  type=\"text\" name=\"e_name\" /></td></tr>\n");
      out.write("\t<tr><td><strong>*紧急联系人手机号: </strong></td><td><input placeholder=\"11 numbers\" type=\"text\" name=\"e_phone\"/></td></tr>\n");
      out.write("\t<tr><td><strong>*家庭住址:</strong></td><td> <input placeholder=\"address\" type=\"text\" name=\"address\"/></td></tr>\n");
      out.write("\t<tr><td><strong> QQ号码</strong></td><td> <input placeholder=\"optional\" type=\"text\" name=\"qq\"/></td></tr>\n");
      out.write("\t</table>\n");
      out.write("\t<input type=\"submit\" class=\"btn btn-primary\" value=\"确认\" name = \"yes\" />\n");
      out.write("\t<button class=\"btn btn-success\" ><a href=\"../home.jsp\">返回首页</a></button>\n");
      out.write("</form>\t\n");
      out.write("      \n");
      out.write("      ");

      try {
			if(request.getParameter("yes") != null) 
			{
				System.out.println("register:In posts");
				JdbcDao jdbc = new JdbcDao();
				User new_u = new User();
				new_u.account = request.getParameter("account");
				new_u.password = request.getParameter("password");
				new_u.realname = request.getParameter("realname");
				new_u.nickname = request.getParameter("nickname");
				new_u.sex = request.getParameter("sex");
				new_u.birth = request.getParameter("birth");

				
				new_u.phone = request.getParameter("phone");
				new_u.e_name = request.getParameter("e_name");
				new_u.e_phone = request.getParameter("e_phone");
				new_u.address = request.getParameter("address");
				new_u.qq = request.getParameter("qq");
				new_u.verify = 0;
				new_u.permit_login = 1;
				new_u.permit_post = 1;
				new_u.permit_admin = 0;
				System.out.println("register:naming");
				System.out.println("register:before validation "+new_u.isValid()+"  "+new_u.isOld());
				if(new_u.isValid())
				{
					int ans = new_u.isOld();
					if(ans != 0)
					{
						if(ans == 1)
						{
							
      out.write("<div class=\"alert\">\n");
      out.write("\t  \t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t \t\t\t\t\t\t <strong>Warning!</strong> 该邮箱已经被注册了\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t");

						}
						else
						{
							
      out.write("<div class=\"alert\">\n");
      out.write("\t  \t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t \t\t\t\t\t\t <strong>Warning!</strong> 该昵称已经被注册了\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t");

						}
						return;
					}
				}
				else
				{
					System.out.println("register:Not a valid user");
					
      out.write("<div class=\"alert\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t\t\t\t\t\t <strong>Warning!</strong> 有一些必填项目没有填好\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t");

					return;
				}
				System.out.println("register:after validation");
				
				User user = jdbc.addUser(new_u);
			
				Token token = new Token();
				token.operation = 1;
				token.user_id = user.id;
				token.content = session.getId();
				jdbc.addToken(token);

				Calendar c = Calendar.getInstance();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				System.out.println(df.format(c.getTime()));
				
				InetAddress host = InetAddress.getLocalHost();
				String address = host.getHostAddress();
				
				MailTest.sendmail(user.account,"http://"+address+":8060/NewInfo/account/remote.jsp?token="+token.content);
				
				
      out.write("<div class=\"alert alert-success\">\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("\t\t\t    <strong>Success!</strong> 请登录邮箱进行验证\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t");

				
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	
      out.write("\n");
      out.write("\t\n");
      out.write("    <script src=\"asset/js/google-code-prettify/prettify.js\"></script>\n");
      out.write("    <script src=\"assets/js/application.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write(" </div>\n");
      out.write("</div>\n");
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
