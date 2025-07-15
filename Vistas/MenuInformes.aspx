<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuInformes.aspx.cs" Inherits="Vistas.MenuInformes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reportes del Sistema - Clínica Médica</title>
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
            flex-direction: column;
            justify-content: center;
        }

        .reports-container {
            width: 100%;
            max-width: 600px;
            margin: 40px auto;
            padding: 40px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
        }

        .reports-header {
            text-align: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .reports-header h1 {
            font-family: 'Montserrat', sans-serif;
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 28px;
        }

        .reports-header p {
            color: var(--dark-gray);
            margin: 0;
            font-size: 16px;
        }

        .report-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 30px;
        }

        .report-btn {
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
        }

        .report-btn:hover {
            background-color: #1e6b9e;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .message {
            padding: 12px;
            margin: 20px 0;
            border-radius: var(--border-radius);
            display: block;
            text-align: center;
            font-size: 14px;
        }

        .footer-links {
            text-align: center;
            margin-top: 30px;
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

        @media (max-width: 768px) {
            .reports-container {
                padding: 30px 20px;
                margin: 20px;
            }
            
            .reports-header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reports-container">
            <div class="reports-header">
                <h1>Reportes del Sistema</h1>
                <p>Generación de informes estadísticos</p>
            </div>

            <asp:Label ID="Label1" runat="server" CssClass="message"></asp:Label>

            <div class="report-options">
                <asp:Button ID="btnInforme1" runat="server" 
                    Text="Informe de Asistencias" 
                    CssClass="report-btn" 
                    OnClick="btnInforme1_Click" />
                
                <asp:Button ID="btnInforme2" runat="server" 
                    Text="Informe de Turnos por Especialidad" 
                    CssClass="report-btn" 
                    OnClick="btnInforme2_Click" />
            </div>

            <div class="footer-links">
                <asp:HyperLink ID="hplRegresarUnMenu" runat="server" 
                    NavigateUrl="~/MenuAdmin.aspx" 
                    CssClass="return-link">
                    ← Volver al Menú Principal
                </asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>