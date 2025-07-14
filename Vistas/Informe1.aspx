<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informe1.aspx.cs" Inherits="Vistas.Informe1" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Informe de Asistencias</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .contenedor {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-row label {
            font-weight: bold;
            width: 30%;
            text-align: right;
            margin-right: 10px;
        }

        .form-row input[type="date"] {
            width: 60%;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .boton-generar {
            text-align: center;
            margin-top: 20px;
        }

        .boton-generar input {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 30px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        .boton-generar input:hover {
            background-color: #27ae60;
        }

        .resultado {
            margin-top: 30px;
            padding: 15px;
            border-radius: 8px;
            background-color: #fdfdfd;
            border: 1px solid #ccc;
        }

        .resultado ul {
            margin-top: 10px;
            padding-left: 20px;
        }

        .resultado li {
            margin-bottom: 6px;
        }

        .mensaje-error {
            color: red;
            font-weight: bold;
        }

        .asistio {
            color: #27ae60;
            font-weight: bold;
        }

        .ausente {
            color: #e74c3c;
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
            <h1>Informe de Asistencias</h1>
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

            <div class="boton-generar">
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