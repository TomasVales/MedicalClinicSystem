<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin.aspx.cs" Inherits="Vistas.MenuAdmin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Menú Administrador</title>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .contenedor {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .menu-box {
            background-color: white;
            padding: 40px 60px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .menu-box h1 {
            margin-bottom: 30px;
            font-size: 26px;
            color: #2c3e50;
        }

        .menu-box .boton {
            display: block;
            width: 260px;
            margin: 12px auto;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .menu-box .boton:hover {
            background-color: #2980b9;
        }
    
        .hipervinculo {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-weight: bold;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <div class="menu-box">
                <h1>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </h1>

                <asp:Button ID="BtnPacientes" runat="server" Text="Pacientes" CssClass="boton" OnClick="BtnPacientes_Click" />
                <asp:Button ID="btnMedicos" runat="server" Text="Médicos" CssClass="boton" OnClick="btnMedicos_Click" />
                <asp:Button ID="btnAsignacionTurnos" runat="server" Text="Asignación de Turnos" CssClass="boton" OnClick="btnAsignacionTurnos_Click" />
                <asp:Button ID="btnInformes" runat="server" Text="Informes" CssClass="boton" OnClick="btnInformes_Click" />

            <asp:HyperLink ID="hplRegresarLogin" runat="server" NavigateUrl="~/Login.aspx" 
                    CssClass="hipervinculo">
                Regresar al login
            </asp:HyperLink>

            </div>
        </div>
    </form>
</body>
</html>
