<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/26
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>能力规范文稿管理系统</title>
    <style>
        table{
            margin:auto auto;
            color:lightgray;
            font-weight: 400;
        }
        input{
            background-color: rgba(128, 128, 128, 0.24);
            border-radius: 5px;
            border-color: rgba(128, 128, 128, 0.24);
            border: 3px;
        }
    </style>
    <link rel="stylesheet" href="./static/bootstrap/css/login.css">
    <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
</head>
<body>
<!--还未添加跳转页面-->
<div>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    <h2 style="text-align: center;color: lightgray" >能力规范文稿管理系统</h2>
    </br>
</div>
<form action="lay_regist.jsp" method="get">
    <table>
        <tr>
            <td><label for="inputName" >姓名</label></td>
            <td><input type="text" id="inputName" placeholder="请输入姓名" name="u_name" ></td>
        </tr>
        <tr>
            <td><label for="inputBirth" >出生日期</label></td>
            <td><input type="text" id="inputBirth" placeholder="请输入出生日期" name="u_birth"></td>
        </tr>
        <tr>
            <td><label for="inputAddress" >家庭地址</label></td>
            <td><input type="text" id="inputAddress" placeholder="请输入家庭地址" name="u_address"></td>
        </tr>
        <tr>
            <td><label for="inputPhone" >联系方式</label></td>
            <td><input type="text"  id="inputPhone" placeholder="请输入手机号码" name="u_phone"></td>
        </tr>
        <tr>
            <td><label for="inputReferee" >推荐人</label></td>
            <td><input type="text"  id="inputReferee" placeholder="请输入推荐人" name="u_referee"></td>
        </tr>
        <tr>
            <td><label for="inputSex" >性别</label></td>
            <td><select  id="inputSex" name="u_gender" style="color: darkgrey">
                <option>M</option>
                <option>F</option>
            </select></td>
        </tr>
        <tr>
            <td><label for="inputBranch" >行业分会</label></td>
            <td><select id="inputBranch" name="u_branch" style="color: darkgrey">
            <option>1</option>
            <option>2</option>
        </select></td>
        </tr>
        <tr>
            <td><label for="inputCommittee" >专委会</label></td>
            <td><select id="inputCommittee" name="u_committee" style="color: darkgrey">
            <option>1</option>
            <option>2</option>
        </select></td>
        </tr>
        <tr>
            <td><input type="submit" value="注册会员" style="background-color: rgba(128, 128, 128, 0.63)"></td>
            <td><input type="reset" value="重置" style="background-color: rgba(128, 128, 128, 0.63)"></td>
        </tr>
    </table>
</form>
<!--8.30注册界面修改代码-->
<script>
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='err'){
        alert("录入信息失败！");
    }
    if(errori=='Unreferrer'){
        alert("推薦人不存在！");
    }
    if(errori=='date'){
        alert("日期格式错误，请填写为标准格式 ==> ----/--/--");
    }
    if(errori=='Wrong_phone'){
        alert("请输入正确的11位手机号!");
    }
    if(errori=='Wrong_address'){
        alert("地址必填，不能为空！");
    }
    if(errori=='Wrong_name'){
        alert("姓名必填，不能为空！");
    }
</script>
<!--8.30-->
</body>
</html>