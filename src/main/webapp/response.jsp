<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab #9</title>
</head>
<body>
<h2>Lab #9: Repeating Lab #5-3 via JSP</h2>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "hr";
	String pass = "hr";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
%>

<%
	request.setCharacterEncoding("UTF-8");
	String Find_URL_Q1 = request.getParameter("Find_URL_Q1");
	String Find_Transaction_start_date_Q2 = request.getParameter("Find_Transaction_start_date_Q2");
	String Find_Transaction_end_date_Q2 = request.getParameter("Find_Transaction_end_date_Q2");
	String Find_Transaction_user_id_Q2 = request.getParameter("Find_Transaction_user_id_Q2");
	String Find_User_amount_Q3 = request.getParameter("Find_User_amount_Q3");
	String Find_high_fluctuation_start_date_Q4 = request.getParameter("Find_high_fluctuation_start_date_Q4");
	String Find_high_fluctuation_rate_Q4 = request.getParameter("Find_high_fluctuation_rate_Q4");
	
	String query;
	ResultSetMetaData rsmd;
	int cnt;
%>

<h4>--- Q1 Result ---</h4>

<%	
	if(Find_URL_Q1 != ""){
	query = 
	"SELECT N.Nurl, N.Ncompany\n"
	+ "FROM NEWS N\n"
	+ "WHERE N.Ncompany LIKE " + "\'%" + Find_URL_Q1 + "%\'" + "\n";
	
	System.out.println(query + "\n");
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	for(int i=1;i <=cnt; i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}

		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
	}
%>

<h4>--- Q2 Result ---</h4>

<%
	if(Find_Transaction_start_date_Q2 != "" || Find_Transaction_end_date_Q2 != ""
			|| Find_Transaction_user_id_Q2 != ""){
		query =
		"SELECT U.User_id, T.Twhen, T.Tname, T.Type, T.Tvolume\n"
		+ "FROM USERS U, HISTORY H, TRANSACTION_LIST T\n"
		+ "WHERE U.Unum = H.Hunum\n"
			+ "AND H.Htnum = T.Tnum\n"
			+ "AND T.Twhen >= " + "\'" + Find_Transaction_start_date_Q2 + "\'" + "\n"
			+ "AND T.Twhen < " + "\'" + Find_Transaction_end_date_Q2 + "\'" + "\n"
			+ "AND U.User_id = " + "\'" + Find_Transaction_user_id_Q2 + "\'" + "\n";
		System.out.println(query + "\n");
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
	
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i=1;i <=cnt; i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
	}
%>

<h4>--- Q3 Result ---</h4>

<%
	if(Find_User_amount_Q3 != ""){
		query =
		"SELECT DISTINCT Sname, U.Unum, I.Quantity\n"
		+ "FROM USERS U, INTEREST I, STOCK S\n"
		+ "WHERE U.Unum = I.In_unum\n"
			+ "AND I.In_Scode = S.Scode\n"
			+ "AND U.Unum = " + Find_User_amount_Q3 + "\n";
		System.out.println(query + "\n");
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
	
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i=1;i <=cnt; i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
	}
%>

<h4>--- Q4 Result ---</h4>

<%
	if(Find_high_fluctuation_start_date_Q4 != "" || Find_high_fluctuation_rate_Q4 != ""){
		query =
		"SELECT DISTINCT S.Sname\n"
		+ "FROM STOCK S, CHART C\n"
		+ "WHERE S.Scode = C.Ccode\n"
		+ "AND S.Scode IN (SELECT S.Scode\n"
			+ "				FROM STOCK S, CHART C\n"
			+ "				WHERE S.Scode = C.Ccode\n"
			+ "					AND C.Cstart_date >= " + "\'" + Find_high_fluctuation_start_date_Q4 + "\'" + "\n"
			+ "					AND (C.Cstart_price / C.Cclose_price) > " + Find_high_fluctuation_rate_Q4 + ")\n";
		System.out.println(query + "\n");
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
	
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i=1;i <=cnt; i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
	}
%>


<%
	conn.close();
%>
</body>

</html>