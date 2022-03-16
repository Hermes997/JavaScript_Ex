package DataJava;

import java.sql.*;
import java.io.*;

public class DBconnect {

    private Connection con = null; 

    public DBconnect() {
        try{ 
            String dbURL = "jdbc:mariadb://218.158.10.116:3306/mysql"; 
            String dbID = "cus"; 
            String dbPassword = "password"; 
        con = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch (Exception e){ 
            e.printStackTrace();
        }
    }

    public DBconnect(String URL, String ID, String Password) {
        try{ 
            con = DriverManager.getConnection(URL, ID, Password);
        }catch (Exception e){ 
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return this.con;
    }

    public void setConnection(String URL, String ID, String Password) {
        try{
            this.con = DriverManager.getConnection(URL, ID, Password);
        }catch(Exception e){
            e.printStackTrace();
        }
    }



}