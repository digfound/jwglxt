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
      <form name="form1" method="post" action="<%=path %>/jiaoshi/chengji_list.jsp">
        <table border="0" cellspacing="1" cellpadding="5">
          <tr>
            <td bgcolor="#CCCCCC">�����Կ�Ŀ��ѯ</td>
            <td bgcolor="#CCCCCC"><select name="kaoshikemu">
                <option value="">--��ѡ���Կ�Ŀ--</option>
                <%
                ArrayList kechengs = array.getKecheng();
                for(int i = 0;i < kechengs.size();i++){
                	ArrayList alRow = (ArrayList)kechengs.get(i);
                 %>
                <option value="<%=alRow.get(0) %>"><%=alRow.get(1) %></option>
                <%} %>
              </select></td>
            <td bgcolor="#CCCCCC"><input type="submit" value="��ѯ"></td>
          </tr><tr>
            <td bgcolor="#CCCCCC">�����Է�����ѯ</td>
            <td bgcolor="#CCCCCC"><select name="kaoshifenshu">
                <option value="">--��ѡ���Է���--</option>
                <option value="1">60������</option>
                <option value="2">60��-70��</option>
                <option value="3">71��-80��</option>
                <option value="4">81��-90��</option>
                <option value="5">91������</option>
              </select></td>
            <td bgcolor="#CCCCCC"><input type="submit" value="��ѯ"></td>
          </tr>
        </table>
      </form>
      <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
        <tr class="tabletop">
          <td height="25" colspan="12" align="center">�ɼ�����</td>
        </tr>
        <tr class="tablemenu">
          <td height="20" align="center">���</td>
          <td height="20" align="center">ѧ������</td>
          <td height="20" align="center">���Կ�Ŀ</td>
          <td height="20" align="center">����ʱ��</td>
          <td height="20" align="center">����</td>
          <td height="20" align="center"></td>
          <td height="20" align="center"></td>
        </tr>
        <%
          ArrayList client = array.getChengji();
          Validate v = new Validate();
          String kaoshikemu = v.getUnicode(request.getParameter("kaoshikemu"));
          String kaoshifenshu = v.getUnicode(request.getParameter("kaoshifenshu"));
          if(kaoshikemu != null && !kaoshikemu.equals("")){
          	client = array.getChengjikemu(kaoshikemu);
          }
          if(kaoshifenshu != null && !kaoshifenshu.equals("")){
          	String str = "";
          	if(kaoshifenshu.equals("1")){
          		str = "fenshu<60";
          	}
          	if(kaoshifenshu.equals("2")){
          		str = "fenshu>=60 and fenshu<=70";
          	}
          	if(kaoshifenshu.equals("3")){
          		str = "fenshu>70 and fenshu<=80";
          	}
          	if(kaoshifenshu.equals("4")){
          		str = "fenshu>80 and fenshu<=90";
          	}
          	if(kaoshifenshu.equals("5")){
          		str = "fenshu>90";
          	}
          	client = array.getChengjifenshu(str);
          }
          for(int i = 0;i < client.size();i++){
          	ArrayList alRow = (ArrayList)client.get(i);
			ArrayList xuesheng = array.getXuesheng(alRow.get(1).toString());
			ArrayList kecheng = array.getKecheng(alRow.get(2).toString());
           %>
        <tr class="tabletd<%=i%2+1 %>">
          <td height="25" align="center"><%=i+1 %></td>
          <td height="25" align="center"><a title="����鿴��ϸ��Ϣ" href="<%=path %>/jiaoshi/xuesheng_show.jsp?id=<%=xuesheng.get(0) %>"><%=xuesheng.get(6) %></a></td>
          <td height="25" align="center"><%=kecheng.get(1) %></td>
          <td height="25" align="center"><%=alRow.get(3) %></td>
          <td height="25" align="center"><%=alRow.get(4) %></td>
          <td height="25" align="center"><a href="<%=path %>/jiaoshi/tongji.jsp?xueshengid=<%=alRow.get(1) %>">���˳ɼ�ͳ��</a></td>
          <td height="25" align="center"><a href="<%=path %>/jiaoshi/chengji.jsp?mark=update&id=<%=alRow.get(0) %>">�޸�</a>&nbsp;&nbsp;<a href="<%=path %>/DelServlet?chengji=<%=alRow.get(0) %>">ɾ��</a></td>
        </tr>
        <%} %>
        <tr class="tabletop">
          <td height="25" colspan="12" align="center"><a href="<%=path %>/jiaoshi/chengji.jsp?mark=add">��ӳɼ�</a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/jiaoshi/bottom.jsp"/>
</html>
<%} %>
