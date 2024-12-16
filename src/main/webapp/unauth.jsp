<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unauthorized Access</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
    
        body {
            background-color: #f4f6f9;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
        .unauthorized-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            margin-left: 420px;
        }
        .unauthorized-icon {
            margin-bottom: 20px;
        }
        .unauthorized-icon svg {
            width: 80px;
            height: 80px;
            fill: #dc3545;
        }
        .btn-return {
            margin-top: 20px;
            background-color: #007bff;
            border-color: #007bff;
            transition: all 0.3s ease;
        }
        .btn-return:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="unauthorized-container">
            <div class="unauthorized-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M12 1L3 5V11C3 16.55 6.84 21.74 12 23C17.16 21.74 21 16.55 21 11V5L12 1ZM12 11.99H19C18.47 15.64 15.74 18.95 12 19.86V12H5V6.3L12 3.19V12Z"/>
                    <line x1="16" y1="8" x2="8" y2="16" stroke="#dc3545" stroke-width="2"/>
                    <line x1="8" y1="8" x2="16" y2="16" stroke="#dc3545" stroke-width="2"/>
                </svg>
            </div>
            <h1 class="mb-4 text-danger">Unauthorized Access</h1>
            <p class="lead text-muted">
                You do not have permission to access this page. 
                Please contact the system administrator if you believe this is an error.
            </p>
            <a href="/admin/dashboard" class="btn btn-primary btn-return">
                Return to Home
            </a>
        </div>
    </div>

    <!-- Bootstrap JS (optional, but recommended) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>