<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/26
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "Jonathan.*" %>
<%@ page import = "regexr.Regexr" %>
<html>
<head>
    <title>signup</title>
</head>
<body>
<%
  //从前端用户注册界面 接受用户想要注册的用户名密码

	String username = new String(request.getParameter("username_sign"));
  	String pwd = new String(request.getParameter("password_sign"));

	//正则检测用户名及密码
	Regexr re = new Regexr();
	//用户名错误
	if(!re.compare_reg("^[^_][\\w]{3,19}$",username)){
		pageContext.forward("pro_login.jsp?error=Wrong_username");
	}
	//密码错误
	if(!re.compare_reg("[^\\s]+",pwd)){
		pageContext.forward("pro_login.jsp?error=Wrong_pwd");
	}
  
  	SQLConnection con = new SQLConnection();
  	con.connectToDatabase(
		  	"localhost:3306", 
		  	"dbgirl",
			"root", 
			"111" );

  //这里需要一个 注册新用户的函数adduser
  //参数：String username,String pwd 分别接收用户输入的用户名密码
  //功能：进入User数据库查找这个用户注册的用户名是否已经被注册
  //返回值：int  如果已被注册 则返回0 ; 若未被注册 则返回1
  	switch( con.addLoginInfo( username , pwd ) ){
  	case SQLConnection.USER_EXIST:
%>
<script type="text/javascript" language="javascript">
  		alert("您的用户名已被注册！请重新注册...");
  		window.document.location.href="pro_login.jsp";
</script>
<%
		break;
  	case SQLConnection.SUCCESS:
  		session.setAttribute( "user_now",  username );//2017-8-31 19:32
%>
<script type="text/javascript" language="javascript">
  		alert("注册成功！请登陆并完善您的个人信息");
  		window.document.location.href="pro_login.jsp";
</script>
<%
		break;
  	}
%>


<!--测试用 不用管
//if(username.equals("admin")&&pwd.equals("123")){
//  pageContext.forward("pro_index.jsp");
// }
// else{
//   %><!--<script type="text/javascript" language="javascript">
   //         alert("您的账号正在审核，请耐心等待...");
   // window.document.location.href="pro_login.jsp";

   // </script>-->
  // }-->
</body>
</html>
