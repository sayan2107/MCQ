<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.conn.MyConnection"%>
<%@page import="com.quiz.others.rand"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <%
            user u=(user)session.getAttribute("user");
            String subid=request.getParameter("subid");
            HttpSession hs=request.getSession();
            hs.setAttribute("subid", subid);
           try{if(u.getUname()!=null){
        %>
     
            <a href="logout.jsp">logout</a>
            <h1>Read the Instructions carefully</h1>
        
        <div id="instruction" name="instruction">
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

</p> 
        </div>
        <%
         //int start=1; 
         MyConnection m=new MyConnection();
         Connection cn=m.GetConn();
         String sql="select Q_ID from MCQ where SUB_ID="+subid;
         PreparedStatement ps = cn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         ArrayList<Integer> mylist=new ArrayList<Integer>();
      //   int count=0;
         while(rs.next()){
            mylist.add(rs.getInt("Q_ID"));
         //   count++;
         }
         Collections.shuffle(mylist);
         mylist.add(999999);
         cn.close();
         ps.close();
         rs.close();
        //rand r=new rand();
        //ArrayList<Integer> arr=r.getRand(count);
          hs.setAttribute("arr", mylist);
          int start=mylist.get(0);
        %>
        
        
      <input type="button" onclick="location.href='view.jsp?q=<%= start %>';" value="Start" />
        
         <% }
}catch(NullPointerException e){
          response.sendRedirect("login.jsp");
}
%>
    </body>
</html>
