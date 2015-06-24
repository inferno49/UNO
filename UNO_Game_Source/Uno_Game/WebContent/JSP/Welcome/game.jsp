

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
        <title>JSP Page</title>
            <script type="text/JavaScript">
            function timedRefresh(timeoutPeriod) {
            	   
            	setTimeout("location.reload(true);",timeoutPeriod);
            }
</script>
<style>
#body{
 background-image: url("../../images/un5.jpg");	
background-repeat: no-repeat;
 
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
    
    
    <body onload="JavaScript:timedRefresh(2900);" id="body">
       
<div id="header">
<h1>UNO 3.0 </h1>
<i>The best Uno game around!!</i>
</div>

<div id="footer">
<i>Happy Gaming</i>
</div>
          <%
    Class.forName("com.mysql.jdbc.Driver");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uno","UNODBUSER","sunITHA%1990");
      PreparedStatement st ;
      ResultSet rs = null;

      
    
      String s = request.getParameter("button");
      if((request.getParameter("button").equals("NEW"))&& (session.getAttribute("reloadcount")==null))
      {

    st = con.prepareStatement("insert into gamerooms (PrimaryPlayerId, SecondId, ThirdId, FourthId, GameStatus, GameMoves) values (? ,0,0,0,'Waiting','' )");
    st.setInt(1, Integer.parseInt(""+session.getAttribute("userid")));
	int i = st.executeUpdate();

	   session.setAttribute("gameid", session.getAttribute("userid"));
	   session.setAttribute("reloadcount",1);
	  //session.setAttribute("reload",null);
	
	  
   
     }
      else if(request.getParameter("button").equals("JOIN") && (session.getAttribute("reload")==null))
      {
          session.setAttribute("gameid", Integer.parseInt(request.getParameter("gameid")));
          
          st = con.prepareStatement("SELECT SecondId, ThirdId, FourthId FROM gamerooms where GameStatus = 'Waiting' and PrimaryPlayerId = ?");
          st.setInt(1, Integer.parseInt(""+session.getAttribute("gameid")));
          rs = st.executeQuery();

          rs.next();
          
          
          if(rs.getInt(1)==0)
          {
         	st = con.prepareStatement("UPDATE gamerooms SET SecondId = ?,GameStatus = 'Ready'  where PrimaryPlayerId = ? ");
             st.setInt(1, Integer.parseInt(""+session.getAttribute("userid")));
             st.setInt(2, Integer.parseInt(""+session.getAttribute("gameid")));
             st.executeUpdate();
          }
          else if(rs.getInt(2)==0)
          {
         	st = con.prepareStatement("UPDATE gamerooms SET ThirdId = ? PrimaryPlayerId = ?");
             st.setInt(1, Integer.parseInt(""+session.getAttribute("userid")));
             st.setInt(2, Integer.parseInt(""+session.getAttribute("gameid")));
             st.executeUpdate();
          }   
          else if(rs.getInt(3)==0)
          {
         	st = con.prepareStatement("UPDATE gamerooms SET FourthId = ? where PrimaryPlayerId = ? ");
             st.setInt(1, Integer.parseInt(""+session.getAttribute("userid")));
             st.setInt(2, Integer.parseInt(""+session.getAttribute("gameid")));
             st.executeUpdate();
              
          }
       
            session.setAttribute("reload",1);
            
      } 
   
  st = con.prepareStatement("SELECT count(*) FROM gamerooms where PrimaryPlayerId = ? and GameStatus = 'Waiting' ");
 st.setInt(1, Integer.parseInt(""+session.getAttribute("gameid")));
 rs = st.executeQuery();
 
 rs.next();

   if(rs.getInt(1)==1)
   {
   out.println("<center>");
   out.println("<h1><i><font color='black'>Waiting for other players to join..!!</font></i> </h1>");
   out.println("</right>");
  
   }

   st = con.prepareStatement("SELECT count(*) FROM gamerooms where PrimaryPlayerId = ? and GameStatus = 'Ready' ");
   st.setInt(1, Integer.parseInt(""+session.getAttribute("gameid")));
   rs = st.executeQuery();
   
   rs.next();
   
   if(rs.getInt(1)==1)
   {
   rs.close();
  
   out.println("<center>");
   out.println("<h1> More than one players has joined the game. Game can be started . </h1>");
   out.println("<form action=game_response.jsp? method=post>  <input type=hidden name=checkload value=" +s +"><input name =button type=submit value=Click> </input></form>");
   }
     

 %>

      
 
    
    </body>
</html>
