<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="Vistas.ListadoTurnos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Listado de Turnos</title>
    <style type="text/css">
        body {
            font-family: Arial;
            background-color: #f5f5f5;
            padding: 30px;
        }

        .contenedor {
            background-color: white;
            border: 1px solid #ccc;
            padding: 25px;
            width: 80%;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        .gridview {
            margin-top: 20px;
        }

        .boton {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .boton:hover {
            background-color: #2980b9;
        }

        .resultado {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            color: green;
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
        <div class="contenedor">
            <h1>Listado de Turnos del Médico</h1>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </p>

            <div class="form-group">
                <label>Fecha:</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>

                &nbsp;<asp:RequiredFieldValidator ID="RFVfecha" runat="server" ForeColor="Red" 
                    ControlToValidate="TextBox2" ValidationGroup="1">Complete el campo con un fecha</asp:RequiredFieldValidator>
                &nbsp;&nbsp;

                <label>Estado:</label>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

                &nbsp;<asp:RequiredFieldValidator ID="RFVestado" runat="server" 
                    ControlToValidate="DropDownList1" ForeColor="Red" ValidationGroup="1">Ingrese un estado</asp:RequiredFieldValidator>
                &nbsp;&nbsp;

                <asp:Button ID="Button1" runat="server" Text="Filtrar" CssClass="boton" 
                    OnClick="Button1_Click" ValidationGroup="1" />
            </div>

            <div class="gridview">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="IdTurno" OnRowEditing="GridView1_RowEditing"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowUpdating="GridView1_RowUpdating"
                    CssClass="table" GridLines="Both" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <%# Eval("Fecha", "{0:dd/MM/yyyy}") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Hora">
                            <ItemTemplate>
                                <%# Eval("Hora", "{0:hh\\:mm}") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="Paciente" DataField="NombrePaciente" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <%# Eval("Estado") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEstado" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem Text="Presente" Value="Presente" />
                                    <asp:ListItem Text="Ausente" Value="Ausente" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Observaciones">
                            <ItemTemplate>
                                <%# Eval("ObservacionConsulta") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtObservaciones" runat="server" Text='<%# Bind("ObservacionConsulta") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-group">
            </div>

            <asp:Label ID="lblResultado" runat="server" Visible="false" CssClass="resultado"></asp:Label>
        </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuMedico.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>
    </form>
</body>
</html>
