/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-10 15:26:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      edu.thu.cs.SimpleBean calculator = null;
      calculator = (edu.thu.cs.SimpleBean) _jspx_page_context.getAttribute("calculator", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (calculator == null){
        calculator = new edu.thu.cs.SimpleBean();
        _jspx_page_context.setAttribute("calculator", calculator, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
        out.write('\r');
        out.write('\n');
        out.write('	');
        org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("calculator"), request);
        out.write('\r');
        out.write('\n');
      }
      out.write('\r');
      out.write('\n');
      java.util.Date time = null;
      time = (java.util.Date) _jspx_page_context.getAttribute("time", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (time == null){
        time = new java.util.Date();
        _jspx_page_context.setAttribute("time", time, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
        out.write('\r');
        out.write('\n');
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<head>\r\n");
      out.write("<title>计算器</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

		try {
			out.println(time.toString());
			calculator.calculate();
			out.print(calculator.getFirst() + calculator.getOperator()
					+ calculator.getSecond() + "=" + calculator.getResult());
		} catch (Exception e) {
			System.out.print(e);
		}
	
      out.write("\r\n");
      out.write("\t<hr>\r\n");
      out.write("\t<form name=\"form1\" action=\"index2.jsp\">\r\n");
      out.write("\t\t<table width=\"75\" border=\"1\" bordercolor=\"#003300\">\r\n");
      out.write("\t\t\t<tr bgcolor=\"#999999\">\r\n");
      out.write("\t\t\t\t<td colspan=\"2\">simple calculator</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>第一个操作数</td>\r\n");
      out.write("\t\t\t\t<td><input type=text name=\"first\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>操作符</td>\r\n");
      out.write("\t\t\t\t<td><select name=\"operator\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"+\">+</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"-\">-</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"*\">*</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"/\">/</option>\r\n");
      out.write("\t\t\t\t</select></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>第二个操作数</td>\r\n");
      out.write("\t\t\t\t<td><input type=text name=\"second\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" bgcolor=\"#cccccc\"><input type=submit value=\"计算\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      if (true) {
        _jspx_page_context.forward("time.jsp");
        return;
      }
      out.write('\r');
      out.write('\n');
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
