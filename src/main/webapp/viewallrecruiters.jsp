<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%

	Admin admin = (Admin) session.getAttribute("admin");

	if(admin.getStatus().equals("PPO"))
	{
		response.sendRedirect("/admin/unauth");
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
        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Poppins', sans-serif;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #022356;
            color: #f4f7f6;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tbody tr:hover {
            background-color: rgba(13, 110, 253, 0.07);
        }

        .btn {
            padding: 4px 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .btn-profile {
            background-color: #0d6efd;
            color: white;
        }

        .btn-profile:hover {
            background-color: #0b5ed7;
        }

        .btn-interview {
            background-color: #28a745;
            color: white;
        }

        .btn-interview:hover {
            background-color: #218838;
        }

        .btn-reject {
            background-color: #dc3545;
            color: white;
        }

        .btn-reject:hover {
            background-color: #c82333;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-pending {
            background-color: #ffc107;
            color: #212529;
        }
        
        .status-interview {
            background-color: #262dc3;
            color: white;
        }

        .status-accepted {
            background-color: #28a745;
            color: white;
        }

        .status-rejected {
            background-color: #dc3545;
            color: white;
        }
        .status-shortlisted {
    background-color: #dcfce7;
    color: #166534;
}
        
    </style>
    <script src="JavaScript/dashboard.js" defer></script>
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
                <span><%= admin.getUsername() %></span>
                <button class="logout-btn" onclick="window.location.href='/admin/logout'">Logout</button>
            </div>
            </header>
            
            
            <div class="container-fluid px-4 py-4">
            <div class="table-wrapper">
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>Recruiter ID</th>
                                <th>Recruiter Name</th>
                                <th>Company</th>
                                <th>Status</th>
                                
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="r" items="${rlist}">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span>${r.id}</span>
                                    </div>
                                </td>
                                <td>${r.name}</td>
                                <td>${r.company}</td>
                                <td>
                                
    							<c:choose>
        								<c:when test="${r.status =='PENDING'}">
								            <span class="status-badge status-pending">${r.status}</span>
								        </c:when>

								        <c:when test="${r.status == 'Accepted'}">
								            <span class="status-badge status-accepted">${r.status}</span>
								        </c:when>
								        <c:otherwise>
								            <span class="status-badge status-rejected">${r.status}</span>
								        </c:otherwise>
								</c:choose>
							</td>
                                
                                <td>
                                    <div class="d-flex gap-2">
                                        
                                        <button class="btn btn-reject" title="Reject" onclick="window.location.href='/setstatustoblocked/${r.id}/Blocked'">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="dashboard.js"></script>
        
        
       
 
    <script>
function logout() {
    window.location.href = 'adminlogin.jsp'
}
</script>
</body>
</html>
