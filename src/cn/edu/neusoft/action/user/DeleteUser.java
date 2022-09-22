package cn.edu.neusoft.action.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neusoft.service.UserService;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("uid");
		UserService userservice=new UserService();
		boolean result=userservice.deleteUserById(userid);
		if(result)
		{
			request.setAttribute("messageInfo", "恭喜！删除用户信息成功！");
			System.out.println("恭喜！删除用户信息成功！");
		}else
		{
			request.setAttribute("messageInfo", "哎 出错了！删除用户信息失败！");	
			System.out.println("哎 出错了！删除用户信息失败！");
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
