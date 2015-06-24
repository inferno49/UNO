<!DOCTYPE html>
<html>

    <%
    
  

       out.print("<frameset rows='100%'>");
   
        String s = request.getParameter("button");
        String v = request.getParameter("gameid");
        if(request.getParameter("gameid")==null)
        out.print("<frame src=game.jsp?button="+s+"&relaodcount=" +null+">");
        else
        out.print("<frame src=game.jsp?button="+s+"&gameid="+v+"&relaodcount=" +null+">");
       
      
        out.print("</frameset>");
    %>
 

</html>