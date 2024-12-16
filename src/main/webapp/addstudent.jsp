<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%

	Admin admin = (Admin) session.getAttribute("admin");

	if(admin==null)
	{
		response.sendRedirect("admin/sessionexpiry");
	}
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="JavaScript/dashboard.js" defer></script>
    <style>
        /* Keep your original styles for sidebar and layout */
        
        /* New Form Styles */
        
        body{
        font-family: 'Poppins', sans-serif;
        }
        .form-section {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 2rem;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
        }

        .form-header {
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0f0f0;
        }

        .form-header h2 {
            color: #2c3e50;
            font-size: 1.5rem;
            margin: 0;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #2c3e50;
            font-size: 0.9rem;
        }

        .required-field::after {
            content: '*';
            color: #e74c3c;
            margin-left: 4px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background-color: #f8fafc;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #4a90e2;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
            outline: none;
        }

        .form-group input::placeholder {
            color: #94a3b8;
        }

        .submit-btn {
            width: 100%;
            padding: 0.875rem;
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #357abd 0%, #2d6ba1 100%);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(74, 144, 226, 0.2);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

.alert {
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background-color: #dcfce7;
    border: 1px solid #86efac;
    color: #166534;
    font-size: 1rem;
}

.alert::before {
    content: '\2713'; /* Unicode for tick mark */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background: #86efac;
    border-radius: 50%;
    color: #166534;
    font-size: 1.2rem;
    font-weight: bold;
}

        .password-group {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 60%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #64748b;
            cursor: pointer;
            padding: 0.25rem;
        }

        /* Floating labels effect */
        .form-group {
            position: relative;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            transform: translateY(-120%) scale(0.9);
            background-color: white;
            padding: 0 0.4em;
            color: #4a90e2;
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .form-section {
                margin: 1rem;
                padding: 1.5rem;
            }
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

        <section class="form-section">
            <div class="form-header">
                <h2>Student Registration Form</h2>
            </div>

            <% if (request.getAttribute("message") != null) { %>
                <div class="alert">
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>

            <form method="post" action="addstudentrecord" onsubmit="return validateForm();">
                <div class="form-row">
                    <div class="form-group">
                        <label class="required-field" for="sid">Student ID</label>
                        <input type="text" id="sid" name="id" placeholder="Enter student ID" required>
                    </div>
                    <div class="form-group">
                        <label class="required-field" for="sname">Full Name</label>
                        <input type="text" id="sname" name="name" placeholder="Enter full name" required>
                    </div>
                </div>`

                <div class="form-row">
                    <div class="form-group">
                        <label class="required-field" for="sgender">Gender</label>
                        <select id="sgender" name="gender" required>
                            <option value="">Select gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="required-field" for="sdob">Date of Birth</label>
                        <input type="date" id="sdob" name="dob" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="required-field" for="semail">Email Address</label>
                        <input type="email" id="semail" name="email" placeholder="Enter email address" required>
                    </div>
                    <div class="form-group">
                        <label class="required-field" for="scontact">Contact Number</label>
                        <input type="tel" id="scontact" name="contact" pattern="^[0-9]{10}$" placeholder="Enter 10-digit number" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group password-group">
                        <label class="required-field" for="spwd">Password</label>
                        <input type="password" id="spwd" name="password"  value="klef1234"  placeholder="Enter password" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('spwd')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="form-group password-group">
                        <label class="required-field" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" value="klef1234" placeholder="Confirm password" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="required-field" for="saddress">Address</label>
                    <input type="text" id="saddress" name="address" placeholder="Enter full address" required>
                </div>
                

                <button type="submit" class="submit-btn">Add Student</button>
            </form>
        </section>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById('spwd').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }

        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = input.nextElementSibling.querySelector('i');
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>