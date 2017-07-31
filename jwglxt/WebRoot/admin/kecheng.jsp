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
ArrayList client = array.getKecheng(id);
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
		alert("请输入课程名称!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.jiaoshi.value == "" ) 
	{
		alert("请选择授课教师!");
		document.form1.jiaoshi.focus();
		return false;
	}
	if (document.form1.keshi.value == "" ) 
	{
		alert("请输入总课时!");
		document.form1.keshi.focus();
		return false;
	}
	if (document.form1.beizhu.value == "" ) 
	{
		alert("请输入备注!");
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
      <form method="post" name="form1" action="<%=path %>/KechengServlet?mark=<%=mark %>&id=<%=id %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">课程<%=str %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">课程名称：</td>
            <td height="25" class="tabletd1">&nbsp;<input type="text" name="name" value="<%=client == null || client.size() == 0?"":client.get(1) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">授课教师：</td>
            <td height="25" class="tabletd2">&nbsp;
            <select name="jiaoshi">
            <option value="">--请选择授课教师--</option>
            <%
            ArrayList jiaoshi = array.getLaoshi();
            for(int i = 0;i < jiaoshi.size();i++){
            	ArrayList alRow = (ArrayList)jiaoshi.get(i);
            	if(client == null || client.size() == 0){
             %>
            <option value="<%=alRow.get(0) %>"><%=alRow.get(4) %></option>
            <%}else{ %>
            <option value="<%=alRow.get(0) %>" <%=client.get(2).equals(alRow.get(0))?"selected":"" %>><%=alRow.get(4) %></option>
            <%}} %>
            </select>
            </td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">总课时：</td>
            <td height="25" class="tabletd1">&nbsp;<input type="text" name="keshi" value="<%=client == null || client.size() == 0?"":client.get(3) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">备注：</td>
            <td height="25" class="tabletd1">&nbsp;<textarea name="beizhu" cols="45" rows="8"><%=client == null || client.size() == 0?"无":client.get(4) %></textarea></td>
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
