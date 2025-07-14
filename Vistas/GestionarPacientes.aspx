<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarPacientes.aspx.cs" Inherits="Vistas.Gestionar_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 18%;
            margin-left: 291px;
            margin-right: 0px;
        }
        .auto-style2 {
            width: 170px;
        }
        .auto-style3 {
            width: 117px;
        }
        .auto-style4 {
            width: 170px;
            height: 26px;
        }
        .auto-style5 {
            width: 117px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 279px; margin-left: 312px">
            <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="20pt" Text="Gestion De Pacientes"></asp:Label>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="TxtDNI" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlSexo" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="124px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNacionalidad" runat="server" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LblFechaDeNacimiento" runat="server" Text="Fecha De Nacimiento"></asp:Label>
                </td>
                <td class="auto-style3">
                   <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LblDireccion" runat="server" Text="Direccion"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" Height="16px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="124px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbltelefono" runat="server" Text="Telefono"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btAgregar" runat="server" Text="Agregar" Width="59px" />
&nbsp;
        <asp:Button ID="btBuscar" runat="server" Text="Buscar" />
&nbsp;
        <asp:Button ID="btModificar" runat="server" Text="Modificar" />
&nbsp;
        <asp:Button ID="btEliminar" runat="server" OnClick="btEliminar_Click" Text="Eliminar" Width="69px" />
&nbsp;<p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
