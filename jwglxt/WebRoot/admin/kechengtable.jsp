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
String kechengid = request.getParameter("kechengid");
ArrayList client = array.getKechengtable(id);
ArrayList kecheng = array.getKecheng(kechengid);
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
	if (document.form1.didian.value == "" ) 
	{
		alert("�������Ͽεص�!");
		document.form1.didian.focus();
		return false;
	}
	if (document.form1.xingqi.value == "" ) 
	{
		alert("��ѡ������!");
		document.form1.xingqi.focus();
		return false;
	}
	if (document.form1.shangxiawu.value == "" ) 
	{
		alert("��ѡ����/����!");
		document.form1.shangxiawu.focus();
		return false;
	}
	if (document.form1.kejie.value == "" ) 
	{
		alert("��ѡ��ν�!");
		document.form1.kejie.focus();
		return false;
	}
	if (document.form1.beizhu.value == "" ) 
	{
		alert("�����뱸ע!");
		document.form1.beizhu.focus();
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
      <form method="post" name="form1" action="<%=path %>/KechengtableServlet?mark=<%=mark %>&id=<%=id %>&kechengid=<%=kechengid %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">�γ̰���<%=str %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�γ����ƣ�</td>
            <td height="25" class="tabletd1">&nbsp;<a title="����鿴��ϸ��Ϣ" href="<%=path %>/admin/kecheng_show.jsp?id=<%=kecheng.get(0) %>"><%=kecheng.get(1) %></a></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">�Ͽεص㣺</td>
            <td height="25" class="tabletd2">&nbsp;<input type="text" name="didian" value="<%=client == null || client.size() == 0?"":client.get(2) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�Ͽ�ʱ�䣺</td>
            <td height="25" class="tabletd1">&nbsp;
            <%
            if(client != null && client.size() != 0){
             %>
            <select name="xingqi">
            <option value="">--��ѡ������--</option>
            <option value="����һ" <%=client.get(3).equals("����һ")?"selected":"" %>>����һ</option>
            <option value="���ڶ�" <%=client.get(3).equals("���ڶ�")?"selected":"" %>>���ڶ�</option>
            <option value="������" <%=client.get(3).equals("������")?"selected":"" %>>������</option>
            <option value="������" <%=client.get(3).equals("������")?"selected":"" %>>������</option>
            <option value="������" <%=client.get(3).equals("������")?"selected":"" %>>������</option>
            </select>&nbsp;&nbsp;
            <select name="shangxiawu">
            <option value="">--��ѡ����/����--</option>
            <option value="����" <%=client.get(4).equals("����")?"selected":"" %>>����</option>
            <option value="����" <%=client.get(4).equals("����")?"selected":"" %>>����</option>
            </select>&nbsp;&nbsp;
            <select name="kejie">
            <option value="">--��ѡ��ν�--</option>
            <option value="��һ�ڿ�" <%=client.get(5).equals("��һ�ڿ�")?"selected":"" %>>��һ�ڿ�</option>
            <option value="�ڶ��ڿ�" <%=client.get(5).equals("�ڶ��ڿ�")?"selected":"" %>>�ڶ��ڿ�</option>
            <option value="�����ڿ�" <%=client.get(5).equals("�����ڿ�")?"selected":"" %>>�����ڿ�</option>
            <option value="���Ľڿ�" <%=client.get(5).equals("���Ľڿ�")?"selected":"" %>>���Ľڿ�</option>
            </select>
            <%}else{ %>
            <select name="xingqi">
            <option value="">--��ѡ������--</option>
            <option value="����һ">����һ</option>
            <option value="���ڶ�">���ڶ�</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="������">������</option>
            </select>&nbsp;&nbsp;
            <select name="shangxiawu">
            <option value="">--��ѡ����/����--</option>
            <option value="����">����</option>
            <option value="����">����</option>
            </select>&nbsp;&nbsp;
            <select name="kejie">
            <option value="">--��ѡ��ν�--</option>
            <option value="��һ�ڿ�">��һ�ڿ�</option>
            <option value="�ڶ��ڿ�">�ڶ��ڿ�</option>
            <option value="�����ڿ�">�����ڿ�</option>
            <option value="���Ľڿ�">���Ľڿ�</option>
            </select>
            <%} %>
            </td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">��ע��</td>
            <td height="25" class="tabletd2">&nbsp;<textarea name="beizhu" cols="45" rows="8"><%=client == null || client.size() == 0?"��":client.get(6) %></textarea></td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd1"><input type="submit" value="�ύ" class="input"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
