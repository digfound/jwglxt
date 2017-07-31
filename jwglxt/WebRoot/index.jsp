<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教务管理系统</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
.dandong {
	font-family: 黑体;
	font-size:28px;
	color:#000;
}
-->
</style>
<script language="JavaScript">
function correctPNG()
{
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}
window.attachEvent("onload", correctPNG);
</script>
<script language="javascript">
function login()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	else if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
}
</script>
<link href="<%=path %>/img/skin.css" rel="stylesheet" type="text/css">
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
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
        <tr>
          <td width="1%" height="21">&nbsp;</td>
          <td height="42">&nbsp;</td>
          <td width="17%">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
        <tr>
          <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
              <tr>
                <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="149">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="80" align="center" valign="top"><img src="<%=path %>/img/bottom_biao.jpg"></td>
                    </tr>
                    <tr>
                      <td height="198" align="center" valign="middle" class="dandong">教务管理系统</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="1%" >&nbsp;</td>
          <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%" height="38"><span class="login_txt_bt">教务管理系统</span></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                    <tr>
                      <td height="164" colspan="2" align="center"><form name="form1" action="<%=path %>/UserLoginServlet" method="post" onSubmit="return login()">
                          <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                            <tr>
                              <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp;</span></td>
                              <td height="38" colspan="2" class="top_hui_text"><input name="name" class="editbox4" value="" size="20"></td>
                            </tr>
                            <tr>
                              <td width="13%" height="35" class="top_hui_text"><span class="login_txt">密 码：&nbsp;&nbsp;</span></td>
                              <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="20" name="pwd">
                                <img src="<%=path %>/img/luck.gif" width="19" height="18"></td>
                            </tr>
                            <tr>
                              <td height="30" scope="row" class="top_hui_text"><span class="login_txt">登录身份：&nbsp;&nbsp;</span></td>
                              <td height="30" class="top_hui_text">
                                <select name="shenfen">
                                  <option value="xuesheng">学生</option>
                                  <option value="jiaoshi">教师</option>
                                  <option value="admin">管理员</option>
                                </select></td>
                            </tr>
                            <tr>
                              <td height="35" >&nbsp;</td>
                              <td width="20%" height="35" ><input name="Submit" type="submit" class="button" id="Submit" value="登 陆"></td>
                              <td width="67%" class="top_hui_text"><input name="cs" type="reset" class="button" id="cs" value="取 消" onClick="showConfirmMsg1()"></td>
                            </tr>
                          </table>
                          <br>
                        </form></td>
                    </tr>
                    <tr>
                      <td width="433" height="164" align="right" valign="bottom"><img src="<%=path %>/img/login-wel.gif" width="242" height="138"></td>
                      <td width="57" align="right" valign="bottom">&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
