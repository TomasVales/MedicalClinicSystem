<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuInformes.aspx.cs" Inherits="Vistas.MenuInformes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Menú de Informes</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .contenedor {
            width: 50%;
            margin: 80px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 40px;
            font-size: 28pt;
        }

        .boton-informe {
            display: block;
            margin: 20px auto;
            width: 80%;
            max-width: 350px;
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

        .boton-informe:hover {
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
            <h1> Informes del Sistema</h1>
            <p>

            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>

            </p>

            <asp:Button ID="btnInforme1" runat="server" CssClass="boton-informe"
                Text=" Informe de Asistencias" OnClick="btnInforme1_Click" />

            <asp:Button ID="btnInforme2" runat="server" CssClass="boton-informe"
                Text="Informe de Turnos por Especialidad" OnClick="btnInforme2_Click" />
        </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>

    </form>
</body>
</html>
