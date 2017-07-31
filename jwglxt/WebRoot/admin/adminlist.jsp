<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AdminListBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('<%=path %>/index.jsp');</script><%
}else{
 %>
</head>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>  
  <body>
    <table width="920" border="0" cellspacing="0" cellpadding="0" background="<%=path%>/img/all_bg.jpg">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="ModifyAdminServlet?mark=username" onSubmit="return check()">
        <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
          <tr class="tabletop">
            <td height="25" colspan="4" align="center">系统用户管理</td>
		  </tr>
          <tr class="tablemenu">
            <td height="20" align="center">序号</td>
            <td height="20" align="center">用户ID</td>
            <td height="20" align="center">用户名</td>
            <td height="20" align="center"></td>
          </tr>
          <%
          ArrayList admin = array.getAdminList();
          for(int i = 0;i < admin.size();i++){
          	ArrayList alRow = (ArrayList)admin.get(i);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><%=alRow.get(0) %></td>
            <td height="25" align="center"><%=alRow.get(1) %></td>
            <td height="25" align="center"><a href="DelServlet?adminid=<%=alRow.get(0) %>" class="admin">删除</a></td>
          </tr>
          <%} %>
          <tr class="tabletop">
            <td height="25" colspan="7" align="center"><a href="<%=path %>/admin/addadmin.jsp">添加系统用户</a></td>
		  </tr>
		</table>
      </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
