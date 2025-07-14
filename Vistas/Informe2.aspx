<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informe2.aspx.cs" Inherits="Vistas.Informe2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Informe de Turnos por Especialidad</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        .contenedor {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-row label {
            width: 30%;
            text-align: right;
            margin-right: 10px;
        }

        .form-row input {
            width: 60%;
            padding: 5px;
        }

        .boton-informe {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .boton-informe input {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 30px;
            border-radius: 5px;
            cursor: pointer;
        }

        .boton-informe input:hover {
            background-color: #2980b9;
        }

        .resultado {
            margin-top: 30px;
            text-align: center;
        }

        .resultado table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .resultado th, .resultado td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .resultado th {
            background-color: #f2f2f2;
        }

        .mensaje-error {
            color: red;
            font-weight: bold;
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
            <h1>Informe de Turnos por Especialidad</h1>
            <p>

            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>

            </p>

            <div class="form-row">
                <label for="txtDesdeFecha">Desde:</label>
                <asp:TextBox ID="txtDesdeFecha" runat="server" TextMode="Date" />
            </div>

            <div class="form-row">
                <label for="txtHastaFecha">Hasta:</label>
                <asp:TextBox ID="txtHastaFecha" runat="server" TextMode="Date" />
            </div>

            <div class="boton-informe">
                <asp:Button ID="btnGenerarInforme" runat="server" Text="Generar Informe" OnClick="btnGenerarInforme_Click1" />
            </div>

            <div class="resultado">
                <asp:Label ID="lblResultadoInforme" runat="server" />
            </div>
        </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>

    </form>
</body>
</html>
