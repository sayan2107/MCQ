/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.quiz.conn.MyConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sayan
 */
public class addQuestion extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       String q_id=request.getParameter("q_id");
       String question=request.getParameter("question");
       String a=request.getParameter("a");
       String b=request.getParameter("b");
       String c=request.getParameter("c");
       String d=request.getParameter("d");
       String ans=request.getParameter("ans");
       String subid=(String)request.getSession().getAttribute("subid");
       
       try{
         MyConnection m=new MyConnection();
       Connection cn=m.GetConn();
       String sql="insert into MCQ values("+q_id+",'"+question+"','"+a+"','"+b+"','"+c+"','"+d+"','"+ans+"',"+subid+")";
       PreparedStatement ps = cn.prepareStatement(sql);
       int i=ps.executeUpdate();
       ps.close();
       cn.close();
       if(i>0){
           out.print("ok");
       }else{
           out.print("error");
       }
       }catch(Exception e){
           out.print(e);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
