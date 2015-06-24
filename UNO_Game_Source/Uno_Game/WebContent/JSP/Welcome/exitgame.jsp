<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<title>Exit Game</title>
<style>
#body{
 background-image: url("../../images/un5.jpg");	
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
</head>
<body id ="body">

    <%@ page import ="java.sql.*" %>
      <%@ page import="javax.crypto.SecretKeyFactory"%>
    <%@ page import="javax.crypto.spec.PBEKeySpec"%>
   
     <div id="header">
<h1>UNO 3.0 </h1>
<i>The best UNO game around!!</i> 
</div>

<div id="nav">
<ul>
  <li><a href="login.html">Home</a></li> 
  <li><a href="register.html">Register</a></li>
  <li><a href="rules.html">How to play</a></li>
</ul>
</div>
    
     <div id="section"> 
     You have successfully logged out!!
    Click below to go back to the home page
     	  <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  aria-valuemin="0" aria-valuemax="100" style="width:100%">
    100% Complete (Logged Out)
  </div>
</div>
    
     <form action="../../HTML/login.html" method="post"> 
    <input name ="exit" type="submit" value="Home">
    </form>    
      
    <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
    PreparedStatement  st =null;
    ResultSet rs =null;

   
    
  String email1 = request.getParameter("emailid");
    	st=con.prepareStatement("update userslist set LoggedIn = 0 where emailid =?" );
    			  st.setString(1,email1);
    	int rows= st.executeUpdate();

    	
    	  %>
   

    	  </div>
    	  
    	
   <div id="footer">
<br></br>
<i>Happy Gaming</i>
</div>
    	

</body>
</html>