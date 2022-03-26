<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<%@ page import="DataJava.DBconnect" %>
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
  DBconnect dbcon = new DBconnect();
  Connection con = dbcon.getConnection();
  Statement stmt = null;
  PreparedStatement pst = null;
  ResultSet rs = null;


  String userID = request.getParameter("userID");
  String userPassword = request.getParameter("userPassword");
  String userNickname = request.getParameter("userNickname");
  String userDate = request.getParameter("userDate");
  String sql = null;
  int result = 1;

  

  try {
    sql = "SELECT userID FROM address WHERE userID = ?";
    pst = con.prepareStatement(sql);
    pst.setString(1, userID);
    rs = pst.executeQuery();

    if(rs.next()){
      result = -2;
    } else {
      sql = "SELECT userID FROM address WHERE userNickname = ?";
      pst = con.prepareStatement(sql);
      pst.setString(1, userNickname);
      rs = pst.executeQuery();
      if(rs.next()){
        result = -1;
      }
    }
  } catch (Exception e) {
    e.printStackTrace();
    result = 0;
  }


  PrintWriter script = response.getWriter();

  switch(result) {
    case -2 :
      script.println("<script>");
      script.println("alert('이 ID는 등록되어 있습니다.')");
      script.println("history.back()");
      script.println("</script>");
      break;

    case -1 :
      script.println("<script>");
      script.println("alert('다른 닉네임을 선택해 주세요')");
      script.println("history.back()");
      script.println("</script>");
      break;

    case 0 :
      script.println("<script>");
      script.println("alert('알수없는 오류.')");
      script.println("history.back()");
      script.println("</script>");
      break;

    default :
      break;
  }

  if(result == 1){
    try {
        sql = "INSERT INTO address(userID, userPassword, userNickname, userDate) VALUES (?,?,?,?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, userID);
        pst.setString(2, userPassword);
        pst.setString(3, userNickname);
        pst.setString(4, userDate);
        pst.executeUpdate();

        if(pst != null) try { pst.close(); } catch(SQLException ex) {}
        if(con != null) try { con.close(); } catch(SQLException ex) {}
        script.println("<script>");
        script.println("alert('회원가입을 환영합니다.')");
        script.println("location.href = 'main'");
        script.println("</script>");
        
      } catch (Exception e) {
            e.printStackTrace();
      }

  }
 
%>
</body>
</html>
