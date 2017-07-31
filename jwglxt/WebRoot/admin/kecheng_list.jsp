<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
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
	%>
<script>alert('您还没有登录!');window.navigate('<%=path %>/index.jsp');</script>
<%
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
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center"><table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <form name="form1" method="post" action="<%=path %>/admin/kecheng_list.jsp">
        <table border="0" cellspacing="1" cellpadding="5">
          <tr>
            <td bgcolor="#CCCCCC">按课程名称查询</td>
            <td bgcolor="#CCCCCC"><input name="guanjian" type="text"></td>
            <td bgcolor="#CCCCCC"><input type="submit" value="查询"></td>
          </tr>
        </table>
      </form>
      <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">课程管理</td>
        </tr>
        <tr class="tablemenu">
          <td height="20" align="center">序号</td>
          <td height="20" align="center">课程名称</td>
          <td height="20" align="center">授课教师</td>
          <td height="20" align="center">总课时</td>
          <td height="20" align="center">备注</td>
          <td height="20" align="center"></td>
          <td height="20" align="center"></td>
        </tr>
        <%
          ArrayList client = array.getKecheng();
          Validate v = new Validate();
          String guanjian = v.getUnicode(request.getParameter("guanjian"));
          if(guanjian != null && !guanjian.equals("")){
          	client = array.getKechengcha(guanjian);
          }
          for(int i = 0;i < client.size();i++){
          	ArrayList alRow = (ArrayList)client.get(i);
          	ArrayList jiaoshi = array.getLaoshi(alRow.get(2).toString());
           %>
        <tr class="tabletd<%=i%2+1 %>">
          <td height="25" align="center"><%=i+1 %></td>
          <td height="25" align="center"><a title="点击查看详细信息" href="<%=path %>/admin/kecheng_show.jsp?id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
          <td height="25" align="center"><a title="点击查看详细信息" href="<%=path %>/admin/jiaoshi_show.jsp?id=<%=jiaoshi.get(0) %>"><%=jiaoshi.get(4) %></a></td>
          <td height="25" align="center"><%=alRow.get(3) %></td>
          <td height="25" align="center"><%=alRow.get(4) %></td>
          <td height="25" align="center"><a href="<%=path %>/admin/kechengtable_list.jsp?kechengid=<%=alRow.get(0) %>">课程安排</a></td>
          <td height="25" align="center"><a href="<%=path %>/admin/kecheng.jsp?mark=update&id=<%=alRow.get(0) %>">修改</a>&nbsp;&nbsp;<a href="<%=path %>/DelServlet?kecheng=<%=alRow.get(0) %>">删除</a></td>
        </tr>
        <%} %>
        <tr class="tabletop">
          <td height="25" colspan="12" align="center"><a href="<%=path %>/admin/kecheng.jsp?mark=add">添加课程</a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
