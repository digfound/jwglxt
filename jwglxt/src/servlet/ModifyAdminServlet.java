package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;

public class ModifyAdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyAdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		
		String mark = request.getParameter("mark");
		
		String newpwd = request.getParameter("newpwd");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "";
		String str = "";
		
		HttpSession  session = request.getSession();
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		
		if(mark != null && mark.equals("password")){
			str = "/"+adminlogin.get(3)+"/modifypwd.jsp";
			sql = "update "+adminlogin.get(3)+" set pwd='"+newpwd+"' where id="+adminlogin.get(0);
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "密码修改成功！");
			adminlogin.set(2, newpwd);
		}
		if(mark != null && mark.equals("insert")){
			str = "/admin/adminlist.jsp";
			sql = "insert into admin(name,pwd,shenfen) values('"+name+"','"+pwd+"','admin')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/addadmin.jsp";
				request.setAttribute("message", "用户名重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		
		request.getRequestDispatcher(str).forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
