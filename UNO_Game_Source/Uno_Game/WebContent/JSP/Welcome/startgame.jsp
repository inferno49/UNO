<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="uno.Game"%>
<%@page import="uno.Card"%>
<%@page import="uno.Player"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>UNO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script>
function validateForm() {

	
	var result= null;
	   var index = document.forms["indexform"]["index"].value;
	
	 
	   var indexpattern =/^[0-9]*$/;
	   
	   if (index==null || index=="") {
	        alert("Sorry, Index value cannot be empty. Please type a value.");
	        return false;
	    }
	    else
	    {
	    result = index.match(indexpattern); 
	
	     if (result==null) {
	        alert("Index should only have only digits, Please re enter the value");
	        return false;
	    }}
	
}

</script>
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
 
  
  <%!
  Game tc = new Game();
  ArrayList<Card> sl = new ArrayList<Card>();
  
 
  %>
  <%

  out.print("<h1>Player name : " + session.getAttribute("userName").toString());
  if((request.getParameter("flag") ==null)||((!request.getParameter("flag").equals("0"))&&(!request.getParameter("flag").equals("1"))&&(!request.getParameter("flag").equals("2"))))
  {
	
	  if((request.getParameter("status") ==null))
	  {
       sl = tc.SeeCards();
	  }
	  if((request.getParameter("status") !=null)&&(request.getParameter("status").equals("2")))
	  {
	   if(sl.size()==1)
	   {
		   session.setAttribute("UnoCalled", session.getAttribute("userName").toString() + "has called uno");
	   }
	   else
	   {
		  out.print("You have more than one card. UNO can not be called at this time");
	   }
	   }
	  
	  
	 
	  int i = 0;
	  out.println("<h2>Your Cards</h2>");
	  out.print("<table border=1>");
	 
	  for(Card card: sl){
		  
		  out.print("<tr>");
		  out.print("<td>");
		    out.print(i + " ");
		    out.print("</td>");
		    out.print("<td>");
			out.println(card.printCard());
		    i++;
		    out.print("</td>");
			  out.print("</tr>");
		
		}

	 
	  out.print("</table>"); 
	 
	  if(session.getAttribute("gettop")==null)
	  {
		  Card topcard;
		  topcard = tc.gettop();
		 session.setAttribute("gettop",topcard.printCard()); 
		 
       } 
	  out.print("<br></br>"); 
	  out.print("<form action=startgame.jsp?flag=0&status=3 method=post> <input name =button type=submit value=Draw a Card></input> </form> <br></br>  <form action=startgame.jsp?flag=1 method=post> <input name =button type=submit value=Play a Card></input> </form>");
	  
	  
	  
	   
	
  }
  else if (request.getParameter("flag").equals("0"))  // draw a card
  { 
	  int i = 0;
	  sl = tc.AddCard(sl);
	  out.println("<h1>Your Cards</h1>");
	  out.print("<table border=1>");
	 
	  for(Card card: sl){
		  
		  out.print("<tr>");
		  out.print("<td>");
		    out.print(i + " ");
		    out.print("</td>");
		    out.print("<td>");
			out.println(card.printCard());
		    i++;
		    out.print("</td>");
			  out.print("</tr>");
		
		}

	 
	  out.print("</table>"); 
	  response.addHeader("Refresh","10;https://localhost:8443/Uno_Game/JSP/Welcome/startgame.jsp?flag=3&status=1");
	  
  }
  else if (request.getParameter("flag").equals("1"))  // get index and play a card
  {
	  int i = 0;
	  
	  out.println("<h1>Your Cards</h1>");
	  out.print("<table border=1>");
	 
	  for(Card card: sl){
		  
		  out.print("<tr>");
		  out.print("<td>");
		    out.print(i + " ");
		    out.print("</td>");
		    out.print("<td>");
			out.println(card.printCard());
		    i++;
		    out.print("</td>");
			  out.print("</tr>");
		
		}
	  
	  out.print("</table>"); 
	  out.print("<br></br>"); 
		 
	  out.println("<form name ='indexform' action=startgame.jsp?flag=2&status=3 onsubmit='return validateForm()' method= post > <label> Enter Index of the card you want to play</label> <input name=index type=text id=index maxlength=25 > </input> <input type=submit value=Play></input></form>");
	 
	  
	  
  }
  
  else if (request.getParameter("flag").equals("2"))  // Play a card 
  {
	  int i = 0;
	  int j = Integer.parseInt(request.getParameter("index"));
	  if(j< sl.size())
	  {
	
		Card select = sl.remove(j);
		 String top = session.getAttribute("gettop").toString();
		 if(!top.contains(select.getColor().toString()) && (!top.contains(Integer.toString(select.getNumber()))))
		 {
			 session.setAttribute("message","Not a valid card");
			 sl.add(j,select);
			  response.addHeader("Refresh","4;https://localhost:8443/Uno_Game/JSP/Welcome/startgame.jsp?flag=3&status=1");
		 }
		 else
		 {
		 session.setAttribute("gettop",select.printCard());		 
		 session.setAttribute("message","");
		 
		 }
	  }
		  else
		  {
			  out.print("Not a valid Index to play");
			  response.addHeader("Refresh","4;https://localhost:8443/Uno_Game/JSP/Welcome/startgame.jsp?flag=3&status=1");
		  }
		  out.println("<h1>Your Cards</h1>");
		  out.print("<table border=1>");
		 
		  for(Card card: sl){
			  
			  out.print("<tr>");
			  out.print("<td>");
			    out.print(i + " ");
			    out.print("</td>");
			    out.print("<td>");
				out.println(card.printCard());
			    i++;
			    out.print("</td>");
				  out.print("</tr>");
			
			}
		  
		  out.print("</table>"); 
		  out.print("<br></br>");
		  response.addHeader("Refresh","10;https://localhost:8443/Uno_Game/JSP/Welcome/startgame.jsp?flag=3&status=1");
	
  }
	
	    
  
  %>

  
     
 <br></br>
  <form action="startgame.jsp?status=2" method="post">  
<input type="submit"  name ="calluno" value="Call UNO"/>
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
</body>

</html>
