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
 * Servlet implementation class RegUser
 */
@WebServlet("/RegUser")
public class RegUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("username");
		String pw=request.getParameter("password");
		String realname=request.getParameter("realname");
		String birthdate=request.getParameter("birthdate");
		String sex=request.getParameter("gender");
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
		userMap.put("username",name);
		userMap.put("password",pw);
		userMap.put("realname",realname);
		userMap.put("birthdate",birthdate);
		userMap.put("sex",sex);
		userMap.put("interest",interest);
		userMap.put("degree",degree);
		userMap.put("intro",intro);
		UserService userservice=new UserService();
		boolean result=userservice.regUser(userMap);
		if(result)
		{
			request.setAttribute("messageInfo", "恭喜您，注册成功！");
		}else
		{
			request.setAttribute("messageInfo", "遗憾您，注册失败！");
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
