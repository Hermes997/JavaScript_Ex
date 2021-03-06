<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<%@ page import="DataJava.DBconnect" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<html>
<head>
<title>Envir_Astro</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">
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
        result = -2;
        e.printStackTrace();
    } finally {
        if(pst != null) try { pst.close(); out.println("pst close clear");} catch(SQLException ex) {}
        if(con != null) try { con.close(); out.println("con close clear");} catch(SQLException ex) {}

        PrintWriter script = response.getWriter();

        switch(result) {
            case -2 :
                script.println("<script>");
                script.println("alert('server error')");
                script.println("history.back()");
                script.println("</script>");
                break;

            case -1 :
                script.println("<script>");
                script.println("alert('this ID is not exist')");
                script.println("history.back()");
                script.println("</script>");
                break;
            
            case 0 :
                script.println("<script>");
                script.println("alert('do not match between ID and password')");
                script.println("history.back()");
                script.println("</script>");
                break;

             case 1 :

                session.setAttribute("userID", userID);
                session.setAttribute("userPassword", userPassword);
                session.setAttribute("userNickname", userNickname);
                session.setAttribute("userDate", userDate);
                script.println("<script>");
                script.println("alert('signin complete.')");
                script.println("location.href = 'main'");
                script.println("</script>");
                break;               
        }
    }

%>

</body>
</html>