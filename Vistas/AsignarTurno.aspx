<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignarTurno.aspx.cs" Inherits="Vistas.AsignarTurno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asignar Turno - Clínica Médica</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet" />
    <style type="text/css">
        /* Estilos base */
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
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        /* Contenedor principal */
        .form-container {
            width: 100%;
            max-width: 580px;
            background-color: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin: 20px 0;
            position: relative;
            overflow: hidden;
        }

        /* Encabezado con efecto de acuarela */
        .form-header {
            position: relative;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--medium-gray);
        }

        .form-header::before {
            content: "";
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-light) 0%, rgba(255,255,255,0) 70%);
            z-index: 0;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
        }

        .form-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 24px;
            font-weight: 500;
            color: var(--primary-color);
            text-align: center;
            margin: 0;
            position: relative;
        }

        .user-welcome {
            text-align: center;
            font-size: 14px;
            color: var(--dark-gray);
            margin-top: 8px;
            font-weight: 400;
            position: relative;
        }

        /* Tabla de formulario */
        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 18px;
        }

        /* Celdas */
        .label-cell {
            text-align: right;
            padding-right: 15px;
            vertical-align: middle;
            font-weight: 500;
            color: var(--dark-gray);
            width: 35%;
            white-space: nowrap;
        }

        .input-cell {
            padding: 0;
            position: relative;
        }

        /* Controles de formulario */
        .drop-down,
        .text-box {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--medium-gray);
            border-radius: var(--border-radius);
            font-size: 14px;
            transition: var(--transition);
            background-color: white;
            font-family: 'Roboto', sans-serif;
            color: var(--text-color);
        }

        .drop-down:focus,
        .text-box:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(42, 127, 186, 0.2);
        }

        /* Validación */
        .error-message {
            color: var(--error-color);
            font-size: 12px;
            margin-top: 6px;
            display: block;
            position: absolute;
            bottom: -18px;
            left: 0;
        }

        input:invalid, select:invalid {
            border-color: #ffdddd;
        }

        /* Botones */
        .button-container {
            margin-top: 25px;
            text-align: center;
        }

        .submit-button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 15px;
            font-weight: 500;
            transition: var(--transition);
            width: 100%;
            max-width: 300px;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-family: 'Montserrat', sans-serif;
        }

        .submit-button:hover {
            background-color: #1e6b9e;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .submit-button:active {
            transform: translateY(0);
        }

        /* Hipervínculo */
        .return-link {
            display: inline-block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: var(--primary-color);
            transition: var(--transition);
            font-size: 14px;
            padding: 8px 15px;
            border-radius: var(--border-radius);
            border: 1px solid var(--primary-color);
            background-color: white;
        }

        .return-link:hover {
            background-color: var(--primary-light);
            color: #1e6b9e;
            text-decoration: none;
        }

        /* Mensaje de error general */
        .global-error {
            color: var(--error-color);
            background-color: #fdf3f3;
            padding: 12px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            border-left: 4px solid var(--error-color);
            font-size: 14px;
            display: none;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-container {
                padding: 25px 20px;
            }
            
            .label-cell {
                text-align: left;
                padding-right: 0;
                width: auto;
                display: block;
                margin-bottom: 5px;
            }
            
            .input-cell {
                display: block;
                width: 100%;
            }
            
            .form-table {
                border-spacing: 0 12px;
            }
            
            tr {
                display: block;
                margin-bottom: 15px;
            }
            
            td {
                display: block;
                width: 100%;
            }
            
            .error-message {
                position: static;
                margin-top: 5px;
            }
        }

        /* Efecto de carga */
        @keyframes pulse {
            0% { opacity: 0.6; }
            50% { opacity: 1; }
            100% { opacity: 0.6; }
        }

        .loading {
            animation: pulse 1.5s infinite ease-in-out;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="form-header">
                <h1 class="form-title">Asignación de Turnos</h1>
                <div class="user-welcome">
                    <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                </div>
            </div>
            
            <asp:Label ID="lblError" runat="server" CssClass="global-error" Visible="false"></asp:Label>
            
            <table class="form-table">
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="drop-down" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="0" ErrorMessage="Seleccione una especialidad" CssClass="error-message" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblMedico" runat="server" Text="Médico:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="drop-down" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico" InitialValue="" ErrorMessage="Seleccione un médico" CssClass="error-message" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblPaciente" runat="server" Text="Paciente:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="drop-down" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="ddlPaciente" InitialValue="0" ErrorMessage="Seleccione un paciente" CssClass="error-message" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="text-box" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Seleccione una fecha" CssClass="error-message" Display="Dynamic" />
                        <asp:CompareValidator ID="cvFecha" runat="server" ControlToValidate="txtFecha" Operator="GreaterThanEqual" Type="Date" ErrorMessage="La fecha debe ser hoy o posterior" CssClass="error-message" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblHora" runat="server" Text="Hora:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlHora" runat="server" CssClass="drop-down" AutoPostBack="True">
                            <asp:ListItem Text="08:00" Value="08:00" />
                            <asp:ListItem Text="09:00" Value="09:00" />
                            <asp:ListItem Text="10:00" Value="10:00" />
                            <asp:ListItem Text="11:00" Value="11:00" />
                            <asp:ListItem Text="12:00" Value="12:00" />
                            <asp:ListItem Text="13:00" Value="13:00" />
                            <asp:ListItem Text="14:00" Value="14:00" />
                            <asp:ListItem Text="15:00" Value="15:00" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHora" InitialValue="" ErrorMessage="Seleccione un horario" CssClass="error-message" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <asp:Button ID="btnAsignar" runat="server" Text="Asignar Turno" CssClass="submit-button"
                            OnClick="btnAsignar_Click" 
                            OnClientClick="return confirm('¿Está seguro que desea asignar este turno?');" />
                    </td>
                </tr>
            </table>
            
            <div style="text-align: center; margin-top: 25px;">
                <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="return-link">
                    ← Volver al Menú Principal
                </asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>