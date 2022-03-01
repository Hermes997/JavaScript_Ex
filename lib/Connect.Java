class Connect {

    public Connect() {
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
    }


}