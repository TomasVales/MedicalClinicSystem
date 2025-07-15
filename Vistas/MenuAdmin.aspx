<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin.aspx.cs" Inherits="Vistas.MenuAdmin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Panel de Administración - Clínica Médica</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet" />
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

        .admin-container {
            width: 100%;
            max-width: 800px;
            margin: 20px;
            padding: 40px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .admin-header {
            text-align: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .admin-header h1 {
            font-family: 'Montserrat', sans-serif;
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 28px;
        }

        .admin-header p {
            color: var(--dark-gray);
            margin: 0;
            font-size: 16px;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .menu-item {
            display: flex;
            flex-direction: column;
        }

        .menu-btn {
            padding: 15px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: var(--transition);
            text-align: center;
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .menu-btn:hover {
            background-color: #1e6b9e;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .footer-links {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid var(--medium-gray);
        }

        .return-link {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-weight: 500;
            font-family: 'Montserrat', sans-serif;
        }

        .return-link:hover {
            background-color: var(--primary-light);
            text-decoration: none;
        }

        .welcome-message {
            font-size: 18px;
            color: var(--dark-gray);
            margin-bottom: 5px;
            font-weight: 500;
        }

        @media (max-width: 600px) {
            .admin-container {
                padding: 30px 20px;
            }
            
            .menu-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-container">
            <div class="admin-header">
                <h1>Panel de Administración</h1>
                <p>Gestión integral del sistema clínico</p>
                <div class="welcome-message">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>

            <div class="menu-grid">
                <div class="menu-item">
                    <asp:Button ID="BtnPacientes" runat="server" Text="Gestión de Pacientes" 
                        CssClass="menu-btn" OnClick="BtnPacientes_Click" />
                </div>
                <div class="menu-item">
                    <asp:Button ID="btnMedicos" runat="server" Text="Gestión de Médicos" 
                        CssClass="menu-btn" OnClick="btnMedicos_Click" />
                </div>
                <div class="menu-item">
                    <asp:Button ID="btnAsignacionTurnos" runat="server" Text="Asignación de Turnos" 
                        CssClass="menu-btn" OnClick="btnAsignacionTurnos_Click" />
                </div>
                <div class="menu-item">
                    <asp:Button ID="btnInformes" runat="server" Text="Reportes e Informes" 
                        CssClass="menu-btn" OnClick="btnInformes_Click" />
                </div>
            </div>

            <div class="footer-links">
                <asp:HyperLink ID="hplRegresarLogin" runat="server" NavigateUrl="~/Login.aspx" 
                    CssClass="return-link">
                    ← Cerrar sesión
                </asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>