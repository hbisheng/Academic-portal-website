package edu.thu.cs;

public class Media {
	public int id = 0;
	public String name=null;
	public String url =null;
	public Integer type = 0;
	public String content = null;
	public boolean isValid()
	{
		if(name==null||url==null||content==null||type==0)
			return false;
		if((name.equals(""))||(url.equals(""))||(content.equals("")))
			return false;
		if(type==0 || type > 3) //1 2 3
			return false;
		return true;
	}
}