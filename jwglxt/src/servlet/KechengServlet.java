package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class KechengServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public KechengServlet() {
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
		String jiaoshi = request.getParameter("jiaoshi");
		String keshi = request.getParameter("keshi");
		String beizhu = request.getParameter("beizhu");
		
		String str = "";
		String sql = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		if(mark != null && mark.equals("add")){
			str = "/admin/kecheng_list.jsp";
			sql = "insert into kecheng(name,jiaoshi,keshi,beizhu) values('"+name+"','"+jiaoshi+"','"+keshi+"','"+beizhu+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/kecheng.jsp?mark="+mark;
				request.setAttribute("message", "课程名称重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		if(mark != null && mark.equals("update")){
			str = "/admin/kecheng_list.jsp";
			sql = "update kecheng set name='"+name+"',jiaoshi='"+jiaoshi+"',keshi='"+keshi+"',beizhu='"+beizhu+"' where id="+id;
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/kecheng.jsp?mark="+mark+"&id="+id;
				request.setAttribute("message", "课程名称重复！");
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
