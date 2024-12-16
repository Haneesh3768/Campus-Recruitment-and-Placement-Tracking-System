<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
    
        :root {
            --primary-color: #4f46e5;
            --error-color: #ef4444;
            --success-color: #10b981;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f3f4f6 0%, #fff 100%);
            font-family: 'Poppins', sans-serif;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        .logo-section {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-section h1 {
            color: #1f2937;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4b5563;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            padding-left: 2.5rem;
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .form-group i {
            position: absolute;
            left: 1rem;
            top: 2.35rem;
            color: #9ca3af;
        }

        .error-message {
            background-color: #fef2f2;
            color: var(--error-color);
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            animation: slideIn 0.3s ease-out;
        }

        .error-message i {
            margin-right: 0.5rem;
        }

        .login-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background-color: #4338ca;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-10px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Loading spinner for button */
        .login-btn.loading {
            position: relative;
            color: transparent;
        }

        .login-btn.loading::after {
            content: "";
            position: absolute;
            width: 1rem;
            height: 1rem;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 2px solid white;
            border-radius: 50%;
            border-top-color: transparent;
            animation: spin 0.6s linear infinite;
        }

        @keyframes spin {
            to {
                transform: translate(-50%, -50%) rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo-section">
            <h1>Career Stream</h1>
            
        </div>

        <form action="checklogin" method="POST" id="loginForm">
            <c:if test="${not empty message}">
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><c:out value="${message}"/></span>
                </div>
            </c:if>

            <div class="form-group">
                <label for="username">Username</label>
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="login-btn" id="loginButton">
                Login
            </button>
        </form>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const button = document.getElementById('loginButton');
            button.classList.add('loading');
            button.disabled = true;
        });
    </script>
</body>
</html>