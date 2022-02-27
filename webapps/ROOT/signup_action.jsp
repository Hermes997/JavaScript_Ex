<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>


<html lang="ko">
<head>
    <meta name="generator" content="Hugo 0.79.0">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
<title> Jo's </title>
</head>
<body>
<%
  Connection con = null; // DBMS와 Java연결객체
  Statement stmt = null; // SQL구문을 실행
  ResultSet rs = null; // SQL구문의 실행결과를 저장
  PreparedStatement pst = null;
  out.println("connect clear0");
  Class.forName("org.mariadb.jdbc.Driver");
  try { 
    out.println("connect clear1");
    String dbURL = "jdbc:mariadb://218.158.10.116:3306/mysql"; 
    String dbID = "cus"; 
    String dbPassword = "password"; 
    
    con = DriverManager.getConnection(dbURL, dbID, dbPassword);
    out.println("connect clear2");
  } catch (Exception e) { 
        e.printStackTrace();
  }

  String userID = request.getParameter("userID");
  String userPassword = request.getParameter("userPassword");
  String userNickname = request.getParameter("userNickname");
  String userDate = request.getParameter("userDate");
  String sql = "INSERT INTO address(userID, userPassword, userNickname, userDate) VALUES (?,?,?,?)";
  try {
    pst = con.prepareStatement(sql);
    pst.setString(1, userID);
    pst.setString(2, userPassword);
    pst.setString(3, userNickname);
    pst.setString(4, userDate);
    int result = pst.executeUpdate();
    out.println("sql clear");
  } catch (Exception e) {
        e.printStackTrace();
  } finally {
    if(pst != null) try { pst.close(); out.println("pst close clear");} catch(SQLException ex) {}
    if(con != null) try { con.close(); out.println("con close clear");} catch(SQLException ex) {}
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('회원가입을 환영합니다.')");
    script.println("location.href = 'home.jsp'");
    script.println("</script>");
    }


%>
</body>
</html>
