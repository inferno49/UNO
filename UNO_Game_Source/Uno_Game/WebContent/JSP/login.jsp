
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
      <%@ page import ="java.sql.*" %>
      <%@ page import="javax.crypto.SecretKeyFactory"%>
    <%@ page import="javax.crypto.spec.PBEKeySpec"%>
    <%@ page import="java.math.BigInteger"%>
    
    <%
    System.out.println(""+request.getParameter("emailid"));
    
    
   
    String email = request.getParameter("emailid");
    String pwd = request.getParameter("pwd");

   
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
    PreparedStatement  st =null;
    ResultSet rs =null;
    
    try
    {
    st = con.prepareStatement("SELECT Id, pwd, salt, LoggedIn, nname FROM userslist where emailid = ? ");
    st.setString(1, email);	
    rs = st.executeQuery();
    // get the number of rows from the result set
   if(!rs.next())
	out.print("<h1> Invalid username or password"+"<a href='../HTML/login.html'>Go to Login</a> </h1>"); 
  else
  {
   int rowCount = rs.getInt(1);
        
    if(rowCount>0)
    {
    	final int ITERATIONS = 1000;
        final int KEY_LENGTH = 192; // bits
          
        char[] passwordChars = pwd.toCharArray();
        byte[] saltBytes = rs.getString(3).getBytes();
        
        PBEKeySpec spec = new PBEKeySpec(
        	       passwordChars,
        	       saltBytes,
        	       ITERATIONS,
        	       KEY_LENGTH
        	   );
        	   SecretKeyFactory key;
        	   
  key = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
  byte[] hashedPassword = key.generateSecret(spec).getEncoded();
  String password = String.format("%x", new BigInteger(hashedPassword));
  
  
  
  if(password.equals(rs.getString(2)))
		  {
	  if(!rs.getBoolean(4))
	  {
		st = con.prepareStatement("UPDATE userslist SET LoggedIn = true where emailid = ?");
        st.setString(1, email);
        st.executeUpdate();
	    session.setAttribute("userid", rowCount);
	    session.setAttribute("userName",rs.getString(5));
	    response.sendRedirect("Welcome/welcometouno.jsp");
	  }
	    
	   
	  else
	  {
		  out.print("<h2><b><i> You are already logged in. <br> </br> plaease logout from the old one and login</h2></b></i>"+"<a href='../HTML/login.html'>Home Page</a> "); 
	  
	  }
	  }
  else
      out.print("<h1> Invalid username or password"+"<a href='../HTML/login.html'>Go to Login</a> </h1>"); 

		  }
    else
        out.print("<h1> Invalid username or password"+"<a href='../HTML/login.html'>Go to Login</a> </h1>"); 
   
  }
    }
  
    catch(NullPointerException e)
    {
    	
    }
    finally
    { 
        try
        { 
            if (con != null) 
                con.close (); 
            if (rs != null) 
                rs.close (); 
       
        } 
        catch (SQLException se) 
        { 
            out.println("SQL Exception"); 
        } 
    }

   
   %> 
</html>
