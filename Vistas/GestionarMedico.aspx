<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarMedico.aspx.cs" Inherits="Vistas.GestionarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <script type="text/javascript">
         function confirmarAgregar() {
             return confirm("¿Seguro que quieres agregar al médico?");
         }
     </script>
    <title></title>
    <style type="text/css">
        body {
    font-family: Arial;
    background-color: #f2f2f2;
    padding: 30px;
}
.contenedor {
    background-color: white;
    padding: 30px;
    width: 105%;
    margin: auto;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
}
h1, h3 {
    text-align: center;
    color: #2c3e50;
}
table.formulario {
    width: 100%;
    border-collapse: separate;
    border-spacing: 10px;
}
td {
    vertical-align: middle;
}
.boton {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 10px 20px;
    font-weight: bold;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
}
.boton:hover {
    background-color: #2980b9;
}
.gridview {
    margin-top: 30px;
}
.gridview table {
    width: 100%;
    border-collapse: collapse;
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
.mensaje {
    color: red;
    text-align: center;
}
.hipervinculo {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-weight: bold;
}
        .auto-style1 {
            height: 29px;
        }
    </style>
   
</head>

     

<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Gestión de Médicos</h1>

            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>

            <table class="formulario">
                <tr>
                    <td><asp:Label Text="Legajo" runat="server" /></td>
                    <td><asp:TextBox ID="txtLegajo" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV1" runat="server" ForeColor="Red" 
                            ControlToValidate="txtLegajo" ValidationGroup="1">Ingrese un legajo</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="DNI" runat="server" /></td>
                    <td><asp:TextBox ID="txtDNI" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV2" runat="server" ForeColor="Red" 
                            ControlToValidate="txtDNI" ValidationGroup="1">Ingrese un DNI</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Nombre" runat="server" /></td>
                    <td><asp:TextBox ID="txtNombre" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV3" runat="server" ForeColor="Red" 
                            ControlToValidate="txtNombre" ValidationGroup="1">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Apellido" runat="server" /></td>
                    <td><asp:TextBox ID="txtApellido" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV4" runat="server" ForeColor="Red" 
                            ControlToValidate="txtApellido" ValidationGroup="1">Ingrese un apellido</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Sexo" runat="server" /></td>
                    <td>
                        <asp:DropDownList ID="ddlSexo" runat="server" Width="200px">
                            <asp:ListItem Text="Seleccione..." Value="" />
                            <asp:ListItem Text="Masculino" Value="Masculino" />
                            <asp:ListItem Text="Femenino" Value="Femenino" />
                            <asp:ListItem Text="Otro" Value="Otro" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFV5" runat="server" ForeColor="Red" 
                            ControlToValidate="ddlSexo" ValidationGroup="1">Ingrese un Sexo</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Nacionalidad" runat="server" /></td>
                    <td><asp:TextBox ID="txtNacionalidad" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV6" runat="server" 
                            ControlToValidate="txtNacionalidad" ForeColor="Red" ValidationGroup="1">Ingrese una nacionalidad</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Fecha de Nacimiento" runat="server" /></td>
                    <td><asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV7" runat="server" 
                            ControlToValidate="txtFechaNacimiento" ForeColor="Red" ValidationGroup="1">Ingrese una fecha de nacimiento</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Dirección" runat="server" /></td>
                    <td><asp:TextBox ID="txtDireccion" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV8" runat="server" 
                            ControlToValidate="txtDireccion" ForeColor="Red" ValidationGroup="1">Ingrese una direccion</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Provincia" runat="server" /></td>
                    <td>
                        <asp:DropDownList ID="ddlProvincia" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged1">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFV9" runat="server" 
                            ControlToValidate="ddlProvincia" ForeColor="Red" ValidationGroup="1">Ingrese una Provincia</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><asp:Label Text="Localidad" runat="server" /></td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV10" runat="server" 
                            ControlToValidate="ddlLocalidad" ForeColor="Red" ValidationGroup="1">Ingrese una Localidad</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Especialidad" runat="server" /></td>
                    <td>
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV11" runat="server" 
                            ControlToValidate="ddlEspecialidad" ForeColor="Red" ValidationGroup="1">Ingrese una Especialidad</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Días Atención" runat="server" /></td>
                    <td>
                        <asp:DropDownList ID="DdlAtencionDias" runat="server" Height="16px" 
                            Width="200px">
                            <asp:ListItem>Seleccione</asp:ListItem>
                            <asp:ListItem>Lunes</asp:ListItem>
                            <asp:ListItem>Martes</asp:ListItem>
                            <asp:ListItem>Miércoles</asp:ListItem>
                            <asp:ListItem>Jueves</asp:ListItem>
                            <asp:ListItem>Viernes</asp:ListItem>
                            <asp:ListItem>Sábado</asp:ListItem>
                            <asp:ListItem>Domingo</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFV12" runat="server" 
                            ControlToValidate="DdlAtencionDias" ForeColor="Red" ValidationGroup="1">Ingrese un dia de atencion</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Horario Atención" runat="server" /></td>
                    <td>
                        <asp:DropDownList ID="ddlHora" runat="server" Height="17px" Width="198px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ddlHora" ForeColor="Red" ValidationGroup="1">Ingrese un horario de atencion</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Email" runat="server" /></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV14" runat="server" 
                            ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="1">Ingrese un email</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Teléfono" runat="server" /></td>
                    <td><asp:TextBox ID="txtTelefono" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV15" runat="server" 
                            ControlToValidate="txtTelefono" ForeColor="Red" ValidationGroup="1">Ingrese un telefono</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Usuario" runat="server" /></td>
                    <td><asp:TextBox ID="txtUsuario" runat="server" Width="200px" />
                        <asp:RequiredFieldValidator ID="RFV16" runat="server" 
                            ControlToValidate="txtUsuario" ForeColor="Red" ValidationGroup="1">Ingrese un Usuario</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label Text="Contraseña" runat="server" /></td>
                    <td><asp:TextBox ID="txtContrasena" runat="server" Width="200px" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RFV17" runat="server" 
                            ControlToValidate="txtContrasena" ForeColor="Red" ValidationGroup="1">Ingrese una contraseña</asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>

            <div class="botones">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="boton" 
    OnClientClick="return confirmarAgregar();" OnClick="btnAgregar_Click" ValidationGroup="1" />
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="boton" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnLIstar" runat="server" Text="Listar" CssClass="boton" OnClick="btnLIstar_Click" />
            </div>

            <hr />
<h3>Filtrar Médicos</h3>
<table>
    <tr>
        <td>Filtrar por Especialidad:</td>
        <td>
            <asp:DropDownList ID="ddlFiltroEspecialidad" runat="server" Width="200px">
                <asp:ListItem Text="Todas" Value="" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Filtrar por Días de Atención:</td>
        <td>
            <asp:TextBox ID="txtFiltroDiasAtencion" runat="server" Width="200px" />
        </td>
    </tr>
    <tr>
        <td>Filtrar por Provincia:</td>
        <td>
            <asp:DropDownList ID="ddlFiltroProvincia" runat="server" Width="200px">
                <asp:ListItem Text="Todas" Value="" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="boton" OnClick="btnFiltrar_Click" />
        </td>
    </tr>
</table>

            <br />
            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" />

            <asp:GridView ID="GridMedicos" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                OnRowEditing="GridMedicos_RowEditing"
                OnRowUpdating="GridMedicos_RowUpdating"
                OnRowCancelingEdit="GridMedicos_RowCancelingEdit"
                OnRowDeleting="GridMedicos_RowDeleting"
                OnRowDataBound="GridMedicos_RowDataBound"
                DataKeyNames="IdMedico" AllowPaging="True" PageSize="5" 
                OnPageIndexChanging="GridMedicos_PageIndexChanging">
                    <Columns>
        <asp:TemplateField HeaderText="Legajo">
            <ItemTemplate><%# Eval("Legajo") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtLegajoEdit" runat="server" Text='<%# Bind("Legajo") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="DNI">
            <ItemTemplate><%# Eval("DNI") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDniEdit" runat="server" Text='<%# Bind("DNI") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Nombre">
            <ItemTemplate><%# Eval("Nombre") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Bind("Nombre") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Apellido">
            <ItemTemplate><%# Eval("Apellido") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtApellidoEdit" runat="server" Text='<%# Bind("Apellido") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sexo">
            <ItemTemplate><%# Eval("Sexo") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlSexoEdit" runat="server">
                    <asp:ListItem Text="Masculino" />
                    <asp:ListItem Text="Femenino" />
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Nacionalidad">
            <ItemTemplate><%# Eval("Nacionalidad") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtNacionalidadEdit" runat="server" Text='<%# Bind("Nacionalidad") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Fecha Nacimiento">
            <ItemTemplate><%# Eval("FechaNacimiento", "{0:dd/MM/yyyy}") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtFechaNacimientoEdit" runat="server" Text='<%# Bind("FechaNacimiento", "{0:yyyy-MM-dd}") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Dirección">
            <ItemTemplate><%# Eval("Direccion") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDireccionEdit" runat="server" Text='<%# Bind("Direccion") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate><%# Eval("CorreoElectronico") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("CorreoElectronico") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Teléfono">
            <ItemTemplate><%# Eval("Telefono") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTelefonoEdit" runat="server" Text='<%# Bind("Telefono") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Provincia">
            <ItemTemplate><%# Eval("Provincia.Nombre") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlProvinciaEdit" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProvinciaEdit_SelectedIndexChanged" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Localidad">
            <ItemTemplate><%# Eval("Localidad.Nombre") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlLocalidadEdit" runat="server" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Especialidad">
            <ItemTemplate><%# Eval("Especialidad.Nombre") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlEspecialidadEdit" runat="server" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Días Atención">
            <ItemTemplate><%# Eval("DiasAtencion") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DdlAtencionDias" runat="server" Height="16px" 
                    Width="200px">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem>Lunes</asp:ListItem>
                    <asp:ListItem>Martes</asp:ListItem>
                    <asp:ListItem>Miércoles</asp:ListItem>
                    <asp:ListItem>Jueves</asp:ListItem>
                    <asp:ListItem>Viernes</asp:ListItem>
                    <asp:ListItem>Sábado</asp:ListItem>
                    <asp:ListItem>Domingo</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Horario Atención">
            <ItemTemplate><%# Eval("HorarioAtencion") %></ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlHora" runat="server" Height="17px" Width="198px">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem>08:00 a 12:00</asp:ListItem>
                    <asp:ListItem>12:00 a 16:00</asp:ListItem>
                    <asp:ListItem>16:00 a 20:00</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Usuario">
            <ItemTemplate><%# Eval("Usuario") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtUsuarioEdit" runat="server" Text='<%# Bind("Usuario") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Contraseña">
    <ItemTemplate>
        ******** 
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtContrasenaEdit" runat="server" Text='<%# Bind("Contrasena") %>' TextMode="Password" />
    </EditItemTemplate>
</asp:TemplateField>
        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
    </Columns>
            </asp:GridView>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="hipervinculo">
                Regresar al Menú
            </asp:HyperLink>
        </div>
    </form>
</body>