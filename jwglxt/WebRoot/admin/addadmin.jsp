<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
	%><script>alert('您还没有登录!');window.navigate('<%=path %>/index.jsp');</script><%
}else{
 %>
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.name.value == "" ) 
	{
		alert("请输入用户名!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.name.value.length < 3 )  
	{
		alert("用户名长度最少3个字符!");
		document.form1.name.focus();
		return false;
	}
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.pwd.value == "" ) 
	{
		alert("请输入密码!");
		document.form1.pwd.focus();
		return false;
	}
	if (document.form1.pwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form1.pwd.focus();
		return false;
	}
	if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
	if (document.form1.repetition.value == ""  )  
	{
		alert("请输入重复密码!");
		document.form1.repetition.focus();
		return false;
	}
	if (document.form1.repetition.value != document.form1.pwd.value  )  
	{
		alert("两次密码不一致!");
		document.form1.repetition.focus();
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
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="<%=path %>/ModifyAdminServlet?mark=insert" onSubmit="return check()">
        <table width="60%" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3">添加系统用户</td>
		  </tr>
          <tr>
            <td width="46%" height="25" align="right" bgcolor="#DEF1E3">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
            <td width="54%" height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input name="name" type="text" maxlength="10"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#DEF1E3">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
            <td height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input name="pwd" type="password" maxlength="10"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#DEF1E3">重复密码：</td>
            <td height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input type="password" name="repetition"></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" bgcolor="#DEF1E3"><input type="submit" value="提交数据" class="input"></td>
		  </tr>
        </table>
    </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
