/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Pessoa;
import util.LDAP;

/**
 *
 * @author euzebio
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DaoFactory daoFactory = new DaoFactory();
            String login = request.getParameter("login").trim();
            String senha = request.getParameter("senha") != null ? request.getParameter("senha").trim() : "";
            HttpSession sessao = request.getSession();
            sessao.setMaxInactiveInterval(3000);
            String msg = new String();

            boolean autentica = true;
            
            if (login.equals("123456") && senha.equals("admin")) {
                Pessoa pessoa = (Pessoa) daoFactory.getPessoaDao().pesquisarPor(login, "cpf").get(0);
                sessao.setAttribute("cpf", pessoa.getCpf());
                sessao.setAttribute("nome", pessoa.getNome());
                sessao.setAttribute("nivel", pessoa.getNivel());
                sessao.setAttribute("pessoa_id", pessoa.getId());
                response.sendRedirect("home.jsp");
            } else {

                msg = "Usuário ou senha incorretos (USE O USUÁRIO E SENHA DO SUAP)";
                request.getRequestDispatcher("index.jsp?msg=" + msg).forward(request, response);
            }

        }

    }    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
