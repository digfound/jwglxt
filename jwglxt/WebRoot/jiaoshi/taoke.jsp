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
String mark = request.getParameter("mark");
String id = request.getParameter("id");
ArrayList client = array.getTaoke(id);
String str = "";
if(mark != null && mark.equals("add")){
	str = "���";
}
if(mark != null && mark.equals("update")){
	str = "�޸�";
}
 %>
<script language="JavaScript">
function chick()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.xuesheng.value == "" ) 
	{
		alert("��ѡ��ѧ��!");
		document.form1.xuesheng.focus();
		return false;
	}
	if (document.form1.dates.value == "" ) 
	{
		alert("�������ӿ�ʱ��!");
		document.form1.dates.focus();
		return false;
	}
	if (document.form1.yuanyin.value == "" ) 
	{
		alert("�������ӿ�ԭ��!");
		document.form1.yuanyin.focus();
		return false;
	}
	if (document.form1.pingyu.value == "")
	{
		alert("��������ʦ����!");
		document.form1.pingyu.focus();
		return false;
	}
}
</script>
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
      <form method="post" name="form1" action="<%=path %>/TaokeServlet?mark=<%=mark %>&id=<%=id %>"  onSubmit="return chick()">
            <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">�ӿ�<%=str %></td>
		  </tr>
              <tr>
                <td height="25" align="right" class="tabletd1">ѧ��������</td>
                <td height="25" class="tabletd1">&nbsp;<select name="xuesheng">
                <option value="">--��ѡ��ѧ��--</option>
                <%
                ArrayList xuesheng = array.getXuesheng();
                for(int i = 0;i < xuesheng.size();i++){
                	ArrayList alRow = (ArrayList)xuesheng.get(i);
                	if(client == null || client.size() == 0){
                 %>
                <option value="<%=alRow.get(0) %>"><%=alRow.get(6) %></option>
                <%}else{ %>
                <option value="<%=alRow.get(0) %>" <%=client.get(1).equals(alRow.get(0))?"selected":"" %>><%=alRow.get(6) %></option>
                <%}} %>
                </select></td>
              </tr>
              <tr>
                <td height="25" align="right" class="tabletd2">�ӿ�ʱ�䣺</td>
                <td height="25" class="tabletd2">&nbsp;
                <%
                if(mark.equals("add")){
                 %>
                 <input type="text" name="dates" class="Wdate" id="d4321" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                <%
                }else{
                 %>
                 <input type="text" name="dates" class="Wdate" id="d4321" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<%=client.get(2) %>">
                 <%} %>
                </td>
              </tr>
	          <tr>
	            <td height="25" align="right" class="tabletd1">�ӿ�ԭ��</td>
	            <td height="25" class="tabletd1">&nbsp;
	              <textarea name="yuanyin" cols="50" rows="8"><%=client == null || client.size() == 0?"��":client.get(3) %></textarea></td>
	          </tr>
	          <tr>
	            <td height="25" align="right" class="tabletd2">��ʦ���</td>
	            <td height="25" class="tabletd2">&nbsp;
	              <textarea name="pingyu" cols="50" rows="8"><%=client == null || client.size() == 0?"��":client.get(4) %></textarea></td>
	          </tr>
			  <tr>
            	<td height="25" colspan="2" align="center" class="tabletd1"><input type="submit" value="�ύ" class="input"></td>
			  </tr>
            </table>
        </form></td>
  </tr>
</table>
</body> 
<jsp:include flush="true" page="/jiaoshi/bottom.jsp"/>
</html>
<%} %>
