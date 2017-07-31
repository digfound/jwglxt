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
ArrayList client = array.getXuesheng(id);
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
	<%
	if(mark != null && mark.equals("add")){
	%>
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.name.value.length < 3 )  
	{
		alert("用户名长度最少3个字符!");
		document.form1.name.focus();
		return false;
	}
	if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
	if (document.form1.pwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form1.pwd.focus();
		return false;
	}
	<%
	}
	%>
	if (document.form1.banji.value == "" ) 
	{
		alert("请选择班级!");
		document.form1.banji.focus();
		return false;
	}
	if (document.form1.xuehao.value == "" ) 
	{
		alert("请输入学号!");
		document.form1.xuehao.focus();
		return false;
	}
	if (document.form1.zhiwu.value == "" ) 
	{
		alert("请输入职务!");
		document.form1.zhiwu.focus();
		return false;
	}
	if (document.form1.zhenname.value == "" ) 
	{
		alert("请输入姓名!");
		document.form1.zhenname.focus();
		return false;
	}
	if (document.form1.shengri.value == "" ) 
	{
		alert("请输入出生日期!");
		document.form1.shengri.focus();
		return false;
	}
	if (document.form1.zuohao.value == "" ) 
	{
		alert("请输入座号!");
		document.form1.zuohao.focus();
		return false;
	}
	if (document.form1.shenfenzheng.value == "" ) 
	{
		alert("请输入身份证号!");
		document.form1.shenfenzheng.focus();
		return false;
	}
	if (document.form1.minzu.value == "" ) 
	{
		alert("请输入民族!");
		document.form1.minzu.focus();
		return false;
	}
	if (document.form1.jiguan.value == "" ) 
	{
		alert("请输入籍贯!");
		document.form1.jiguan.focus();
		return false;
	}
	if (document.form1.hukou.value == "" ) 
	{
		alert("请输入户口所在地!");
		document.form1.hukou.focus();
		return false;
	}
	if (document.form1.address.value == "" ) 
	{
		alert("请输入家庭住址!");
		document.form1.address.focus();
		return false;
	}
	if (!ints.test(document.form1.phone.value))  
	{
		alert("联系电话格式错误(例如02412345678)!");
		document.form1.phone.focus();
		return false;
	}
	if (!emails.test(document.form1.email.value))  
	{
		alert("电子邮箱格式错误(例如123@163.com)!");
		document.form1.email.focus();
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
      <form method="post" name="form1" action="<%=path %>/XueshengServlet?mark=<%=mark %>&id=<%=id %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">学生<%=str %></td>
          </tr>
          <%
          if(mark.equals("add")){
           %>
          <tr>
            <td height="25" align="right" class="tabletd1">用户名：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="name"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">密码：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="password" name="pwd"></td>
          </tr>
          <%} %>
          <tr>
            <td height="25" align="right" class="tabletd1">班级：</td>
            <td height="25" class="tabletd1">&nbsp;
              <select name="banji">
              	<option value="">--请选择班级--</option>
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
            <td height="25" align="right" class="tabletd2">学号：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="xuehao" value="<%=client == null || client.size() == 0?"":client.get(4) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">职务：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="zhiwu" value="<%=client == null || client.size() == 0?"":client.get(5) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">姓名：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="zhenname" value="<%=client == null || client.size() == 0?"":client.get(6) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">性别：</td>
            <td height="25" class="tabletd1">&nbsp;
              <select name="sex">
              <%
              if(client == null || client.size() == 0){
               %>
                <option value="男">男</option>
                <option value="女">女</option>
              <%}else{ %>
              	<option value="男" <%=client.get(7).equals("男")?"selected":"" %>>男</option>
                <option value="女" <%=client.get(7).equals("女")?"selected":"" %>>女</option>
              <%} %>
              </select></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">出生日期：</td>
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
            <td height="25" align="right" class="tabletd1">座号：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="zuohao" value="<%=client == null || client.size() == 0?"":client.get(9) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">身份证号：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="shenfenzheng" value="<%=client == null || client.size() == 0?"":client.get(10) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">民族：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="minzu" value="<%=client == null || client.size() == 0?"":client.get(11) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">籍贯：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="jiguan" value="<%=client == null || client.size() == 0?"":client.get(12) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">户口所在地：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="hukou" value="<%=client == null || client.size() == 0?"":client.get(13) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">家庭住址：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="address" value="<%=client == null || client.size() == 0?"":client.get(14) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">联系电话：</td>
            <td height="25" class="tabletd1">&nbsp;
              <input type="text" name="phone" value="<%=client == null || client.size() == 0?"":client.get(15) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">电子邮箱：</td>
            <td height="25" class="tabletd2">&nbsp;
              <input type="text" name="email" value="<%=client == null || client.size() == 0?"":client.get(16) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">备注：</td>
            <td height="25" class="tabletd1">&nbsp;
              <textarea name="beizhu" cols="50" rows="8"><%=client == null || client.size() == 0?"无":client.get(17) %></textarea></td>
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
