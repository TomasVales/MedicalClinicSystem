<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Iniciar Sesión - Clínica Médica</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .contenedor-login {
            background-color: white;
            width: 100%;
            max-width: 400px;
            margin: 20px;
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            font-family: 'Montserrat', sans-serif;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .login-header p {
            color: var(--dark-gray);
            margin: 0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-gray);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--medium-gray);
            border-radius: var(--border-radius);
            font-size: 14px;
            transition: var(--transition);
            font-family: 'Roboto', sans-serif;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(42, 127, 186, 0.2);
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            font-family: 'Montserrat', sans-serif;
            font-size: 16px;
            margin-top: 10px;
        }

        .btn-login:hover {
            background-color: #1e6b9e;
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .message {
            padding: 12px;
            margin: 20px 0;
            border-radius: var(--border-radius);
            display: block;
            text-align: center;
        }

        .message-error {
            background-color: #ffebee;
            border-left: 4px solid var(--error-color);
            color: #c62828;
        }

        .validator-error {
            color: var(--error-color);
            font-size: 13px;
            margin-top: 5px;
            display: block;
        }

        @media (max-width: 480px) {
            .contenedor-login {
                padding: 30px 20px;
                margin: 20px 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor-login">
            <div class="login-header">
                <h1>Iniciar Sesión</h1>
                <p>Ingrese sus credenciales para acceder al sistema</p>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="message message-error" Visible="false" />

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Usuario:" AssociatedControlID="txtUsuario"></asp:Label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RfUsuario" runat="server" 
                    ControlToValidate="txtUsuario" 
                    CssClass="validator-error"
                    Display="Dynamic"
                    ErrorMessage="Ingrese un usuario" />
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Contraseña:" AssociatedControlID="txtContrasena"></asp:Label>
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RFVcontraseña" runat="server" 
                    ControlToValidate="txtContrasena" 
                    CssClass="validator-error"
                    Display="Dynamic"
                    ErrorMessage="Ingrese una contraseña" />
            </div>

            <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" 
                OnClick="btnIniciarSesion_Click" CssClass="btn-login" />
        </div>
    </form>
</body>
</html>