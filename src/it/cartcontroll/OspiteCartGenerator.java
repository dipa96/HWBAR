package it.cartcontroll;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OspiteCartGenerator
 */
@WebServlet("/OspiteCartGenerator")
public class OspiteCartGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		ArrayList alok = null;
        ArrayList pid_list = new ArrayList();
        if(session.getAttribute("ospitecartid")==null) {
        session.setAttribute("ospitecartid", session.getId());
	}
}
}

