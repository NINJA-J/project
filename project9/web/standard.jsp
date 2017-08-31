<%--
  Created by IntelliJ IDEA.
  User: 陈星潼
  Date: 2017/8/26
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="Jonathan.SQLConnection" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>能力规范文稿管理系统</title>
    <!-- Bootstrap CSS 文件 -->
    <link rel="stylesheet" href="./static/bootstrap/css/login.css">
    <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
    <style>
        div{
            color: lightgrey;
        }
        .standard{
            text-align: center;
            margin:50px auto;
            position: relative;
        }
        .list-group{
            width:500px;
            margin:0 auto;
        }
        span{
            color:cornflowerblue;
            font-weight: bold;
        }
    </style>
</head>

<%
    String id=request.getParameter("id");
    Integer standardid = Integer.valueOf(id).intValue();
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:query dataSource="${snapshot}" var="result_1">
    select * from standard where FileId = <%=standardid%>
</sql:query>
<div class="standard">
    <c:forEach items="${result_1.rows}" var="row_1">
    <h2><c:out value="${row_1.title}"></c:out></h2>
        </br></br>
    <textarea style= "background:transparent;border-style:none;" cols="60" rows="15"><c:out value="${row_1.Content}"></c:out></textarea>
    </c:forEach>
    </br></br>
</div>
<sql:query dataSource="${snapshot}" var="result">
    select *from standard where Status = '4' and ProposalId = 0
</sql:query>
<div class="list-group">
    <c:forEach var="row" items="${result.rows}">
        <button onclick="window.location.href='standard.jsp?id=${row.FileId}'" type="button" style="background-color: transparent;color: pink;border-color: transparent;" class="list-group-item">
            <c:out value="${row.title}"></c:out>
        </button>
    </c:forEach>
</div>
<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
