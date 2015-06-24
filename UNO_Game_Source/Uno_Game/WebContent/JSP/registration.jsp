<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
    </body>
    
  
    <%@ page import="java.util.Random"%>
    <%@ page import="java.security.SecureRandom"%>
    <%@ page import="javax.crypto.SecretKeyFactory"%>
    <%@ page import="javax.crypto.spec.PBEKeySpec"%>
    <%@ page import="java.math.BigInteger"%>
    
<%



    String name = request.getParameter("yourname");   
    String email = request.getParameter("emailid");
    String aliasname = request.getParameter("nname");
    String pnumber = request.getParameter("phoneno");
    String pwd = request.getParameter("pwd");
    String saltofpwd="";
   
    final int ITERATIONS = 1000;
    final int KEY_LENGTH = 192; // bits
    
    final Random r = new SecureRandom();
	 
    byte[] salt = new byte[32];
	
    r.nextBytes(salt);
    
    saltofpwd = String.format("%x", new BigInteger(salt));
    
    
    char[] passwordChars = pwd.toCharArray();

    PBEKeySpec spec = new PBEKeySpec(
    	       passwordChars,
    	       saltofpwd.getBytes(),
    	       ITERATIONS,
    	       KEY_LENGTH
    	   );
    SecretKeyFactory key;
    
    key = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
    byte[] hashedPassword = key.generateSecret(spec).getEncoded();
    
    pwd =  String.format("%x", new BigInteger(hashedPassword));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
    PreparedStatement  st =null;
    ResultSet rs =null;
    
    try
    {
    
    if(email!=null)
    {
    st =  con.prepareStatement("SELECT COUNT(*) FROM userslist where emailid = ? ");
    st.setString(1, email);
    rs = st.executeQuery();
    }
    rs.next();
    int rowCount = rs.getInt(1);
    
    if(rowCount>0)
    {
            out.print("Registration UnSuccessfull..!! Mailid existing. "+"<a href='../HTML/register.html'>Go to Registration</a>");  
    }
    else
    {
    	  st =  con.prepareStatement("insert into userslist(Name, EmailId, NName, PhoneNo, pwd, salt, LoggedIn) values (? ,? ,? ,? ,? ,? ,?)");
    	  	st.setString(1, name);
    	  	st.setString(2, email);
    	  	st.setString(3, aliasname);
    	  	st.setString(4, pnumber);
    		st.setString(5, pwd);
    		st.setString(6, saltofpwd);
    		st.setBoolean(7, false);
      	  	
         int i = st.executeUpdate();
    rs = st.executeQuery("Select max(Id) from userslist");
    rs.next();
    if(i>0)
    {
     i= st.executeUpdate("insert into winstats values ("+ rs.getInt(1)+", 0 , 0)");
    if (i > 0) {
      out.print("Registration Successfull!"+"<a href='../HTML/login.html'>Go to Login</a>");    
    }
    else{
        out.print("Registration Failed !"+"<a href='../HTML/register.html'>Go to Registration</a>");  
    }
   }
   else{
      out.print("Registration Failed!"+"<a href='../HTML/register.html'>Go to Registration</a>");  
    }
    }
    }
    catch( SQLException e ) 
    { 
        out.println( "SQL exception" + e.getLocalizedMessage()); 
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
