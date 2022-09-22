package cn.edu.neusoft.action.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neusoft.service.UserService;

/**
 * Servlet implementation class DealUpdateUser
 */
@WebServlet("/DealUpdateUser")
public class DealUpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealUpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid=request.getParameter("uid");
		String pw=request.getParameter("password");
		String realname=request.getParameter("realname");
		String sex=request.getParameter("gender");
		String birthday=request.getParameter("birthdate");
		String[] interests=request.getParameterValues("interest"); 
		String degree=request.getParameter("degree");
		String intro=request.getParameter("intro");
		String interest="";
		if(interests==null)
		{
			interest="无爱好";
		}else
		{
		  for(int i=0;i<interests.length;i++)
		   {
			 interest=interest+interests[i];
			 if(i!=interests.length-1)
			 {
				 interest=interest+",";
			 }//登山;上网;健身
		}
		}
		Map<String,String> userMap=new HashMap<String,String>();
		userMap.put("userid",uid);
		userMap.put("password",pw);
		userMap.put("realname",realname);
		userMap.put("birthdate",birthday);
		userMap.put("gender",sex);
		userMap.put("degree",degree);
		userMap.put("interest",interest);
		userMap.put("intro",intro);
		UserService userservice=new UserService(); 
		boolean rs=userservice.updateUser(userMap);
		if(rs)
		{
			request.setAttribute("messageInfo", "恭喜！修改用户信息成功！");
		}
		else
		{
			request.setAttribute("messageInfo", "哎 出错了！修改用户信息失败！");
		}
		request.getRequestDispatcher("/common/message.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
