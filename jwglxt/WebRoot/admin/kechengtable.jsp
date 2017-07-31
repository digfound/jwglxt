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
String kechengid = request.getParameter("kechengid");
ArrayList client = array.getKechengtable(id);
ArrayList kecheng = array.getKecheng(kechengid);
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
	if (document.form1.didian.value == "" ) 
	{
		alert("请输入上课地点!");
		document.form1.didian.focus();
		return false;
	}
	if (document.form1.xingqi.value == "" ) 
	{
		alert("请选择星期!");
		document.form1.xingqi.focus();
		return false;
	}
	if (document.form1.shangxiawu.value == "" ) 
	{
		alert("请选择上/下午!");
		document.form1.shangxiawu.focus();
		return false;
	}
	if (document.form1.kejie.value == "" ) 
	{
		alert("请选择课节!");
		document.form1.kejie.focus();
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
      <form method="post" name="form1" action="<%=path %>/KechengtableServlet?mark=<%=mark %>&id=<%=id %>&kechengid=<%=kechengid %>"  onSubmit="return chick()">
        <table width="50%" class="border">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3" class="tabletd2">课程安排<%=str %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">课程名称：</td>
            <td height="25" class="tabletd1">&nbsp;<a title="点击查看详细信息" href="<%=path %>/admin/kecheng_show.jsp?id=<%=kecheng.get(0) %>"><%=kecheng.get(1) %></a></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">上课地点：</td>
            <td height="25" class="tabletd2">&nbsp;<input type="text" name="didian" value="<%=client == null || client.size() == 0?"":client.get(2) %>"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">上课时间：</td>
            <td height="25" class="tabletd1">&nbsp;
            <%
            if(client != null && client.size() != 0){
             %>
            <select name="xingqi">
            <option value="">--请选择星期--</option>
            <option value="星期一" <%=client.get(3).equals("星期一")?"selected":"" %>>星期一</option>
            <option value="星期二" <%=client.get(3).equals("星期二")?"selected":"" %>>星期二</option>
            <option value="星期三" <%=client.get(3).equals("星期三")?"selected":"" %>>星期三</option>
            <option value="星期四" <%=client.get(3).equals("星期四")?"selected":"" %>>星期四</option>
            <option value="星期五" <%=client.get(3).equals("星期五")?"selected":"" %>>星期五</option>
            </select>&nbsp;&nbsp;
            <select name="shangxiawu">
            <option value="">--请选择上/下午--</option>
            <option value="上午" <%=client.get(4).equals("上午")?"selected":"" %>>上午</option>
            <option value="下午" <%=client.get(4).equals("下午")?"selected":"" %>>下午</option>
            </select>&nbsp;&nbsp;
            <select name="kejie">
            <option value="">--请选择课节--</option>
            <option value="第一节课" <%=client.get(5).equals("第一节课")?"selected":"" %>>第一节课</option>
            <option value="第二节课" <%=client.get(5).equals("第二节课")?"selected":"" %>>第二节课</option>
            <option value="第三节课" <%=client.get(5).equals("第三节课")?"selected":"" %>>第三节课</option>
            <option value="第四节课" <%=client.get(5).equals("第四节课")?"selected":"" %>>第四节课</option>
            </select>
            <%}else{ %>
            <select name="xingqi">
            <option value="">--请选择星期--</option>
            <option value="星期一">星期一</option>
            <option value="星期二">星期二</option>
            <option value="星期三">星期三</option>
            <option value="星期四">星期四</option>
            <option value="星期五">星期五</option>
            </select>&nbsp;&nbsp;
            <select name="shangxiawu">
            <option value="">--请选择上/下午--</option>
            <option value="上午">上午</option>
            <option value="下午">下午</option>
            </select>&nbsp;&nbsp;
            <select name="kejie">
            <option value="">--请选择课节--</option>
            <option value="第一节课">第一节课</option>
            <option value="第二节课">第二节课</option>
            <option value="第三节课">第三节课</option>
            <option value="第四节课">第四节课</option>
            </select>
            <%} %>
            </td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">备注：</td>
            <td height="25" class="tabletd2">&nbsp;<textarea name="beizhu" cols="45" rows="8"><%=client == null || client.size() == 0?"无":client.get(6) %></textarea></td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd1"><input type="submit" value="提交" class="input"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
