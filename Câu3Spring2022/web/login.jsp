<%-- 
    Document   : login
    Created on : Nov 5, 2022, 8:40:49 PM
    Author     : MSI LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="login">
            Username: <input type="text" name="name"><br><!-- comment -->
            Password: <input type="password" name="pw"><br><!-- comment -->
            <input type="submit" value="Login">          
        </form>
        <h2>${requestScope.message}</h2>
    </body>
</html>
