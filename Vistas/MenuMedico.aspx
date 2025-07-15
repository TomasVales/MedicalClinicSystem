<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMedico.aspx.cs" Inherits="Vistas.MenuMedico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Panel Médico - Clínica Médica</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-color: #2a7fba;
            --primary-light: #e1f0fa;
            --secondary-color: #4a90e2;
            --accent-color: #5cb85c;
            --text-color: #333;
            --light-gray: #f8f9fa;
            --medium-gray: #e9ecef;
            --dark-gray: #495057;
            --error-color: #d9534f;
            --success-color: #5cb85c;
            --border-radius: 6px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Roboto', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-gray);
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .doctor-container {
            background-color: white;
            width: 100%;
            max-width: 450px;
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            text-align: center;
            margin: 20px;
        }

        .doctor-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .doctor-header h1 {
            font-family: 'Montserrat', sans-serif;
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 28px;
        }

        .welcome-message {
            font-size: 18px;
            color: var(--dark-gray);
            font-weight: 500;
            margin: 15px 0;
        }

        .doctor-options {
            margin: 30px 0;
        }

        .doctor-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            padding: 15px;
            margin: 15px 0;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
        }

        .doctor-btn:hover {
            background-color: #1e6b9e;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .footer-links {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid var(--medium-gray);
        }

        .logout-link {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 10px 20px;
            text-decoration: none;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-weight: 500;
            font-family: 'Montserrat', sans-serif;
        }

        .logout-link:hover {
            background-color: var(--primary-light);
            text-decoration: none;
        }

        @media (max-width: 480px) {
            .doctor-container {
                padding: 30px 20px;
            }
            
            .doctor-header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="doctor-container">
            <div class="doctor-header">
                <h1>Panel Médico</h1>
                <div class="welcome-message">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class="doctor-options">
                <a href="#" class="doctor-btn" onclick="document.getElementById('<%= btnTurnosMedico.ClientID %>').click(); return false;">
                    <i class="fas fa-calendar-alt"></i> Ver Turnos Asignados
                </a>
                <asp:Button ID="btnTurnosMedico" runat="server" 
                    OnClick="Button2_Click"
                    style="display: none;" />
            </div>

            <div class="footer-links">
                <a href="Login.aspx" class="logout-link">
                    <i class="fas fa-sign-out-alt"></i> Cerrar sesión
                </a>
            </div>
        </div>
    </form>
</body>
</html>