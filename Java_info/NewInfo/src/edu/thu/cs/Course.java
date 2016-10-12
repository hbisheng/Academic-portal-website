package edu.thu.cs;

import java.text.SimpleDateFormat;
import java.util.*;

public class Course {
	public int id = 0;
	public String name = null;
	public String teacher = null; 
	public String classtime = null;
	public String content = null;
	
	public String start_time = null;
	public String end_time = null;
	
	public int capacity = 0;
	public int valid = 0;

	public int isValid()
	{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		start_time = df.format(c.getTime());
		end_time=df.format(c.getTime());
		
		if((name==null)||(teacher==null)||(classtime==null)||(content==null))
			return 0;
		if(name.equals("")||teacher.equals("")||classtime.equals("")||content.equals(""))
			return 0;
		
		int period = Integer.parseInt(classtime);
		
		if( (period/10 > 7)||(period %10 >7))
			return -1;//不合法的课程时间
		
		return 1;//合法
	
	}
	
}
