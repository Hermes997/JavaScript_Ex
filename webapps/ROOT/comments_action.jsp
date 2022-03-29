<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
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

    long miliseconds = System.currentTimeMillis();
    SimpleDateFormat dformat1 = new SimpleDateFormat("yyyyMMdd");
    SimpleDateFormat dformat2 = new SimpleDateFormat("HHmmss");
    java.sql.Date now = new java.sql.Date(miliseconds);
    String strDate1 = dformat1.format(now);
    String strDate2 = dformat2.format(now);
    String strDate3 = strDate1 + strDate2;

    String userID = (String) session.getAttribute("userID");
    String userPassword = (String) session.getAttribute("userPassword");
    String userNickname = (String) session.getAttribute("userNickname");
    String userDate = (String) session.getAttribute("userDate");
    String postID = (String) session.getAttribute("postID");

    String contents = new String(request.getParameter("commentContents").getBytes("ISO-8859-1"), "UTF-8");

    PrintWriter script = response.getWriter();
    String sql = null;

    sql = "INSERT INTO comments(postID, userID, contents, userNickname, uploadDate) VALUES (?,?,?,?,?)";

    //try{
        pst = con.prepareStatement(sql);
        pst.setString(1, postID);
        pst.setString(2, userID);
        pst.setString(3, contents);
        pst.setString(4, userNickname);
        pst.setString(5, strDate3);
        pst.executeUpdate();

        script.println("<script>");
        script.println("alert('posting comment complete.')");
        String location = "location.href = 'view?postID=" + postID + "'";
        script.println(location);
        script.println("</script>");

        if(pst != null) try { pst.close(); } catch(SQLException ex) {}
        if(con != null) try { con.close(); } catch(SQLException ex) {}
    /*} catch (Exception e) {
        script.println("<script>");
        script.println("alert('파일처리간 문제 발생.')");
        script.println("history.back()");
        script.println("</script>");
    }*/

%>



</body>
</html>