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
<script>alert('����û�е�¼!');window.navigate('<%=path %>/index.jsp');</script>
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
      <%
          String kechengid = request.getParameter("kechengid");
          ArrayList kecheng = array.getKecheng(kechengid);
          ArrayList client = array.getKechengtable(Integer.parseInt(kechengid));      
       %>
      <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">�γ̰���</td>
        </tr>
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">�γ����ƣ�<a title="����鿴��ϸ��Ϣ" href="<%=path %>/admin/kecheng_show.jsp?id=<%=kecheng.get(0) %>"><%=kecheng.get(1) %></a></td>
        </tr>
        <tr class="tablemenu">
          <td height="20" align="center">���</td>
          <td height="20" align="center">�Ͽεص�</td>
          <td height="20" align="center">�Ͽ�ʱ��</td>
          <td height="20" align="center">��ע</td>
          <td height="20" align="center"></td>
        </tr>
        <%
          for(int i = 0;i < client.size();i++){
          	ArrayList alRow = (ArrayList)client.get(i);
           %>
        <tr class="tabletd<%=i%2+1 %>">
          <td height="25" align="center"><%=i+1 %></td>
          <td height="25" align="center"><%=alRow.get(2) %></td>
          <td height="25" align="center"><%=alRow.get(3)+""+alRow.get(4)+""+alRow.get(5) %></td>
          <td height="25" align="center"><%=alRow.get(6) %></td>
          <td height="25" align="center"><a href="<%=path %>/admin/kechengtable.jsp?mark=update&id=<%=alRow.get(0) %>&kechengid=<%=kechengid %>">�޸�</a>&nbsp;&nbsp;<a href="<%=path %>/DelServlet?kechengtable=<%=alRow.get(0) %>&kechengid=<%=kechengid %>">ɾ��</a></td>
        </tr>
        <%} %>
        <tr class="tabletop">
          <td height="25" colspan="12" align="center"><a href="<%=path %>/admin/kechengtable.jsp?mark=add&kechengid=<%=kechengid %>">��ӿγ̰���</a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
