<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%

	Admin admin = (Admin) session.getAttribute("admin");

	if(admin==null)
	{
		response.sendRedirect("admin/sessionexpiry");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
    @charset "UTF-8";
/* General Reset */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    display: flex;
    height: 100vh;
    background-color: #f5f5f5;
    overflow-x: hidden;
    position: relative;
}

/* Menu Icon (Hamburger) */
.menu-icon {
    position: fixed;
    top: 20px;
    left: 20px;
    font-size: 30px;
    cursor: pointer;
    color: gray;
    z-index: 1000; /* Ensure icon is on top */
}

/* Sidebar Styles */
.sidebar {
    width: 290px;
    background-color: #2f335a;
    padding: 20px;
    color: white;
    position: fixed;
    left: -290px; /* Initially hidden */
    top: 0;
    height: 100%;
    transition: left 0.5s ease; /* Increased transition duration */
    z-index: 900; /* Above content */
    overflow-y: auto; /* Scroll if content exceeds */
}

.sidebar.active {
    left: 0;
}

.sidebar-header {
    margin-bottom: 20px;
}

.sidebar h2 {
    font-size: 22px;
    color: #ffffff;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 15px;
}

.sidebar ul li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 16px;
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    transition: background 0.3s, color 0.3s;
}

.sidebar ul li a:hover {
    background-color: #7f8996;
    color: #ffffff;
}

.sidebar ul li a i {
    margin-right: 10px;
}

/* Dropdown Arrow Styling */
.arrow {
    margin-left: auto;
    transition: transform 0.3s ease;
}

/* Dropdown Styles */
.dropdown-content {
    display: none;
    list-style: none;
    padding-left: 20px;
    background-color: #7f8996;
    margin-top: 10px;
    border-radius: 5px;
    overflow: hidden;
    max-height: 0;
    transition: max-height 0.5s ease-in-out; /* Smoother dropdown transition */
}

.dropdown-content li {
    margin: 5px 0;
}

.dropdown-content li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 14px;
    display: flex;
    align-items: center;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background 0.3s;
}

.dropdown-content li a:hover {
    background-color: #0112AC;
}

.show {
    display: block;
    max-height: 300px;
}

/* Main Content Styles */
.container {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    transition: margin-left 0.3s ease;
    margin-left: 0;
}

.sidebar.active ~ .container {
    margin-left: 250px; /* Adjust for sidebar */
}

.main-content {
    padding: 20px;
    margin-left: 270px; /* Reserve space for sidebar */
    margin-top: 50px; /* Space for header */
    transition: margin-left 0.3s ease;
    flex-grow: 1;
    background-color: #ecf0f1;
    border-radius: 10px;
}

/* Adjustments for when the sidebar is active */
.sidebar.active ~ .main-content {
    margin-left: 0;
}

/* Header Styles */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #ffffff;
    padding: 10px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border-radius: 10px;
}

header h1 {
    font-size: 24px;
    color: #2c3e50;
}

.user-info {
    display: flex;
    align-items: center;
}

.user-info span {
    margin-right: 20px;
    font-size: 18px;
}

.logout-btn {
    padding: 8px 16px;
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.logout-btn:hover {
    background-color: #c0392b;
}

/* Dashboard Cards */
.dashboard-cards {
    display: flex;
    flex-direction: column; /* Stack cards vertically */
    justify-content: center;
    gap: 15px; /* Reduced gap between cards */
    margin-top: 20px;
}

.card {
    background-color: #7f8996;
    padding: 10px; /* Reduced padding */
    border-radius: 8px; /* Slightly smaller border radius */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15); /* Lighter shadow */
    text-align: center;
    flex: 1;
    min-width: 150px; /* Reduced minimum width */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effects */
}

.card:hover {
    transform: translateY(-4px); /* Slight lift effect on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Enhanced shadow on hover */
}

.card h3 {
    font-size: 14px; /* Reduced font size */
    margin-bottom: 6px; /* Reduced margin */
    color: #ffffff; /* Improved text color */
}

.card p {
    font-size: 20px; /* Reduced font size */
    font-weight: bold;
    color: #ffffff; /* Improved text color */
}

/* Button Styles */
.primary-btn, .secondary-btn {
    padding: 8px 16px; /* Reduced padding */
    font-size: 14px; /* Reduced font size */
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.primary-btn {
    background-color: #ffffff;
    color: #0112AC;
    border: 1px solid #0112AC;
}

.primary-btn:hover {
    background-color: #e0e0e0;
}

.secondary-btn {
    background-color: #f0f0f0;
    color: #0112AC;
    border: 1px solid #b0b0b0;
}

.secondary-btn:hover {
    background-color: #c1c1c1;
}

/* Media Queries for Responsiveness */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 100%;
        left: -100%;
    }

    .sidebar.active {
        left: 0;
    }

    .container, .main-content {
        margin-left: 0;
    }

    .dashboard-cards {
        flex-direction: column; /* Ensure cards stack vertically on small screens */
        gap: 10px; /* Reduced gap for small screens */
    }

    .card {
        min-width: unset; /* Remove minimum width for smaller screens */
    }
}

