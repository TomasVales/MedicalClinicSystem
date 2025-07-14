<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar Sesión</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }

        .login-container h2 {
            text-align: center;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .form-control label {
            display: block;
            margin-bottom: 5px;
        }

        .form-control input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .form-control button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .form-control button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>

            <div class="form-control">
                <label for="txtUsuario">Usuario:</label>
                <asp:TextBox ID="txtUsuario" runat="server" />
                <asp:RequiredFieldValidator ID="RfUsuario" runat="server" ControlToValidate="txtUsuario" ForeColor="Red">Ingrese un Usuario</asp:RequiredFieldValidator>
            </div>

            <div class="form-control">
                <label for="txtContrasena">Contraseña:</label>
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RFVcontraseña" runat="server" ControlToValidate="txtContrasena" ForeColor="Red">Ingrese Una Contraseña</asp:RequiredFieldValidator>
            </div>

            <div class="form-control">
                <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
