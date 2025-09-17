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
    <title>Krsna App | Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background: rgba(0,0,0,0.4);
            backdrop-filter: blur(5px);
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
            transition: color 0.3s;
        }
        nav a:hover { color: #ffce00; }

        /* Header */
        header {
            text-align: center;
            padding: 60px 20px 40px;
        }
        header h1 { font-size: 3rem; color: #ffce00; margin-bottom: 10px; }
        header p { font-size: 1.2rem; color: #eee; }

        /* Dashboard metrics */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            padding: 20px 40px;
        }
        .card {
            background: rgba(255,255,255,0.05);
            border-radius: 15px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            transition: transform 0.3s, box-shadow 0.3s;
            backdrop-filter: blur(5px);
        }
        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 16px 40px rgba(0,0,0,0.7);
        }
        .card h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #00f2fe;
        }
        .card p {
            font-size: 1rem;
            color: #ccc;
        }
        .card .icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        /* Buttons */
        .actions {
            text-align: center;
            margin: 40px 0;
        }
        .btn {
            display: inline-block;
            padding: 14px 30px;
            margin: 10px;
            border-radius: 50px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #ffce00;
            color: #0f2027;
        }
        .btn-primary:hover {
            transform: scale(1.05);
            background: #ffd633;
        }
        .btn-secondary {
            background: rgba(255,255,255,0.2);
            color: #fff;
        }
        .btn-secondary:hover {
            transform: scale(1.05);
            background: rgba(255,255,255,0.35);
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0,0,0,0.4);
            font-size: 0.9rem;
            color: #ccc;
        }

        /* Responsive header */
        @media(max-width:768px){
            header h1 { font-size: 2rem; }
            .card h2 { font-size: 2rem; }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
    <nav>
        <div class="logo"><strong>Krsna App</strong></div>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="hello">Hello Servlet</a>
        </div>
    </nav>

    <header>
        <h1>🚀 Welcome to Krsna App</h1>
        <p>Your CI/CD Pipeline Deployment was Successful ✅</p>
    </header>

    <div class="dashboard">
        <div class="card">
            <div class="icon"><i class="fas fa-server"></i></div>
            <h2>Tomcat</h2>
            <p>Status: Running</p>
        </div>
        <div class="card">
            <div class="icon"><i class="fas fa-tools"></i></div>
            <h2>Jenkins</h2>
            <p>Build: Successful</p>
        </div>
        <div class="card">
            <div class="icon"><i class="fas fa-check-circle"></i></div>
            <h2>Pipeline</h2>
            <p>Last Deploy: Success</p>
        </div>
        <div class="card">
            <div class="icon"><i class="fas fa-database"></i></div>
            <h2>Database</h2>
            <p>Connected ✅</p>
        </div>
    </div>

    <div class="actions">
        <a class="btn btn-primary" href="hello">Try Hello Servlet</a>
        <a class="btn btn-secondary" href="about.jsp">About Us</a>
    </div>

    <footer>
        &copy; <fmt:formatDate value="${currentDate}" pattern="yyyy"/> Krsna App. All Rights Reserved.
    </footer>
</body>
</html>
