<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMedico.aspx.cs" Inherits="Vistas.MenuMedico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Menú del Médico</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .contenedor {
            background-color: #ffffff;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        h1 {
            font-size: 24pt;
            color: #2c3e50;
            margin-bottom: 40px;
        }

        .boton {
            display: block;
            width: 80%;
            max-width: 250px;
            margin: 20px auto;
            padding: 15px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #3498db;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .boton:hover {
            background-color: #2980b9;
        }

        .espaciado {
            margin-top: 20px;
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
            <h1>
                Bienvenido</h1>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </p>

            <asp:Button ID="btnTurnosMedico" runat="server" CssClass="boton"
                Text="🗓️ Ver Turnos Asignados" OnClick="Button2_Click" />
            <br />

            <asp:HyperLink ID="hplRegresarLogin" runat="server" NavigateUrl="~/Login.aspx" 
                CssClass="hipervinculo">
                Regresar al login
            </asp:HyperLink>

        </div>
    </form>
</body>
</html>
