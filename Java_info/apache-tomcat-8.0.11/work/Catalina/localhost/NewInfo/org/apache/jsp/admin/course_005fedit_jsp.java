/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.11
 * Generated at: 2014-09-21 22:28:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import edu.thu.cs.*;
import jdbc.*;

public final class course_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
 
	int course_id = Integer.parseInt(request.getParameter("id"));
	JdbcDao jdbc = new JdbcDao();
	Course course = jdbc.getCourse(course_id);
	String url_this = "course_edit.jsp?id="+course_id;
	
	if(request.getParameter("confirm") != null)
	{//press the confirm button
		Course tmp = new Course();
		System.out.println("The Course c's id"+course.id);
		tmp.id = course.id;
		
		
		tmp.name = request.getParameter("name");
		tmp.teacher = request.getParameter("teacher");

		tmp.classtime = request.getParameter("classtime");
		
		if(request.getParameter("capacity")!=null && !request.getParameter("capacity").equals(""))
			tmp.capacity = Integer.parseInt(request.getParameter("capacity"));
		
		tmp.valid = 1;

		tmp.content = request.getParameter("content");
		tmp.start_time = request.getParameter("start_time");
		tmp.end_time = request.getParameter("end_time");
		
		
		int validation = tmp.isValid();
		if(validation == 0)
		{
			
      out.write("课程信息没有补全");

		}
		else if(validation == -1)
		{
			
      out.write("上课时间信息不合法");

		}
		else if(validation == 1)
		{
			jdbc.updateCourse(tmp);
			response.sendRedirect("../courses/course.jsp?id="+course_id);
		}
		
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<form name=\"添加课程\" action=");
      out.print(url_this);
      out.write(" method=\"post\">\r\n");
      out.write("\t添加课程界面：\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t课程名称\r\n");
      out.write("\t<input type=\"text\" name=\"name\" value=\"");
      out.print(course.name );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t授课老师\r\n");
      out.write("\t<input type=\"text\" name=\"teacher\" value=\"");
      out.print(course.teacher );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t上课时间 \r\n");
      out.write("\t<input type=\"text\" name=\"classtime\" value=\"");
      out.print(course.classtime );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t客容量\r\n");
      out.write("\t<input type=\"text\" name=\"capacity\" value=\"");
      out.print(course.capacity );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t课程介绍\r\n");
      out.write("\t<input type=\"text\" name=\"content\" value=\"");
      out.print(course.content );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t开始选课时间\r\n");
      out.write("\t<input type=\"text\" name=\"start_time\" value=\"");
      out.print(course.start_time );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t结束选课时间\r\n");
      out.write("\t<input type=\"text\" name=\"end_time\" value=\"");
      out.print(course.end_time );
      out.write("\"/>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t<input type=\"submit\" name = \"confirm\" value=\"确认\" />\r\n");
      out.write("\t</form>\r\n");
      out.write("<hr><a href=\"../home.jsp\">返回首页</a>\r\n");
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