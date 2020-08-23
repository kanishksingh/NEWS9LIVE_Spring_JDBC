package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtils {
    
	private static final String driverClass = "com.mysql.jdbc.Driver",
                            url="jdbc:mysql://localhost:3305/gitanjali?useUnicode=yes&characterEncoding=UTF-8",

			username = "root",
			password = "papaji";

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
        public static void closeConn(Connection c){
		try {
			if(c!=null)
				c.close();    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
	}//closeConn
          public static String getConnectionURL() {
		String con = "";
		try {
			
//			con = "http://103.133.215.181/NEWS9LIVE/";
			con = "http://localhost:8080/NEWS9LIVE_Spring_JDBC/";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
        public static void main(String[] args) {
            System.out.println(getConnection());
    }
}
