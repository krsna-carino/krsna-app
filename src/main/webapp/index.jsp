<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    java.util.Date now = new java.util.Date();
    pageContext.setAttribute("currentDate", now);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Krsna App | Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Global Styles */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background: rgba(0,0,0,0.3);
            align-items: center;
            border-bottom: 2px solid #fff;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
            transition: 0.3s;
        }
        nav a:hover { color: #00f2fe; }

        /* Header */
        header {
            text-align: center;
            padding: 80px 20px 40px;
        }
        header h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            animation: fadeInDown 1s ease-out;
        }
        header p {
            font-size: 1.3rem;
            animation: fadeInUp 1s ease-out;
        }

        /* Container */
        .container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 40px;
            padding: 0 20px;
        }
        .btn {
            padding: 14px 28px;
            background: #fff;
            color: #4facfe;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn:hover {
            background: #eee;
            transform: translateY(-3px) scale(1.05);
        }

        /* Footer */
        footer {
            margin-top: auto;
            padding: 20px;
            text-align: center;
            background: rgba(0,0,0,0.4);
            font-size: 0.9rem;
        }

        /* Animations */
        @keyframes fadeInDown { from { opacity:0; transform: translateY(-20px);} to {opacity:1; transform: translateY(0);} }
        @keyframes fadeInUp { from { opacity:0; transform: translateY(20px);} to {opacity:1; transform: translateY(0);} }

        /* Responsive */
        @media(max-width:768px){
            header h1 { font-size: 2.5rem; }
            .btn { width: 100%; text-align: center; }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <div class="logo"><strong>Krsna App</strong></div>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="hello">Hello Servlet</a>
        </div>
    </nav>

    <!-- Header -->
    <header>
        <h1>🚀 Welcome to Krsna App</h1>
        <p>Your CI/CD Pipeline Deployment was Successful ✅</p>
    </header>

    <!-- Buttons -->
    <div class="container">
        <a class="btn" href="hello">Try Hello Servlet</a>
        <a class="btn" href="about.jsp">Learn More About Us</a>
    </div>

    <!-- Footer -->
    <footer>
        &copy; <fmt:formatDate value="${currentDate}" pattern="yyyy"/> Krsna App. All Rights Reserved.
    </footer>
</body>
</html>
