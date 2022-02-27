package JavaClass;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;


public class UserDAO { 
  private String userID; 
  private String userPassword; 
  private String userNickname; 
  private String userDate; 

  private Connection con; 
  private ResultSet rs; 

  public UserDAO() { 
    try { 
      String dbURL = "jdbc:mysql://192.168.0.29:3306/mysql"; 
      String dbID = "root"; 
      String dbPassword = "hermes7734"; 
      Class.forName("com.mysql.jdbc.Driver"); 
      con = DriverManager.getConnection(dbURL, dbID, dbPassword); 
      } catch (Exception e) { 
        e.printStackTrace();
        }
  }

  public int login(String userID, String userPassword) { 
    try { 
      PreparedStatement pst = con.prepareStatement("SELECT userPassword FROM user WHERE userID = ?"); 
      pst.setString(1, userID); 
      rs = pst.executeQuery(); 
      if (rs.next()) { 
        return rs.getString(1).equals(userPassword) ? 1 : 0; 
      } else { 
          return -2;
        }
        } catch (Exception e) { 
              e.printStackTrace(); return -1; 
          } 
  }

  public boolean ID_Check(String userID) { 
    try { 
      PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE userID = ?"); 
      pst.setString(1, userID); 
      rs = pst.executeQuery(); 
      if (rs.next()) { 
        return false; 
      } else { 
          return true; 
        } 
      } catch (Exception e) { 
            e.printStackTrace(); 
        } return false; 
  }

  public int join(UserDAO userDAO) {
    if(!ID_Check(userDAO.getUserID())) return 0;
    try { PreparedStatement pst = con.prepareStatement("INSERT INTO user VALUES (?,?,?,?)");
    pst.setString(1, userDAO.getUserID());
    pst.setString(2, userDAO.getUserPassword());
    pst.setString(3, userDAO.getUserNickname());
    pst.setString(4, userDAO.getUserDate());
    return pst.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace(); return -1;
      }
      }
      
  public UserDAO getUser(String userID) {
    try {
      PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
      pst.setString(1, userID); rs = pst.executeQuery();
      if (rs.next()) { UserDAO userDAO = new UserDAO();
      userDAO.setUserID(rs.getString(1)); userDAO.setUserPassword(rs.getString(2));
      userDAO.setUsername(rs.getString(3)); userDAO.setUserDate(rs.getString(4));
      return userDAO;
      }
    } catch (Exception e) {
      e.printStackTrace();
      } return null;
  }

  public String getUserID() {
    return userID;
  }

  public void setUserID(String userID) {
    this.userID = userID;
  }

  public String getUserPassword() {
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }

  public String getUserNickname() {
    return userNickname;
  }

  public void setUserName(String userNickname) {
    this.userNickname = userNickname;
  }

  public String getUserDate() {
    return userDate;
  }

  public void setUserDate(String userDate) {
    this.userDate = userDate;
  }
}



