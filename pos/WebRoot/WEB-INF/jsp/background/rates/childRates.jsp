<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp" %>
<%@include file="../../common/common-js.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/fenyecss.css" />
	<style type="text/css">
	  input{font-size: 12px}
	</style>
	<script type="text/javascript">
	function checkRates(){  
  var obj=document.getElementsByName('check');  //选择所有name="'test'"的对象，返回数组    
  //取到对象数组后，我们来循环检测它是不是被选中    
  var s='';    
  for(var i=0; i<obj.length; i++){    
    if(obj[i].checked) s+=obj[i].value+',';  //如果选中，将value添加到变量s中    
  }    
  //那么现在来检测s的值就知道选中的复选框的值了    
   var su = s.split(",");
   
   if(s !=""){
	   if(su.length>3){
	   	alert("只能选择一个用户");
	   	return;
	   }
	window.location.href="${pageContext.servletContext.contextPath }/background/user/checkRates.html?id="+su[0]+"";   
   }else{
   	alert("选择一个用户");
   }
}
	</script>
	
</head>
<body>
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/user/queryUserRates.html" method="post">
<table width="100%">
  <tr>
    <td height="30" background="${pageContext.servletContext.contextPath }/images/tab_05.gif"><table width="100%">
      <tr>
        <td width="12" height="30"><img src="${pageContext.servletContext.contextPath }/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%">
          <tr>
            <td width="46%" valign="middle"><table width="100%">
              <tr>
                <td width="5%"><div align="center"><img src="${pageContext.servletContext.contextPath }/images/tb.gif" width="16" height="16" /></div></td>
                <!-- <td width="95%" class="STYLE1"></td> -->
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="${pageContext.servletContext.contextPath }/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td align="center">
  <!-- 这里的表单 name 必须是fenye -->
  	<div class="search_k" align="left">
		<fieldset class="search">
			<legend><img src="${pageContext.servletContext.contextPath }/images/search_btn.gif" align="middle"/>&nbsp;<span class="STYLE1" style="color: blue;">高级查找</span></legend>
			<div class="search_content">
				用户名：<input type="text" name="userName" value="${param.userName}" style="height: 20px"/>　　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="button" value="重置" class="input_btn_style1" onclick="clearText()"/>
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td>
    <div class="search_content">
		<input type="button" value="添加客户费率" class="input_btn_style1" onclick="checkRates()"/>
	</div>
    <table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
          <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1"></td>
 			<td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">用户名</td>
 			<td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">支付通道</td>
            <td width="10%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">交易费率</span></td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算费用 </td>
             <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算上限 </td>
             <sec:authorize ifAnyGranted="ROLE_rates_edituserrates">
             <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">操作 </td>
        	</sec:authorize>
        	</tr>
          
          <c:forEach var="rates" items="${pageView.records}">
          <tr>
          <td height="20" ><input type="checkbox" name="check" value="${rates.id},${rates.userName}" /></td>
            <td height="20" ><span class="STYLE1">${rates.userName}</span></td>
            <td height="20" ><span class="STYLE1">${rates.channelname}</span></td>
            <td height="20" ><span class="STYLE1">${rates.tradingRates}</span></td>
            <td height="20" ><span class="STYLE1">${rates.settlementCosts}元/笔</span></td>
            <td height="20" ><span class="STYLE1">${rates.settlementCaps}元/次</span></td>
            <sec:authorize ifAnyGranted="ROLE_rates_edituserrates">
            <td height="20" ><span class="STYLE1">
     <a href="${pageContext.servletContext.contextPath }/background/user/edituserrates.html?ratesId=${rates.id}">    
            编辑</a></span></td>
            </sec:authorize>
          </tr>
          </c:forEach>
        </table></td>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="${pageContext.servletContext.contextPath }/images/tab_19.gif"><%@include file="../../common/webfenye.jsp" %>
    </td>
  </tr>
</table>
</form>
</body>
</html>