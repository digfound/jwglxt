package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class LaoshiServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LaoshiServlet() {
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String jiaoshihao = request.getParameter("jiaoshihao");
		String zhenname = request.getParameter("zhenname");
		String sex = request.getParameter("sex");
		String shengri = request.getParameter("shengri");
		String yuanxiao = request.getParameter("yuanxiao");
		String zhuanye = request.getParameter("zhuanye");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		String str = "";
		String sql = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		if(mark != null && mark.equals("add")){
			str = "/admin/jiaoshi_list.jsp";
			sql = "insert into jiaoshi(name,pwd,jiaoshihao,zhenname,sex,shengri,yuanxiao,zhuanye,phone,address,email,shenfen) values('"+name+"','"+pwd+"','"+jiaoshihao+"','"+zhenname+"','"+sex+"','"+shengri+"','"+yuanxiao+"','"+zhuanye+"','"+phone+"','"+address+"','"+email+"','laoshi')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/jiaoshi.jsp?mark="+mark;
				request.setAttribute("message", "用户名或教师号重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		if(mark != null && mark.equals("update")){
			str = "/admin/jiaoshi_list.jsp";
			sql = "update jiaoshi set jiaoshihao='"+jiaoshihao+"',zhenname='"+zhenname+"',sex='"+sex+"',shengri='"+shengri+"',yuanxiao='"+yuanxiao+"',zhuanye='"+zhuanye+"',phone='"+phone+"',address='"+address+"',email='"+email+"' where id="+id;
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/jiaoshi.jsp?mark="+mark+"&id="+id;
				request.setAttribute("message", "教师号重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		
		RequestDispatcher rd=request.getRequestDispatcher(str);
        rd.forward(request,response);
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
