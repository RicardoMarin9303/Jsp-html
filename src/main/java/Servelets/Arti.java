/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import com.mysql.jdbc.Driver;

/**
 *
 * @author rlmz93
 */
public class Arti extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

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
		
		try (PrintWriter out = response.getWriter()) {

  try {
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost/proyecto?articulos=rlmz93&password=213840950");
      st = con.createStatement();
                      String query="SELECT * FROM `articulos` ";
String where=" where 1=1 ";
String articulo=request.getParameter("articulo");
if(articulo!=null){
articulo=articulo.replaceAll("'", "\\\\'");
articulo=articulo.replaceAll("\\\\", "\\\\\\\\'");
    where=where+" and articulo='"+articulo+"' ";
}
query += where;
rs = st.executeQuery(query);
      while (rs.next()) {
				out.print("<tr>"
                            + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
						+ "<td>"
						 +"<a href=\"buscar.jsp\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
						+ "</td>"
                            + "</tr>"
                    );
                        }
                    } 
                    catch (ClassNotFoundException | SQLException e) {
                        out.print("error mysql "+e);
                    }
               
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
