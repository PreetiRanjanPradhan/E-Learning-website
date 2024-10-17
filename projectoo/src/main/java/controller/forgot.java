package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserDao;
import dao.UserDaoImpl;


@WebServlet("/forgot")
public class forgot extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String recovery = request.getParameter("recovery");

        UserDao userDao = new UserDaoImpl();
        if (userDao.isRecoveryCorrect(username, recovery))
        {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("newPass.jsp");
        }
        else {
            response.sendRedirect("forgot.jsp?error=1");
            System.out.println("Recovery failed: Invalid username or recovery code");
        }
    }

}