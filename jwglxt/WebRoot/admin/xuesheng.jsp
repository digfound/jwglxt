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
ArrayList client = array.getXuesheng(id);
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
	<%
	if(mark != null && mark.equals("add")){
	%>
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("�û���ֻ�ܰ�����ĸ������!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.name.value.length < 3 )  
	{
		alert("�û�����������3���ַ�!");
		document.form1.name.focus();
		return false;
	}
	if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("����ֻ�ܰ�����ĸ������!");
		document.form1.pwd.focus();
		return false;
	}
	if (document.form1.pwd.value.length < 3 )  
	{
		alert("���볤������3���ַ�!");
		document.form1.pwd.focus();
		return false;
	}
	<%
	}
	%>
	if (document.form1.banji.value == "" ) 
	{
		alert("��ѡ��༶!");
		document.form1.banji.focus();
		return false;
	}
	if (document.form1.xuehao.value == "" ) 
	{
		alert("������ѧ��!");
		document.form1.xuehao.focus();
		return false;
	}
	if (document.form1.zhiwu.value == "" ) 
	{
		alert("������ְ��!");
		document.form1.zhiwu.focus();
		return false;
	}
	if (document.form1.zhenname.value == "" ) 
	{
		alert("����������!");
		document.form1.zhenname.focus();
		return false;
	}
	if (document.form1.shengri.value == "" ) 
	{
		alert("�������������!");
		document.form1.shengri.focus();
		return false;
	}
	if (document.form1.zuohao.value == "" ) 
	{
		alert("����������!");
		document.form1.zuohao.focus();
		return false;
	}
	if (document.form1.shenfenzheng.value == "" ) 
	{
		alert("���������֤��!");
		document.form1.shenfenzheng.focus();
		return false;
	}
	if (document.form1.minzu.value == "" ) 
	{
		alert("����������!");
		document.form1.minzu.focus();
		return false;
	}
	if (document.form1.jiguan.value == "" ) 
	{
		alert("�����뼮��!");
		document.form1.jiguan.focus();
		return false;
	}
	if (document.form1.hukou.value == "" ) 
	{
		alert("�����뻧�����ڵ�!");
		document.form1.hukou.focus();
		return false;
	}
	if (document.form1.address.value == "" ) 
	{
		alert("�������ͥסַ!");
		document.form1.address.focus();
		return false;
	}
	if (!ints.test(document.form1.phone.value))  
	{
		alert("��ϵ�绰��ʽ����(����02412345678)!");
		document.form1.phone.focus();
		return false;
	}
	if (!emails.test(document.form1.email.value))  
	{
		alert("���������ʽ����(����123@163.com)!");
		document.form1.email.focus();
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
      <form method="post" name="form1" action="<%=path %>/XueshengServlet?mark=<%=mark %>&id=<%=id %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">ѧ��<%=str %></td>
          </tr>
          <%
          if(mark.equals("add")){
           %>
          <tr>
            <td height="25" align="right" class="tabletd1">�û�����</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="name"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">���룺</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="password" name="pwd"></td>
          </tr>
          <%} %>
          <tr>
            <td height="25" align="right" class="tabletd1">�༶��</td>
            <td height="25" class="tabletd1">&nbsp;
              <select name="banji">
              	<option value="">--��ѡ��༶--</option>
                <%
                ArrayList laoshi = array.getBanji();
                for(int i = 0;i < laoshi.size();i++){
                	ArrayList alRow = (ArrayList)laoshi.get(i);
                	if(client == null || client.size() == 0){
                 %>
                <option value="<%=alRow.get(0) %>"><%=alRow.get(1) %></option>
                <%}else{ %>
            	<option value="<%=alRow.get(0) %>" <%=client.get(3).equals(alRow.get(0))?"selected":"" %>><%=alRow.get(1) %></option>
            	<%}} %>
              </select></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">ѧ�ţ�</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="xuehao" value="<%=client == null || client.size() == 0?"":client.get(4) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">ְ��</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="zhiwu" value="<%=client == null || client.size() == 0?"":client.get(5) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">������</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="zhenname" value="<%=client == null || client.size() == 0?"":client.get(6) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�Ա�</td>
            <td height="25" class="tabletd1">&nbsp;
              <select name="sex">
              <%
              if(client == null || client.size() == 0){
               %>
                <option value="��">��</option>
                <option value="Ů">Ů</option>
              <%}else{ %>
              	<option value="��" <%=client.get(7).equals("��")?"selected":"" %>>��</option>
                <option value="Ů" <%=client.get(7).equals("Ů")?"selected":"" %>>Ů</option>
              <%} %>
              </select></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">�������ڣ�</td>
            <td height="25" class="tabletd2">&nbsp;
              <%
                if(mark.equals("add")){
                 %>
              <input type="text" name="shengri" class="Wdate" id="d4321" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">
              <%
                }else{
                 %>
              <input type="text" name="shengri" class="Wdate" id="d4321" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<%=client.get(8) %>">
              <%} %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">���ţ�</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="zuohao" value="<%=client == null || client.size() == 0?"":client.get(9) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">���֤�ţ�</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="shenfenzheng" value="<%=client == null || client.size() == 0?"":client.get(10) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">���壺</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="minzu" value="<%=client == null || client.size() == 0?"":client.get(11) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">���᣺</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="jiguan" value="<%=client == null || client.size() == 0?"":client.get(12) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">�������ڵأ�</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="hukou" value="<%=client == null || client.size() == 0?"":client.get(13) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">��ͥסַ��</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="address" value="<%=client == null || client.size() == 0?"":client.get(14) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">��ϵ�绰��</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="phone" value="<%=client == null || client.size() == 0?"":client.get(15) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">�������䣺</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="email" value="<%=client == null || client.size() == 0?"":client.get(16) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">��ע��</td>
            <td height="25" class="tabletd1">&nbsp;
              <textarea name="beizhu" cols="50" rows="8"><%=client == null || client.size() == 0?"��":client.get(17) %></textarea></td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2"><input type="submit" value="�ύ" class="input"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
