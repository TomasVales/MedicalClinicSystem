<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="Vistas.MenuPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menú Principal</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 300px;
        }

        .auto-style3 {
            height: 80px;
        }

        .auto-style4 {
            width: 500px;
            height: 80px;
        }

        .auto-style5 {
            height: 140px;
        }

        .auto-style6 {
            width: 500px;
            height: 140px;
        }
        .auto-style7 {
            width: 430px;
            height: 80px;
        }
        .auto-style8 {
            width: 430px;
            height: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style4" style="text-align: center">
                    <asp:Label ID="lblTitulo" runat="server" Font-Size="20pt" Text="Menú Principal"></asp:Label><br /><br />
                    <asp:Label ID="lblUsuario" runat="server" Font-Size="12pt" Text="Bienvenido, [Usuario]"></asp:Label><br />
                    <asp:Label ID="lblTipoUsuario" runat="server" Font-Size="12pt" Text="Tipo de usuario: [Administrador/Médico]"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style6" style="text-align: center">
                    <asp:Button ID="btnIrAMenuAdmin" runat="server" Text="Ir al Menú Administrador" Width="220px" /><br /><br />
                    <asp:Button ID="btnIrAMenuMedico" runat="server" Text="Ir al Menú Médico" Width="220px" />
                </td>
                <td class="auto-style5"></td>
            </tr>
        </table>
    </form>
</body>
</html>
