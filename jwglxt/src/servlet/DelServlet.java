package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AllBean;
import bean.InsertUpdateDelBean;

public class DelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelServlet() {
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
		
		String sql = "";
		String str = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		AllBean ab = new AllBean();
		
		String adminid = request.getParameter("adminid");
		String laoshi = request.getParameter("laoshi");
		String xuesheng = request.getParameter("xuesheng");
		String banji = request.getParameter("banji");
		String kecheng = request.getParameter("kecheng");
		String chengji = request.getParameter("chengji");
		String kechengtable = request.getParameter("kechengtable");
		String kechengid = request.getParameter("kechengid");
		String taoke = request.getParameter("taoke");
		String tuike = request.getParameter("tuike");
		
		if(adminid != null && !adminid.equals("")){
			str = "/admin/adminlist.jsp";
			sql = "delete from admin where id="+adminid;
			if(adminid.equals("1")){
				request.setAttribute("message", "系统管理员不能删除！");
			}else{
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("message", "操作成功！");
			}
		}
		
		if(laoshi != null && !laoshi.equals("")){
			str = "/admin/jiaoshi_list.jsp";
			sql = "delete from jiaoshi where id="+laoshi;
			ib.insertANDupdateANDdel(sql);
			sql = "update banji set banzhuren=0 where banzhuren="+laoshi;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from kechengtable where kecheng=(select id from kecheng where jiaoshi="+laoshi+")";
			ib.insertANDupdateANDdel(sql);
			sql = "delete from kecheng where jiaoshi="+laoshi;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(xuesheng != null && !xuesheng.equals("")){
			str = "/admin/xuesheng_list.jsp";
			sql = "delete from xuesheng where id="+xuesheng;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from chengji where xuesheng="+xuesheng;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from taoke where xuesheng="+xuesheng;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from xuanke where xuesheng="+xuesheng;
			request.setAttribute("message", "操作成功！");
		}
		
		if(banji != null && !banji.equals("")){
			str = "/admin/banji_list.jsp";
			sql = "delete from banji where id="+banji;
			ib.insertANDupdateANDdel(sql);
			sql = "update xuesheng set banji=0 where banji="+banji;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(kecheng != null && !kecheng.equals("")){
			str = "/admin/kecheng_list.jsp";
			sql = "delete from kecheng where id="+kecheng;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from kechengtable where kecheng="+kecheng;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from xuanke where kecheng="+kecheng;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(kechengtable != null && !kechengtable.equals("")){
			str = "/admin/kechengtable_list.jsp?kechengid="+kechengid;
			sql = "delete from kechengtable where id="+kechengtable;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(chengji != null && !chengji.equals("")){
			str = "/jiaoshi/chengji_list.jsp";
			sql = "delete from chengji where id="+chengji;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(taoke != null && !taoke.equals("")){
			str = "/jiaoshi/taoke_list.jsp";
			sql = "delete from taoke where id="+taoke;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(tuike != null && !tuike.equals("")){
			str = "/xuesheng/kecheng_list.jsp";
			sql = "delete from xuanke where id="+tuike;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(str);
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
