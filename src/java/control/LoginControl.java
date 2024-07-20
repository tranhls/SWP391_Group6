/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.passwordEncryption;

/**
 *
 * @author buidu // loi o phan ma hoa mat khau
 */
public class LoginControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

//        pass = passwordEncryption.toSHA1(pass);

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        // Kiểm tra xem người dùng đã click vào captcha hay chưa
        if (gRecaptchaResponse == null || gRecaptchaResponse.isEmpty()) {
            request.setAttribute("mess", "Please complete the captcha!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return; // Đảm bảo không tiếp tục thực hiện code phía dưới nếu không có captcha
        }
        // Tiếp tục xử lý đăng nhập nếu đã click vào captcha
        DAO dao = new DAO();
        Account acc = dao.getAccount(user, pass);

        if (acc == null) {
            request.setAttribute("mess", "You entered the wrong account or password, please re-enter!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            Customer cus = dao.getCustomerByID(acc.getAccountID());
            HttpSession session = request.getSession();
            session.setAttribute("acc", acc);
            session.setAttribute("cus", cus);
            request.setAttribute("user", acc.getUser());
            request.getRequestDispatcher("home").forward(request, response);
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
