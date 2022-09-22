package cn.edu.neusoft.action.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neusoft.service.UserService;

/**
 * Servlet implementation class BatchDeleteUser
 */
@WebServlet("/BatchDeleteUser")
public class BatchDeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchDeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] uesrIds=request.getParameterValues("userId");
		UserService userservice=new UserService();
		boolean result=userservice.batchDeleteUser(uesrIds);
		if(result)
		{
			request.setAttribute("messageInfo", "恭喜！批量删除信息成功！");
			System.out.println("恭喜！批量删除用户信息成功！");
		}else
		{
			request.setAttribute("messageInfo", "哎 出错了！批量删除信息失败！");	
			System.out.println("哎 出错了！批量删除用户信息失败！");
		}
		request.getRequestDispatcher("/common/message.jsp").forward(request, response);
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
