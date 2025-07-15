<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informe1.aspx.cs" Inherits="Vistas.Informe1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Informe de Asistencias - Clínica Médica</title>
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
            padding: 20px;
            color: var(--text-color);
            line-height: 1.6;
        }

        .contenedor {
            background-color: white;
            width: 100%;
            max-width: 900px;
            margin: 20px auto;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        h1 {
            font-family: 'Montserrat', sans-serif;
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #fdfdfd;
            border-radius: var(--border-radius);
            border: 1px solid var(--medium-gray);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: var(--dark-gray);
        }

        .form-control {
            width: 100%;
            padding: 10px 12px;
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

        .button-group {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 20px;
            justify-content: center;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #1e6b9e;
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .return-link {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            text-decoration: none;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-weight: 500;
        }

        .return-link:hover {
            background-color: var(--primary-light);
            text-decoration: none;
        }

        /* Resultado styles */
        .resultado {
            margin-top: 30px;
            padding: 20px;
            border-radius: var(--border-radius);
            background-color: #fdfdfd;
            border: 1px solid var(--medium-gray);
        }

        .resultado h3 {
            color: var(--primary-color);
            margin-top: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .resultado ul {
            margin-top: 15px;
            padding-left: 20px;
            list-style-type: none;
        }

        .resultado li {
            margin-bottom: 10px;
            padding: 8px 12px;
            background-color: white;
            border-radius: var(--border-radius);
            border-left: 4px solid var(--medium-gray);
        }

        /* Message styles */
        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: var(--border-radius);
            display: block;
            text-align: center;
        }

        .message-success {
            background-color: #e8f5e9;
            border-left: 4px solid var(--success-color);
            color: #2e7d32;
        }

        .message-error {
            background-color: #ffebee;
            border-left: 4px solid var(--error-color);
            color: #c62828;
        }

        .asistio {
            color: var(--success-color);
            font-weight: bold;
        }

        .ausente {
            color: var(--error-color);
            font-weight: bold;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contenedor {
                padding: 20px 15px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Informe de Asistencias</h1>

            <asp:Label ID="Label1" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="form-section">
                <div class="form-grid">
                    <div class="form-group">
                        <asp:Label ID="lblDesdeFecha" runat="server" Text="Desde:" AssociatedControlID="txtDesdeFecha"></asp:Label>
                        <asp:TextBox ID="txtDesdeFecha" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblHastaFecha" runat="server" Text="Hasta:" AssociatedControlID="txtHastaFecha"></asp:Label>
                        <asp:TextBox ID="txtHastaFecha" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                </div>

                <div class="button-group">
                    <asp:Button ID="btnGenerarInforme" runat="server" Text="Generar Informe" 
                        CssClass="btn btn-primary" OnClick="btnGenerarInforme_Click1" />
                </div>
            </div>

            <div class="resultado">
                <h3>Resultados del Informe</h3>
                <asp:Label ID="lblResultadoInforme" runat="server" />
            </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="return-link">
                ← Volver al Menú Principal
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>