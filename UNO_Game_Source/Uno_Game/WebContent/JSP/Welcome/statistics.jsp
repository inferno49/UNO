<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
<title>UNO-Statistics</title>
<style>
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
    width:150px;
    float:left;
    padding:5px;	      
}

#section {
    width:350px;
    float:right;
    padding:10px;	 
    
}
#footer {
     background-color:black;
     color:white;
     clear:both;
     text-align:center;
     padding:5p;
     position:fixed;
     bottom:0;
     width:100%;
     height:60px;  
  
}
#body{
 background-image: url("../../images/bg.jpg");	
background-repeat: no-repeat;
 
}
</style>
</head>
<body id = "body">

    <%@ page import ="java.sql.*" %>
      <%@ page import="javax.crypto.SecretKeyFactory"%>
    <%@ page import="javax.crypto.spec.PBEKeySpec"%>
    <%@ page import="java.math.BigInteger"%>
     <div id="header">
<h1>UNO 3.0 </h1>
<i>The best Uno game around!!</i>
</div>

<div id="nav">
<ul style="list-style: none;" >
  <li><a href="login.html" class="btn btn-sucess btn-md">
    <span class="glyphicon glyphicon-home"></span> Home</a></li>
 <li><p><p> <a href="register.html" class="btn btn-sucess btn-md">
  <span class="glyphicon glyphicon-log-in"></span>Register</a></p></p></li>
  
  
  <li>  <a href="rules.html" class="btn btn-sucess btn-md">
    <span class="glyphicon glyphicon-wrench"></span> How to play
  </a></li>
  
</ul>
</div>
    
     <div id="section"> 
     <table border="2" width="60%" height="100%">
  <tr><th><font color='Red'>Name</font></th><th><font color='Red'>Wins</font></th><th><font color='Red'>Loses</font></th></tr>
 

 
    <%
    
    
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
    PreparedStatement  st =null;
    ResultSet rs =null;

  out.println("Here are the game statistics so far");
    	st = con.prepareStatement("select name,wins, loses from userslist join winstats on userslist.Id =winstats.Id");
    	  rs=st.executeQuery();
    	  
    	  while(rs.next())
    	  {
    	      String Name =rs.getString("name");
    	      int Wins=rs.getInt("Wins");
    	      int Lose=rs.getInt("Loses");
    	  %>
    	<tr>
    	<td><b><font color='#663300'><%=Name%></font></b></td>
    	<td><b><font color='#663300'><%=Wins%></font></b></td>
    	<td><b><font color='#663300'><%=Lose%></font></b></td>
    	</tr>
    	<%
    	  

    	  }
    	
    	 %>
    	 </table>
    	
    	</div>
   
    <div id="footer">
Happy Gaming
</div>
  
 
        
    
    </body>
</html>