package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class KechengtableServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public KechengtableServlet() {
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
		String kechengid = request.getParameter("kechengid");
		String didian = request.getParameter("didian");
		String xingqi = request.getParameter("xingqi");
		String shangxiawu = request.getParameter("shangxiawu");
		String kejie = request.getParameter("kejie");
		String beizhu = request.getParameter("beizhu");
		
		String str = "";
		String sql = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		if(mark != null && mark.equals("add")){
			str = "/admin/kechengtable_list.jsp?kechengid="+kechengid;
			sql = "insert into kechengtable(kecheng,didian,xingqi,shangxiawu,kejie,beizhu) values('"+kechengid+"','"+didian+"','"+xingqi+"','"+shangxiawu+"','"+kejie+"','"+beizhu+"')";
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		if(mark != null && mark.equals("update")){
			str = "/admin/kechengtable_list.jsp?kechengid="+kechengid;
			sql = "update kechengtable set didian='"+didian+"',xingqi='"+xingqi+"',shangxiawu='"+shangxiawu+"',kejie='"+kejie+"',beizhu='"+beizhu+"' where id="+id;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
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
