<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<html>
<head>
<title>회원 목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
      MEMBER 테이블의 내용
      <table width = "100%" border = "1">
      <tr>
            <td>아이디</td>
            <td>비번</td>
            <td>닉네임</td>
            <td>생일</td>
      </tr>

<%
      // 1. JDBC 드라이버 로딩
      Class.forName("org.mariadb.jdbc.Driver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
        String jdbcUrl = "jdbc:mariadb://218.158.10.116:3306/mysql";
        String dbId = "cus";
        String dbPass = "password";
   
        String query = "select * from address";
   
            // 2. 데이터베이스 커넥션 생성
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
   
            // 3. Statement 생성
        stmt = conn.createStatement();
   
            // 4. 쿼리 실행
        rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
        while(rs.next())
            {
%>
      <tr>
            <td><%= rs.getString("userID") %></td>
            <td><%= rs.getString("userPassword") %></td>
            <td><%= rs.getString("userNickname") %></td>
            <td><%= rs.getString("userDate") %></td>
      </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
</body>
</html>