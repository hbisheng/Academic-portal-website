package edu.thu.cs;
import jdbc.*;

public class User {
	public int id=0;
	public String account="";
	public String password="";
	public String realname="";
	public String nickname="";
	public String sex="";
	public String birth="";
	public String phone="";
	public String e_name="";
	public String e_phone="";
	public String address="";
	public String qq="";
	public int verify=-1;
	public int permit_login=-1;
	public int permit_post=-1;
	public int permit_admin=-1;
	
	public boolean isValid()
	{
		if((account == null)||(password==null)||(realname==null)||(nickname==null)
				||(sex==null)||(birth==null)||(phone==null)||(e_name==null)||(e_phone==null)
				||(address==null))
		{
			return false;
		}
		
		return ( !(account.equals(""))&&!(password.equals(""))&&!(realname.equals(""))
				&&!(nickname.equals(""))&&(!sex.equals(""))&&!(birth.equals(""))&&!(phone.equals(""))
				&&!(e_name.equals(""))&&!(e_phone.equals(""))&&!(address.equals(""))&&!(permit_login==-1)
				&&!(permit_post==-1)&&!(permit_admin==-1)&&!(verify==-1));	
	}
	public int isOld()
	{
		JdbcDao jdbc = new JdbcDao();
		User user = new User();
		user.id=0;
		user.account = account;
		user = jdbc.getUser(user);
		if(user != null)
			return 1;//user
		User user2 = new User();
		user2.id=0;
		user2.account = null;
		user2.nickname = nickname;
		user2 = jdbc.getUser(user2);
		if(user2 != null)
			return 2;//nickname
		return 0;
	}
}
