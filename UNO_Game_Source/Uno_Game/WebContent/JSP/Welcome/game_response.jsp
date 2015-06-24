<!DOCTYPE html>
<html>
    <%
    


    out.print("<frameset rows='80%, 20%'>");
      out.print(request.getParameter("checkload"));
      if(request.getParameter("checkload").equals("NEW"))
       out.print("<frame src=startgame.jsp>");
       else
      out.print("<frame src=startgame1.jsp>");  
      out.print("<frame src=gamebox.jsp>");
      out.print("</frameset>");
    %>
 

</html>