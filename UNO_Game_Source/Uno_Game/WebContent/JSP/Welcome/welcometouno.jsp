<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>UNO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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

</style>
</head>


  
  <body id="body">

<div id="header">
<h1>UNO 3.0 </h1>
<i>The best Uno game around!!</i>
</div>
  
    <% 
    //out.print("<h1>Welcome " + request.getAttribute("username"));
    session.setAttribute("reload",null);
    session.setAttribute("reloadcount",null);
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
  PreparedStatement  st =null;
  ResultSet rs =null;
  out.println("<h2> Existing Games To Join</h2>");
  out.println("<br></br>");
  ResultSet rs1;
  st= con.prepareStatement("SELECT PrimaryPlayerId, SecondId, ThirdId, FourthId FROM gamerooms where GameStatus='Waiting'");
  rs = st.executeQuery();
  rs.last();
  int k = rs.getRow();
  int games[][] = new int [k][4];
  rs.first();
    int i=0;
  while (i<k)
 {
     games[i][0]=rs.getInt(1);
     games[i][1]=rs.getInt(2);
     games[i][2]=rs.getInt(3);
     games[i][3]=rs.getInt(4);
     i++;
     rs.next();
 }
  rs.close();
  int j=0;

  while(j<i)
  {
//rs.close();
     int l=0;
      out.println("<tr>");
      out.println("<td>");
      st=con.prepareStatement("select nname from userslist where Id=?");
      st.setInt(1, games[j][0]);
      rs1= st.executeQuery();
      rs1.next();
      out.println("Game hosted by : "+rs1.getString(1));
      l++;
      out.println("<br></br>");
      rs1.close();
      if(games[j][1]!=0)
      {
      st=con.prepareStatement("select nname from userslist where Id=?");
      st.setInt(1, games[j][1]);
      rs1= st.executeQuery();
      rs1.next();
      out.println("Game member : "+rs1.getString(1));
      out.println("<br></br>");
      l++;
      rs1.close();
      }    
      if(games[j][2]!=0)
      {
      st=con.prepareStatement("select nname from userslist where Id=?");
      st.setInt(1, games[j][2]);
      rs1= st.executeQuery();
      rs1.next();
      out.println("Game member : "+rs1.getString(1));
      out.println("<br></br>");
      l++;
      
      rs1.close();
      }
      if(games[j][3]!=0)
      {
      st=con.prepareStatement("select nname from userslist where Id=?");
      st.setInt(1, games[j][3]);
      rs1= st.executeQuery();
      rs1.next();
      out.println("Game member : "+rs1.getString(1));
      out.println("<br></br>");
      l++;
      rs1.close();
      }
      out.println("Current number of players: "+l);
  
     out.println("</td>");
     out.println("<td>");
     if(l<4)
    	    out.println("<form action=gameplay.jsp method=post> <input type=hidden name=gameid value="+games[j][0]+">  <input name =button type=submit value=JOIN> </input></form>");
    	       out.println("</td>");
    	     out.println("</tr>");
    	    j++;
    	    }
 
    	  

  
    	  
  %>
 
  <p>Click below to start a new game</p>
    <form action="gameplay.jsp" method="post"> 
    <input name ="button" type="submit" value="NEW"></input>
    </form>
    <form action="statistics.jsp" method="post">  
<i>Click below for previous game statistics</i>  
<input type="submit"  name ="sts"value="Stats"/>
  </form>
   &nbsp;&nbsp;   
  
  <form action="exitgame.jsp" method="post">  
<i>Click here to leave the game</i>  
<input type="submit"  name ="exit"value="Exit"/>
  </form>
  
  <div id="footer">
<i>Happy Gaming</i>
</div>
</body>
   
   
  
    
 

</html>
