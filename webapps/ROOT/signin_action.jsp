<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<html>
<head>
<title>Envir_Astro</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: rgb(213,220,255);">
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
    String sql = "SELECT * FROM address WHERE userID = ?";
    String userNickname = null;
    String userDate = null;
    int result = -2;

    try {
        pst = con.prepareStatement(sql);
        pst.setString(1, userID);
        rs = pst.executeQuery();
        out.println("sql clear");

        if(rs.next()){
            if(rs.getString(2).equals(userPassword) ? true : false) {
                result = 1;
                userNickname = rs.getString(3);
                userDate = rs.getString(4);
            } else {
                result = 0;
            }
        } else {
            result = -1;
        }

    } catch (Exception e) {
        e.printStackTrace();
        result = -2;
    } finally {
        if(pst != null) try { pst.close(); out.println("pst close clear");} catch(SQLException ex) {}
        if(con != null) try { con.close(); out.println("con close clear");} catch(SQLException ex) {}

        PrintWriter script = response.getWriter();

        switch(result) {
            case -2 :
                script.println("<script>");
                script.println("alert('알수없는 오류.')");
                script.println("history.back()");
                script.println("</script>");
                break;

            case -1 :
                script.println("<script>");
                script.println("alert('해당 아이디는 없는 아이디입니다..')");
                script.println("history.back()'");
                script.println("</script>");
                break;
            
            case 0 :
                script.println("<script>");
                script.println("alert('비밀번호가 일치하지 않습니다.')");
                script.println("history.back()");
                script.println("</script>");
                break;

             case 1 :

                session.setAttribute("userID", userID);
                session.setAttribute("userPassword", userPassword);
                session.setAttribute("userNickname", userNickname);
                session.setAttribute("userDate", userDate);
                script.println("<script>");
                script.println("alert('로그인 성공.')");
                script.println("location.href = 'home.jsp'");
                script.println("</script>");
                break;               
        }
    }

%>

</body>
</html>