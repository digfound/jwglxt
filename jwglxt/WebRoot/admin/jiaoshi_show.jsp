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

String mark = request.getParameter("mark");
String id = request.getParameter("id");
ArrayList client = array.getLaoshi(id);
String str = "";
if(mark != null && mark.equals("add")){
	str = "���";
}
if(mark != null && mark.equals("update")){
	str = "�޸�";
}
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
      <form method="post" name="form1" action="LaoshiServlet?mark=<%=mark %>&id=<%=id %>&shenfen=laoshi"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">��ʦ��Ϣ</td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">��ʦ�ţ�</td>
            <td height="25" class="tabletd1">&nbsp;<%=client.get(3) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">������</td>
            <td height="25" class="tabletd2">&nbsp;<%=client.get(4) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�Ա�</td>
            <td height="25" class="tabletd1">&nbsp;<%=client.get(5) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">�������ڣ�</td>
            <td height="25" class="tabletd2">&nbsp;<%=client.get(6) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">��ҵԺУ��</td>
            <td height="25" class="tabletd1">&nbsp;<%=client.get(7) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">רҵ��</td>
            <td height="25" class="tabletd2">&nbsp;<%=client.get(8) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">��ͥסַ��</td>
            <td height="25" class="tabletd1">&nbsp;<%=client.get(9) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">��ϵ�绰��</td>
            <td height="25" class="tabletd2">&nbsp;<%=client.get(10) %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�������䣺</td>
            <td height="25" class="tabletd1">&nbsp;<%=client.get(11) %></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
