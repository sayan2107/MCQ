/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.quiz.conn.MyConnection;
import com.quiz.model.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author sayan
 */
public class checklogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            String uname=(String)request.getParameter("uname");
            String password=(String)request.getParameter("password");
            MyConnection m=new MyConnection();
            Connection cn=m.GetConn();
            String sql2="select * from STRUTS_USER where USERID=? and password=?";
            PreparedStatement ps2 = cn.prepareStatement(sql2);
            ps2.setString(1, uname);
            ps2.setString(2, password);
            ResultSet rs2=ps2.executeQuery();
            if(rs2.next()){
                out.print("ok");
                HttpSession hs=request.getSession();
                hs=request.getSession();
                user u=new user();
                u.setName(rs2.getString("name"));
                u.setUname(rs2.getString("userid"));
                u.setEmail(rs2.getString("email"));
                u.setContact(rs2.getString("contact"));
                u.setAddress(rs2.getString("address"));
                hs.setAttribute("user", u);
                //setting cookies for user
//                Cookie userCookie = new Cookie(u.getUname(), u.getUname()+"_"+u.getEmail());
//                userCookie.setMaxAge(60*60*24*30); //Store cookie for 30 days
//                response.addCookie(userCookie);
            }else{
                out.print("invalid username or password");
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
