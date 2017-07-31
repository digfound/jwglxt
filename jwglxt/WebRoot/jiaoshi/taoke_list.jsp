<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/jiaoshi/top.jsp"/>
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
      <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">逃课管理</td>
        </tr>
        <tr class="tablemenu">
          <td height="20" align="center">序号</td>
          <td height="20" align="center">学生姓名</td>
          <td height="20" align="center">逃课时间</td>
          <td height="20" align="center">逃课原因</td>
          <td height="20" align="center">老师评语</td>
          <td height="20" align="center"></td>
        </tr>
        <%
          ArrayList client = array.getTaoke();
          for(int i = 0;i < client.size();i++){
          	ArrayList alRow = (ArrayList)client.get(i);
			ArrayList xuesheng = array.getXuesheng(alRow.get(1).toString());
           %>
        <tr class="tabletd<%=i%2+1 %>">
          <td height="25" align="center"><%=i+1 %></td>
          <td height="25" align="center"><a title="点击查看详细信息" href="<%=path %>/jiaoshi/xuesheng_show.jsp?id=<%=xuesheng.get(0) %>"><%=xuesheng.get(6) %></a></td>
          <td height="25" align="center"><%=alRow.get(2) %></td>
          <td height="25" align="center"><%=alRow.get(3) %></td>
          <td height="25" align="center"><%=alRow.get(4) %></td>
          <td height="25" align="center"><a href="<%=path %>/jiaoshi/taoke.jsp?mark=update&id=<%=alRow.get(0) %>">修改</a>&nbsp;&nbsp;<a href="<%=path %>/DelServlet?taoke=<%=alRow.get(0) %>">删除</a></td>
        </tr>
        <%} %>
        <tr class="tabletop">
          <td height="25" colspan="12" align="center"><a href="<%=path %>/jiaoshi/taoke.jsp?mark=add">添加逃课</a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/jiaoshi/bottom.jsp"/>
</html>
<%} %>
