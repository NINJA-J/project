<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/25
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Jonathan.SQLConnection" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>能力规范文稿管理系统</title>
  <link rel="stylesheet" href="./static/bootstrap/css/login.css">
  <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
  <style>
    div{
      color: white;
    }
    button{
      filter:alpha(opacity=20);
    }
  </style>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:query dataSource="${snapshot}" var="result">
  select *from standard where Status = '4' and ProposalId = 0
</sql:query>
<div class="container">
  <div class="login_screen">
    <div>
      <h2 style="text-align: center;color: lightgray" >能力规范文稿管理系统</h2>
      </br>
    </div>
    <div class="form_design1">
      <form class="form-horizontal" action="lay_login.jsp" method="POST">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">账户</label>
          <div class="col-sm-10">
            <input type="text" name="username" style="background-color: transparent;color: white" class="form-control" id="inputEmail3" placeholder="账户">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
          <div class="col-sm-10">
            <input type="password" name="password" style="background-color: transparent;color: white" class="form-control" id="inputPassword3" placeholder="密码">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
              <label>
                <input type="checkbox"> 记住我
              </label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit"  class="btn btn-primary">登录</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">注册</button>
          </div>
        </div>
      </form>

    </div>
    <div class="form_design2">
      <%--<div style="margin-top: 20px">--%>
      <%--</div>--%>
      <div class="list-group">
        <c:forEach var="row" items="${result.rows}">
          <button onclick="window.location.href='standard.jsp?id=${row.FileId}'" type="button" style="background-color: transparent;color: #fbbec7;border-color: transparent;" class="list-group-item">
            <c:out value="${row.Title}"></c:out>
          </button>
        </c:forEach>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm"  role="document">
    <div class="modal-content" style="background-color: lightslategray">
      <div class="modal-header">
        <h2 style="text-align: center">注册</h2>
      </div>
      <!--8.26 更新实现简单注册的代码-->
      <!--
      注册用户的用户名为username_sign 密码为password_sign
      点击submit后 跳转到lay_signup.jsp
      -->
      <form class="form-horizontal" action="lay_signup.jsp" method="POST">
        <div class="modal-body">
          <div class="row">
            <div class="form-group">
              <label for="inputNmae" class="col-sm-3 control-label">用户名</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputNmae" placeholder="用户名:4-20位英文字母/数字"  style="width: 200px" name="username_sign">
              </div>
            </div>
            <div class="form-group">
              <label for="inputSex" class="col-sm-3 control-label">密码</label>
              <div class="col-sm-9">
                <input type="password" class="form-control" id="inputSex" placeholder="密码:不能为空" name="password_sign" style="width: 200px">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="submit" class="btn btn-primary">提交</button>
          <button type="reset" class="btn btn-warning">清空</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!--进行页面拦截提示的代码-->

<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<script>
    //取出传回来的参数error并与unLogin比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='unLogin'){
        alert("请先登录!");
    }
    if(errori=='unRegist'){
        alert("请注册！");
    }
    if(errori=='Wrong_username'){
        alert("用户名格式错误！");
    }
    if(errori=='Wrong_pwd'){
        alert("密码不能为空！");
    }
    if(errori=='Wrong_name'){
        alert("会员姓名格式错误！");
    }
    if(errori=='Wrong_phone'){
        alert("手机号码格式错误！");
    }
    if(errori=='Wrong_address'){
        alert("地址不能为空！");
    }
    if(errori=='checking'){
        alert("您的个人信息已提交！请等待管理员审核...");
    }

</script>

