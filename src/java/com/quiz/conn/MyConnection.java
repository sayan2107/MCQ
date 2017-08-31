package com.quiz.conn;


import java.sql.Connection;
import java.sql.DriverManager;


//connect db
public class MyConnection {
    public Connection GetConn() throws Exception{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "j2ee", "10314036");
        return conn;
    }
}
