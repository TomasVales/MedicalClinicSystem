<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignarTurno.aspx.cs" Inherits="Vistas.AsignarTurno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asignar Turno</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        
        .form-container {
            width: 500px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .form-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eaeaea;
        }
        
        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        
        .label-cell {
            text-align: right;
            padding-right: 15px;
            vertical-align: middle;
            font-weight: 500;
            color: #555;
        }
        
        .input-cell {
            padding: 8px 0;
        }
        
        .drop-down, .text-box {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        
        .drop-down:focus, .text-box:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
            display: block;
        }
        
        .submit-button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.3s;
            width: 120px;
        }
        
        .submit-button:hover {
            background-color: #2980b9;
        }
        
        .button-container {
            text-align: right;
            margin-top: 20px;
        }
    .hipervinculo {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-weight: bold;
}
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <asp:Label ID="lblTitulo" runat="server" CssClass="form-title" Text="Asignación de Turnos"></asp:Label>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <table class="form-table">
                <tr>
            <td class="label-cell">
                 <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
             </td>
                 <td class="input-cell">
                 <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="drop-down" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                 </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" InitialValue="0" ErrorMessage="Seleccione una especialidad" CssClass="error-message" />
                 </td>
                </tr>
                    <td class="label-cell">
                        <asp:Label ID="lblMedico" runat="server" Text="Médico:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="drop-down" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator  ID="rfvMedico" runat="server" ControlToValidate="ddlMedico" InitialValue="" ErrorMessage="Seleccione un médico" CssClass="error-message" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblPaciente" runat="server" Text="Paciente:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="drop-down" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="ddlPaciente" InitialValue="0" ErrorMessage="Seleccione un paciente" CssClass="error-message" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha:"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="text-box" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Seleccione una fecha" CssClass="error-message" />

                        <asp:CompareValidator ID="cvFecha" runat="server"  ControlToValidate="txtFecha" Operator="GreaterThanEqual"  Type="Date"  ErrorMessage="Elija fecha de hoy u otro día"  CssClass="error-message" />
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
                        <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHora" InitialValue="" ErrorMessage="Elija un horario"  CssClass="error-message" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <asp:Button ID="btnAsignar" runat="server" Text="Asignar Turno"   CssClass="submit-button"
                                
                                OnClick="btnAsignar_Click" 
                                  OnClientClick="return confirm('¿Estás seguro que deseas asignar este turno?');" />

                    </td>
                </tr>
            </table>
        </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>
    </form>
</body>
</html>