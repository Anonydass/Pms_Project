/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pms;

/**
 *
 * @author GAVASKAR S
 */
import java.sql.*;
public class dbclass 
{
public String connection_string="jdbc:mysql://localhost:3306/pms?zeroDateTimeBehavior=CONVERT_TO_NULL";
public String tableinsertupdatedelete(String query)
{
    try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(connection_string, "root", "");
            Statement st=conn.createStatement();
            int i=st.executeUpdate(query);
            return String.valueOf(i);
        }
        catch(Exception e)
        {
             return e.getMessage();
        }
}
public ResultSet getfromtable(String query)
{
    ResultSet resultSet = null;
        try
            {
                Connection connection = null;
                Statement statement = null;
                connection = DriverManager.getConnection(connection_string, "root", "");
                statement=connection.createStatement();
                resultSet = statement.executeQuery(query);
                return resultSet;
            }
        catch (Exception e) 
            {
                return resultSet;
            }
}
}
