<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>


<html lang="ko">
<head>
    <meta name="generator" content="Hugo 0.79.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">
<title> Envir-Astro </title>
</head>
<body>
<%
    session.removeAttribute("userID");
    session.removeAttribute("userPassword");
    session.removeAttribute("userNickname");
    session.removeAttribute("userDate");

    PrintWriter script = response.getWriter();

    script.println("<script>");
    script.println("alert('로그아웃 완료.')");
    script.println("location.href = 'home.jsp'");
    script.println("</script>");

 
%>
</body>
</html>
