<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestionar Pacientes.aspx.cs" Inherits="Vistas.Gestionar_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Gestionar Pacientes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }

        .contenedor {
            background-color: white;
            width: 80%;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 10px;
        }

        td {
            padding: 5px;
        }

        label {
            font-weight: bold;
        }

        .botones {
            text-align: center;
            margin-top: 20px;
        }

        .botones asp\:Button {
            margin: 5px;
        }

        .gridview {
            margin-top: 30px;
        }

        .gridview table {
            width: 100%;
            border: 1px solid #ccc;
        }

        .gridview th {
            background-color: #3498db;
            color: white;
            padding: 10px;
        }

        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .boton {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
        }

        .boton:hover {
            background-color: #2980b9;
        }

        .hipervinculo {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-weight: bold;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-group label {
            width: 40%;
        }

        .form-group input, .form-group select {
            width: 60%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Gestión de Pacientes</h1>

            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>

            <table>
                <tr>
    <td><asp:Label ID="lblDNI" runat="server" Text="DNI"></asp:Label></td>
    <td>
        <asp:TextBox ID="TxtDNI" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" 
            ControlToValidate="TxtDNI" ErrorMessage="* DNI obligatorio" ForeColor="Red" 
            Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtNombre" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
            ControlToValidate="txtNombre" ErrorMessage="* Nombre obligatorio" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtApellido" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" 
            ControlToValidate="txtApellido" ErrorMessage="* Apellido obligatorio" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label></td>
    <td>
        <asp:DropDownList ID="ddlSexo" runat="server" Width="200px">
            <asp:ListItem Text="Seleccione..." Value="" />
            <asp:ListItem Text="Masculino" Value="Masculino" />
            <asp:ListItem Text="Femenino" Value="Femenino" />
            <asp:ListItem Text="Otro" Value="Otro" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" 
            ControlToValidate="ddlSexo" InitialValue="" ErrorMessage="* Sexo obligatorio" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtNacionalidad" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" 
            ControlToValidate="txtNacionalidad" ErrorMessage="* Nacionalidad obligatoria" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="LblFechaDeNacimiento" runat="server" Text="Fecha de Nacimiento"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" 
            ControlToValidate="txtFechaNacimiento" ErrorMessage="* Fecha obligatoria" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="LblDireccion" runat="server" Text="Dirección"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtDireccion" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" 
            ControlToValidate="txtDireccion" ErrorMessage="* Dirección obligatoria" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label></td>
    <td>
        <asp:DropDownList ID="ddlProvincia" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
            <asp:ListItem Text="Seleccione..." Value="" />
            
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" 
            ControlToValidate="ddlProvincia" InitialValue="" 
            ErrorMessage="* Provincia obligatoria" ForeColor="Red" Display="Dynamic" 
            ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label></td>
    <td>
        <asp:DropDownList ID="ddlLocalidad" runat="server" Width="200px">
            <asp:ListItem Text="Seleccione..." Value="" />
            
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" 
            ControlToValidate="ddlLocalidad" InitialValue="" 
            ErrorMessage="* Localidad obligatoria" ForeColor="Red" Display="Dynamic" 
            ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="LblEmail" runat="server" Text="Email"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtEmail" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="* Email obligatorio" ForeColor="Red" 
            Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
<tr>
    <td><asp:Label ID="lbltelefono" runat="server" Text="Teléfono"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtTelefono" runat="server" Width="200px" />
        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
            ControlToValidate="txtTelefono" ErrorMessage="* Teléfono obligatorio" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
    </td>
</tr>
            </table>

            <div class="botones">
                <asp:Button ID="btAgregar" runat="server" Text="Agregar" CssClass="boton" 
    OnClick="btAgregar_Click" ValidationGroup="1"
    OnClientClick="return confirm('¿Estás seguro que querés agregar este paciente?');" />
                <asp:Button ID="btnLIstar" runat="server" Text="Listado" CssClass="boton" OnClick="btnLIstar_Click" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="resultado"></asp:Label>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>

            <hr />
            <h3>Filtrar Pacientes</h3>
<table>
    <tr>
        <td><label>Buscar por Nombre / Apellido / DNI:</label></td>
        <td><asp:TextBox ID="txtBuscar" runat="server" Width="200px" /></td>
    </tr>
    <tr>
        <td><label>Filtrar por Sexo:</label></td>
        <td>
            <asp:DropDownList ID="ddlFiltroSexo" runat="server" Width="200px">
                <asp:ListItem Text="Todos" Value="" />
                <asp:ListItem Text="Masculino" Value="Masculino" />
                <asp:ListItem Text="Femenino" Value="Femenino" />
                <asp:ListItem Text="Otro" Value="Otro" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td><label>Filtrar por Provincia:</label></td>
        <td>
            <asp:DropDownList ID="ddlFiltroProvincia" runat="server" Width="200px">
                <asp:ListItem Text="Todas" Value="" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
            <asp:Button ID="btnBuscarFiltrar" runat="server" CssClass="boton" 
                Text="Filtrar" OnClick="btnBuscarFiltrar_Click" ValidationGroup="2" />
        </td>
    </tr>
</table>

            <div class="gridview">
                <asp:GridView ID="GridPacientes" runat="server" AutoGenerateColumns="False"
                    OnRowEditing="GridPacientes_RowEditing"
                    OnRowUpdating="GridPacientes_RowUpdating"
                    OnRowCancelingEdit="GridPacientes_RowCancelingEdit"
                    OnRowDeleting="GridPacientes_RowDeleting"
                    AutoGenerateEditButton="True"
                    AutoGenerateDeleteButton="True"
                    AllowPaging="True"
                    PageSize="5"
                    OnRowDataBound="GridPacientes_RowDataBound" 
                    OnPageIndexChanging="GridPacientes_PageIndexChanging">
                        <Columns>
        <asp:TemplateField HeaderText="DNI">
            <ItemTemplate>
                <asp:Label ID="lblDNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Nombre">
            <ItemTemplate>
                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Apellido">
            <ItemTemplate>
                <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtApellidoEdit" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sexo">
            <ItemTemplate>
                <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtSexoEdit" runat="server" Text='<%# Bind("Sexo") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Nacionalidad">
            <ItemTemplate>
                <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtNacionalidadEdit" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Fecha Nac.">
            <ItemTemplate>
                <asp:Label ID="lblFechaNac" runat="server" Text='<%# Eval("FechaNacimiento", "{0:yyyy-MM-dd}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Direccion">
            <ItemTemplate>
                <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDireccionEdit" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Provincia">
        <ItemTemplate>
             <asp:Label ID="lblProvincia" runat="server" Text='<%# Bind("Provincia.Nombre") %>'></asp:Label>
        </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlProvinciaEdit" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlProvinciaEdit_SelectedIndexChanged">
            </asp:DropDownList>
         </EditItemTemplate>
        </asp:TemplateField>

<asp:TemplateField HeaderText="Localidad">
    <ItemTemplate>
        <asp:Label ID="lblLocalidad" runat="server" Text='<%# Bind("Localidad.Nombre") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:DropDownList ID="ddlLocalidadEdit" runat="server">
        </asp:DropDownList>
    </EditItemTemplate>
</asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("CorreoElectronico") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("CorreoElectronico") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Telefono">
            <ItemTemplate>
                <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTelefonoEdit" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        
       
    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>