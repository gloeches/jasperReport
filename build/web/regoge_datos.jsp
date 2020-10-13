<%-- 
    Document   : regoge_datos
    Created on : Aug 25, 2020, 11:29:56 PM
    Author     : gloeches
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
            border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
              
            String nombre=request.getParameter("nombre");
            java.sql.ResultSet rs=null;
            String s;
            // We register the PostgreSQL driver
            // Registramos el driver de PostgresSQL
            try { 
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
               out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            String url = "jdbc:postgresql://localhost:5432/jasper";
            java.sql.Connection miconexion=java.sql.DriverManager.getConnection(url,"postgres","1407vladi");
            boolean valid = miconexion.isValid(50000);
            out.println(valid ? "TEST OK" : "TEST FAIL");
            java.sql.Statement myStatement=miconexion.createStatement();
            String instruccionSql="select * from address;";
            rs=myStatement.executeQuery(instruccionSql);
            out.println("Rows are :" + "<br>");
        %>
            <table style="width:100%">
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th> 
                    <th>Age</th>
                </tr>
            
        <%
			while(rs.next())
			{
                out.println("<tr>");
				s = rs.getString(2);
                out.println("<td>" + s +"</td>");
                s = rs.getString(3);
                out.println("<td>" + s +"</td>");
                s = rs.getString(4);
                out.println("<td>" + s +"</td>");
  				out.println("</tr>");
			}
            out.println("</table>");
		//	System.out.println(mn.gname());
            out.println("<br> finalizado </br>");
         %>
        
    </body>
</html>
