package cn.edu.neusoft.service;

import java.util.List;
import java.util.Map;

import cn.edu.neusoft.util.DBUtil;

public class UserService {
     DBUtil  db=new DBUtil(); 
	public List<Map<String, String>> getAllUsers() {
		// TODO Auto-generated method stub
		String sql="select * from demo_users";
		List<Map<String,String>> list=db.getList(sql);
		return list;
	}
	public boolean deleteUserById(String userid) {
		// TODO Auto-generated method stub
		String sql="delete from demo_users where userid=?";
		System.out.println("用户ID=！"+userid);
		boolean result=false;
		int rs=db.update(sql, new String[] {userid});
		if(rs==1)
		{
			result=true;
		}
		return result;
	}
	public boolean batchDeleteUser(String[] uesrIds) {
		// TODO Auto-generated method stub
		boolean result=false;
		for(String id:uesrIds) 
		{
			String sql="delete from demo_users where userid=?";
			int rs=db.update(sql,new String[] {id});
			if(rs==1) 
			{
				result=true;
			}else
			{
				result=false;
				break;
			}
		}
		
		return result;
	}
	public Map<String, String> getUserById(String uid) {
		String sql="select * from demo_users where userid=?";
		Map<String, String> user=db.getMap(sql,new String[] {uid});
		return user;
	}
	public boolean updateUser(Map<String, String> userMap) {
		// TODO Auto-generated method stub
		boolean result=false;
		String sql="update demo_users set password=?,realname=?,birthdate=?,gender=?,interest=?,degree=?,intro=? where userid=?";
		int rs=db.update(sql,new String[] {userMap.get("password"),userMap.get("realname"),userMap.get("birthdate"),userMap.get("gender"),userMap.get("interest"),userMap.get("degree"),userMap.get("intro"),userMap.get("userid")});
		if(rs==1)
		{
			result=true;
		}
		return result;
	}
	public List<Map<String, String>> searchUsers(String name) {
		// TODO Auto-generated method stub
		String sql="select * from demo_users where username like ?";
		List<Map<String, String>> ulist=db.getList(sql, new String[]{"%"+name+"%"});
		return ulist;
	}
	public boolean checkUser(String username) {
		// TODO Auto-generated method stub
		boolean rs=false;
		String sql="select * from demo_users where username=?";
		Map<String,String> result=db.getMap(sql, new String[] {username});
		
		if(result==null) 
		{
			rs=true;
		}
		System.out.println("result000"+rs);
		return rs;
	}
	public boolean regUser(Map<String, String> userMap) {
		// TODO Auto-generated method stub
		boolean rs=false;
		String sql="insert into demo_users(username,password,realname,birthdate,gender,interest,degree,intro) values(?,?,?,?,?,?,?,?)";
		String[] params= {userMap.get("username"),userMap.get("password"),userMap.get("realname"),userMap.get("birthdate"),userMap.get("gender"),userMap.get("interest"),userMap.get("degree"),userMap.get("intro"),}; 
		int result=db.update(sql,params);
		if(result==1)
		{
			rs=true;
		}
		return rs;
	}

}
