<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.concurrent.Executors"%>
<%@page import="javax.xml.ws.spi.http.HttpExchange"%>
<%@page import="com.sun.net.httpserver.HttpHandler"%>
<%@page import="com.sun.net.httpserver.HttpServer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <title>JSP Page</title>
           <style>
#body{
 background-image: url("../../images/bg.jpg");	
background-repeat: x-repeat;
 
}
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
line-height:100px;
    background-color:#eeeeee;
    height:500px;
    color:#E32561;
    width:150px;
    float:left;
    padding:5px;	      
}
#section {
    width:500px;
    float:left;
    padding:10px;	 	 
}
#footer {
     background-color:black;
     color:white;
     clear:both;
     text-align:center;
     padding:3px;	 	
     position:fixed;
     bottom:0;
    width:100%;
     bottom:0;
     width:100%;
     height:60px;  
  	 
}
</style>

            <script type="text/JavaScript">

function timedRefresh(timeoutPeriod) {
   
	setTimeout("location.reload(true);",timeoutPeriod);
}



</script>
    </head>
    <body onload="JavaScript:timedRefresh(2900);" id=body>
   <h3><i><u>Top Card is:</u></i></h3> <span class="glyphicon glyphicon-stop"></span>
    <% 
    
     out.print (session.getAttribute("gettop"));
     out.print("<br></br>");
     if((session.getAttribute("message")!=null))
     out.print (session.getAttribute("message"));
     if((session.getAttribute("UnoCalled")!=null))
         out.print (session.getAttribute("UnoCalled"));
    %>
     

</body>
</html>