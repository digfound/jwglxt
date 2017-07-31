<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
      <%
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		if(adminlogin == null || adminlogin.size() == 0){
			%><script>alert('Äú»¹Ã»ÓÐµÇÂ¼!');window.navigate('<%=path %>/index.jsp');</script><%
		}else{
    		%><script>window.navigate('<%=path %>/<%=adminlogin.get(3) %>/modifypwd.jsp');</script><%
    	}
     %>
  </body>
</html>
