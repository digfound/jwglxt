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
      <form name="form1" method="post" action="<%=path %>/jiaoshi/xuesheng_list.jsp">
        <table border="0" cellspacing="1" cellpadding="5">
          <tr>
            <td bgcolor="#CCCCCC">��ѧ��������ѯ</td>
            <td bgcolor="#CCCCCC"><input name="guanjian" type="text"></td>
            <td bgcolor="#CCCCCC"><input type="submit" value="��ѯ"></td>
          </tr>
        </table>
      </form>
      <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">ѧ����Ϣ</td>
        </tr>
        <tr class="tablemenu">
          <td height="20" align="center">���</td>
          <td height="20" align="center">�༶</td>
          <td height="20" align="center">ѧ��</td>
          <td height="20" align="center">ְ��</td>
          <td height="20" align="center">����</td>
          <td height="20" align="center">�Ա�</td>
          <td height="20" align="center">��������</td>
          <td height="20" align="center">��ͥסַ</td>
          <td height="20" align="center">��ϵ�绰</td>
          <td height="20" align="center">��������</td>
        </tr>
        <%
          ArrayList client = array.getXuesheng();
          Validate v = new Validate();
          String guanjian = v.getUnicode(request.getParameter("guanjian"));
          if(guanjian != null && !guanjian.equals("")){
          	client = array.getXueshengcha(guanjian);
          }
          for(int i = 0;i < client.size();i++){
          	ArrayList alRow = (ArrayList)client.get(i);
			ArrayList banji = array.getBanji(alRow.get(3).toString());
           %>
        <tr class="tabletd<%=i%2+1 %>">
          <td height="25" align="center"><%=i+1 %></td>
          <td height="25" align="center"><%=banji.get(1) %></td>
          <td height="25" align="center"><a title="����鿴��ϸ��Ϣ" href="<%=path %>/jiaoshi/xuesheng_show.jsp?id=<%=alRow.get(0) %>"><%=alRow.get(4) %></a></td>
          <td height="25" align="center"><%=alRow.get(5) %></td>
          <td height="25" align="center"><%=alRow.get(6) %></td>
          <td height="25" align="center"><%=alRow.get(7) %></td>
          <td height="25" align="center"><%=alRow.get(8) %></td>
          <td height="25" align="center"><%=alRow.get(14) %></td>
          <td height="25" align="center"><%=alRow.get(15) %></td>
          <td height="25" align="center"><%=alRow.get(16) %></td>
        </tr>
        <%} %>
      </table></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/jiaoshi/bottom.jsp"/>
</html>
<%} %>
