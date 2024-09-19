<%@ page import="jakarta.servlet.http.HttpSession" %>

<body>
    <%

        if (session != null && session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");
    %>

    <div class="container">
        <h1>Welcome, <%= username %>!</h1>
        <p>We're delighted to have you on our platform. 🌟</p>
        <h3>Explore, learn, and connect with our vibrant community! 🚀</h3>
        <p>Feel free to stay as long as you like, and when you're ready,</p> 
        you can <a href="logout.jsp">LOGOUT</a> securely.
    </div>

    <%
        } else {
            response.sendRedirect("Login.jsp");
        }
    %>

</body>
