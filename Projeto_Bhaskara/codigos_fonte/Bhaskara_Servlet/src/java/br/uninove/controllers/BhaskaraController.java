package br.uninove.controllers;

import br.uninove.pojo.Bhaskara;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BhaskaraController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            
            int a = Integer.parseInt(request.getParameter("valorA"));
            int b = Integer.parseInt(request.getParameter("valorB"));
            int c = Integer.parseInt(request.getParameter("valorC"));
            double delta, rP, rN;
            String params;
            
            Bhaskara bhaskara = new Bhaskara();
            
            bhaskara.setA(a);
            bhaskara.setB(b);
            bhaskara.setC(c);
            
            params = String.format("a=%s&b=%s&c=%s", a, b, c);
            
            delta = bhaskara.calculaDelta();
            bhaskara.calculaBhaskara();
            
            if (delta > 0) {
                rP = bhaskara.getRaizPos();
                rN = bhaskara.getRaizNeg();
                params += String.format("&delta=%s&rP=%s&rN=%s", 
                    delta, rP, rN);
            } else {
                params += String.format("&delta=%s", delta);
            }
            
            //agora só falta enviar os resultados de volta para um "front"
            //uma das formas mais simples de fazer é via parâmetros na URL...
            //assim...
            response.sendRedirect("resultado.jsp?" + params);
            
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
