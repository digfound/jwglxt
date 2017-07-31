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
String mark = request.getParameter("mark");
String id = request.getParameter("id");
ArrayList client = array.getBanji(id);
String str = "";
if(mark != null && mark.equals("add")){
	str = "添加";
}
if(mark != null && mark.equals("update")){
	str = "修改";
}
 %>
<script language="JavaScript">
function chick()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.name.value == "" ) 
	{
		alert("请输入班级名称!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.nianji.value == "" ) 
	{
		alert("请输入年级!");
		document.form1.nianji.focus();
		return false;
	}
	if (document.form1.banzhuren.value == "" ) 
	{
		alert("请选择班主任!");
		document.form1.banzhuren.focus();
		return false;
	}
	if (!ints.test(document.form1.renshu.value))  
	{
		alert("人数只能是整数!");
		document.form1.renshu.focus();
		return false;
	}
	if (document.form1.shuoming.value == "" ) 
	{
		alert("请输入说明!");
		document.form1.shuoming.focus();
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
      <form method="post" name="form1" action="<%=path %>/BanjiServlet?mark=<%=mark %>&id=<%=id %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">班级<%=str %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">班级名称：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="name" value="<%=client == null || client.size() == 0?"":client.get(1) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">年级：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="nianji" value="<%=client == null || client.size() == 0?"":client.get(2) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">班主任：</td>
            <td height="25" class="tabletd1">&nbsp;
              <select name="banzhuren">
              	<option value="">--请选择班主任--</option>
                <%
                ArrayList laoshi = array.getLaoshi();
                for(int i = 0;i < laoshi.size();i++){
                	ArrayList alRow = (ArrayList)laoshi.get(i);
                	if(client == null || client.size() == 0){
                 %>
                <option value="<%=alRow.get(0) %>"><%=alRow.get(4) %></option>
                <%}else{ %>
                <option value="<%=alRow.get(0) %>" <%=client.get(3).equals(alRow.get(0))?"selected":"" %>><%=alRow.get(4) %></option>
                <%}} %>
              </select></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">人数：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="renshu" value="<%=client == null || client.size() == 0?"":client.get(4) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">说明：</td>
            <td height="25" class="tabletd1">&nbsp;
              <textarea name="shuoming" cols="50" rows="8"><%=client == null || client.size() == 0?"无":client.get(5) %></textarea></td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2"><input type="submit" value="提交" class="input"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
