<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�������ϵͳ</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/img/admin.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/img/css.css">
    <script language="JavaScript" type="text/javascript" src="<%=path %>/img/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<table cellSpacing="0" cellPadding="0" width="100%" background="<%=path %>/img/header_bg.jpg" border="0">
  <tr height="56">
    <td><img src="<%=path %>/img/header_left.jpg"></TD>
    <td>
    </td>
    <td align="right"><img src="<%=path %>/img/header_right.jpg"></td>
  </tr>
</table>
<table cellSpacing=0 cellPadding=0 width="100%" border=0>
  <tr bgColor=#1c5db6 height=4>
    <td><DIV id=menu_bg>
<DIV id=nav>
<UL>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/taoke_list.jsp">�ӿι���</A></LI>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/chengji_list.jsp">�ɼ�����</A></LI>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/xuesheng_list.jsp">ѧ����Ϣ</A></LI>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/banji_list.jsp">�༶��Ϣ</A></LI>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/jiaoshi_show.jsp">���˵���</A></LI>
  <LI class="navbg"><A href="<%=path %>/jiaoshi/modifypwd.jsp">�޸�����</A></LI>
  <LI class="navbg"><A href="<%=path %>/RemoveServlet?mark=admin">ע���˳�</A></LI>
</UL></DIV></DIV></td>
  </tr>
</table>
</body>
</html>