/* General styles */
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f9;
}

.login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #f4f6f9;
}

.login-box {
    background-color: white;
    padding: 40px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.logo h1 {
    font-size: 2em;
    color: #0112AC; /* Primary color */
    margin-bottom: 40px;
}

.input-group {
    margin-bottom: 20px;
    text-align: left;
}

.input-group label {
    font-weight: 600;
    font-size: 0.9em;
    color: #333;
}

.input-group input {
    width: 100%;
    padding: 12px 15px;
    font-size: 1em;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f7f9fc;
}

.input-group input:focus {
    border-color: #0112AC;
    outline: none;
    background-color: #fff;
}

.input-group input:hover {
    border-color: #0b5ed7; /* Added hover effect */
}

.login-btn {
    width: 100%;
    padding: 15px;
    font-size: 1em;
    background-color: #0112AC;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.login-btn:hover {
    background-color: #0b5ed7;
}

.forgot-password {
    margin-top: 20px;
    font-size: 0.9em;
    color: #0112AC;
    cursor: pointer;
}

    
        .main-content {
            padding: 2rem;
            background-color: #f8f9fa;
        }

        header {
            background-color: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        header h1 {
            color: #2c3e50;
            margin: 0;
            font-size: 1.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-info span {
            color: #555;
            font-weight: 500;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
        }

        .card:nth-child(1)::before {
            background-color: #3498db;
        }

        .card:nth-child(2)::before {
            background-color: #2ecc71;
        }

        .card:nth-child(3)::before {
            background-color: #f1c40f;
        }

        .card h3 {
            color: #34495e;
            margin: 0 0 1rem 0;
            font-size: 1.2rem;
        }

        .card p {
            color: #2c3e50;
            font-size: 2rem;
            font-weight: bold;
            margin: 0;
        }

        /* Add icons to cards */
        .card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .card i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #7f8c8d;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-content {
                padding: 1rem;
            }

            header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
         /* Existing styles... (keep the previous CSS) */
        
        /* New chart container styles */
        .chart-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .chart-container h3 {
            margin-bottom: 1rem;
            color: #34495e;
        }

        canvas {
            max-width: 100%;
            height: 300px !important;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .chart-grid {
                grid-template-columns: 1fr;
            }
        }
        /* Add this to your existing <style> section */
.job-postings-table {
    margin-top: 2rem;
}

.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    border-collapse: collapse;
}

.table th,
.table td {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}

.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
    background-color: #f8f9fa;
    font-weight: 600;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: rgba(0, 0, 0, 0.05);
}

.table-striped tbody tr:hover {
    background-color: rgba(0, 0, 0, 0.075);
}
    </style>
    
</head>
<body>
<script src="${pageContext.request.contextPath}/JavaScript/dashboard.js"></script>
    <div class="sidebar-container">
        <!-- Menu Icon (Hamburger) -->
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleSidebar()"></i>
        </div>

        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header"><br><br>
                <h2>Hello Admin</h2>
            </div>
            <ul>
                <li><a href="dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('students')">
                        <i class="fas fa-users"></i> Manage Students
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="students-dropdown">
                        <li><a href="viewstudents"><i class="fas fa-eye"></i> View Students</a></li>
                        <li><a href="addstudent"><i class="fas fa-user-edit"></i> Add Student</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('employers')">
                        <i class="fas fa-building"></i> Manage Employers
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="employers-dropdown">
                        
                        <li><a href="getpendingrecruiters"><i class="fas fa-user-edit"></i>Validate Employer</a></li>
                    </ul>
                </li>
                <li><a href="getstudentjobs"><i class="fas fa-user-edit"></i>Student Jobs</a></li>
                <li><a href="jobpostings"><i class="fas fa-briefcase"></i> Job Postings</a></li>
                
                
            </ul>
        </div>
    </div>

    <div class="main-content" id="mainContent">
        <header>
            <h1>CareerStream</h1>
             <div class="user-info">
                <span><%= session.getAttribute("adminName") != null ? session.getAttribute("adminName") : "Admin" %></span>
                <button class="logout-btn" onclick="window.location.href='/admin/logout'">Logout</button>
            </div>
        </header>
        
        
        
        <!-- Chart Canvas -->
    <!-- Replace the chart-grid section with a table of job postings -->
<section class="job-postings-table">
    <div class="card">
        <h3>Job Postings by Company</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Company Name</th>
                    <th>Number of Job Postings</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="jobPosting" items="${jlist}">
                    <tr>
                        <td>${jobPosting[0]}</td>
                        <td>${jobPosting[1]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>
    
    </div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>
