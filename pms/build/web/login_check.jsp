<%-- 
    Document   : login_check
    Created on : 08-Dec-2022, 1:27:52 pm
    Author     : GAVASKAR S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@page import="java.sql.*,java.util.*"%>
<%@page import="pms.dbclass"%>
       <%
           Class.forName("com.mysql.jdbc.Driver");
           dbclass login_check=new dbclass();
            ResultSet resultSet; 
            String sql="select * from usersetting where email='"+ request.getParameter("email") + "' and password='"+ request.getParameter("password") +"'";
                Connection connection = null;
                Statement statement = null;
                connection = DriverManager.getConnection(login_check.connection_string, "root", "");
                statement=connection.createStatement();
                resultSet = statement.executeQuery(sql);
        int sno=0;
        while(resultSet.next())
        {
              sno=sno+1;
        }
        out.println(sno);
        if(sno>0)
        {
        out.println("<script type = 'text/javascript'>");
        out.println("window.location = 'dashboard.jsp'");
        out.println("</script>");
         }
         else
         {
         out.println("<script type = 'text/javascript'>");
        out.println("window.alert('Login Credentialss provided is invalied')");
        out.println("window.location = 'index.jsp'");
        out.println("</script>");
       }
           %>
    </body>
</html>

