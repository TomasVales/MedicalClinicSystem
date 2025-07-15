<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestionar Pacientes.aspx.cs" Inherits="Vistas.Gestionar_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gestión de Pacientes - Clínica Médica</title>
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
            max-width: 1200px;
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

        h3 {
            color: var(--primary-color);
            margin-top: 30px;
            padding-bottom: 10px;
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

        .error-message {
            color: var(--error-color);
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        .button-group {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 20px;
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

        .btn-secondary {
            background-color: var(--medium-gray);
            color: var(--dark-gray);
        }

        .btn-secondary:hover {
            background-color: #d1d7dc;
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

        /* GridView Styles */
        .grid-container {
            overflow-x: auto;
            margin-top: 30px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .gridview th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 500;
        }

        .gridview td {
            padding: 10px 15px;
            border-bottom: 1px solid var(--medium-gray);
            vertical-align: middle;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: var(--primary-light);
        }

        .gridview .pager {
            margin-top: 15px;
        }

        .gridview .pager a {
            padding: 5px 10px;
            margin: 0 3px;
            border: 1px solid var(--medium-gray);
            border-radius: 3px;
            text-decoration: none;
            color: var(--primary-color);
        }

        .gridview .pager span {
            padding: 5px 10px;
            margin: 0 3px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 3px;
        }

        /* Edit mode styles */
        .gridview .edit-mode input,
        .gridview .edit-mode select {
            width: 100%;
            padding: 6px;
            border: 1px solid var(--medium-gray);
            border-radius: 3px;
        }

        /* Message styles */
        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: var(--border-radius);
            display: none;
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

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contenedor {
                padding: 20px 15px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Gestión de Pacientes</h1>

            <asp:Label ID="lblMensaje" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="form-section">
                <h3>Datos del Paciente</h3>
                
                <div class="form-grid">
                    <div class="form-group">
                        <asp:Label ID="lblDNI" runat="server" Text="DNI" AssociatedControlID="TxtDNI"></asp:Label>
                        <asp:TextBox ID="TxtDNI" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" 
                            ControlToValidate="TxtDNI" ErrorMessage="DNI es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre" AssociatedControlID="txtNombre"></asp:Label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                            ControlToValidate="txtNombre" ErrorMessage="Nombre es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido" AssociatedControlID="txtApellido"></asp:Label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" 
                            ControlToValidate="txtApellido" ErrorMessage="Apellido es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo" AssociatedControlID="ddlSexo"></asp:Label>
                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione..." Value="" />
                            <asp:ListItem Text="Masculino" Value="Masculino" />
                            <asp:ListItem Text="Femenino" Value="Femenino" />
                            <asp:ListItem Text="Otro" Value="Otro" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" 
                            ControlToValidate="ddlSexo" InitialValue="" ErrorMessage="Sexo es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad" AssociatedControlID="txtNacionalidad"></asp:Label>
                        <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" 
                            ControlToValidate="txtNacionalidad" ErrorMessage="Nacionalidad es obligatoria" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LblFechaDeNacimiento" runat="server" Text="Fecha de Nacimiento" AssociatedControlID="txtFechaNacimiento"></asp:Label>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" 
                            ControlToValidate="txtFechaNacimiento" ErrorMessage="Fecha es obligatoria" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LblDireccion" runat="server" Text="Dirección" AssociatedControlID="txtDireccion"></asp:Label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" 
                            ControlToValidate="txtDireccion" ErrorMessage="Dirección es obligatoria" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia" AssociatedControlID="ddlProvincia"></asp:Label>
                        <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" 
                            AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione..." Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" 
                            ControlToValidate="ddlProvincia" InitialValue="" 
                            ErrorMessage="Provincia es obligatoria" CssClass="error-message" 
                            Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" AssociatedControlID="ddlLocalidad"></asp:Label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione..." Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" 
                            ControlToValidate="ddlLocalidad" InitialValue="" 
                            ErrorMessage="Localidad es obligatoria" CssClass="error-message" 
                            Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Email es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Formato de email inválido"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lbltelefono" runat="server" Text="Teléfono" AssociatedControlID="txtTelefono"></asp:Label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
                            ControlToValidate="txtTelefono" ErrorMessage="Teléfono es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="1" />
                    </div>
                </div>

                <div class="button-group">
                    <asp:Button ID="btAgregar" runat="server" Text="Agregar Paciente" CssClass="btn btn-primary" 
                        OnClick="btAgregar_Click" ValidationGroup="1"
                        OnClientClick="return confirm('¿Está seguro que desea agregar este paciente?');" />
                    <asp:Button ID="btnLIstar" runat="server" Text="Mostrar Listado" CssClass="btn btn-secondary" OnClick="btnLIstar_Click" />
                </div>
            </div>

            <div class="form-section">
                <h3>Filtrar Pacientes</h3>
                
                <div class="form-grid">
                    <div class="form-group">
                        <asp:Label ID="lblBuscar" runat="server" Text="Buscar por Nombre/Apellido/DNI" AssociatedControlID="txtBuscar"></asp:Label>
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Ingrese criterio de búsqueda" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblFiltroSexo" runat="server" Text="Filtrar por Sexo" AssociatedControlID="ddlFiltroSexo"></asp:Label>
                        <asp:DropDownList ID="ddlFiltroSexo" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todos" Value="" />
                            <asp:ListItem Text="Masculino" Value="Masculino" />
                            <asp:ListItem Text="Femenino" Value="Femenino" />
                            <asp:ListItem Text="Otro" Value="Otro" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblFiltroProvincia" runat="server" Text="Filtrar por Provincia" AssociatedControlID="ddlFiltroProvincia"></asp:Label>
                        <asp:DropDownList ID="ddlFiltroProvincia" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todas" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="button-group">
                    <asp:Button ID="btnBuscarFiltrar" runat="server" CssClass="btn btn-primary" 
                        Text="Aplicar Filtros" OnClick="btnBuscarFiltrar_Click" ValidationGroup="2" />
                </div>
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridPacientes" runat="server" AutoGenerateColumns="False"
                    OnRowEditing="GridPacientes_RowEditing"
                    OnRowUpdating="GridPacientes_RowUpdating"
                    OnRowCancelingEdit="GridPacientes_RowCancelingEdit"
                    OnRowDeleting="GridPacientes_RowDeleting"
                    AutoGenerateEditButton="False"
                    AutoGenerateDeleteButton="False"
                    AllowPaging="True"
                    PageSize="5"
                    OnRowDataBound="GridPacientes_RowDataBound" 
                    OnPageIndexChanging="GridPacientes_PageIndexChanging"
                    CssClass="gridview"
                    PagerStyle-CssClass="pager"
                    RowStyle-CssClass="row"
                    AlternatingRowStyle-CssClass="alt-row"
                    EditRowStyle-CssClass="edit-mode">
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
                                <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtApellidoEdit" runat="server" Text='<%# Bind("Apellido") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sexo">
                            <ItemTemplate>
                                <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSexoEdit" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Masculino" Value="Masculino" />
                                    <asp:ListItem Text="Femenino" Value="Femenino" />
                                    <asp:ListItem Text="Otro" Value="Otro" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nacionalidad">
                            <ItemTemplate>
                                <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNacionalidadEdit" runat="server" Text='<%# Bind("Nacionalidad") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha Nac.">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaNac" runat="server" Text='<%# Eval("FechaNacimiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Dirección">
                            <ItemTemplate>
                                <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDireccionEdit" runat="server" Text='<%# Bind("Direccion") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:Label ID="lblProvincia" runat="server" Text='<%# Bind("Provincia.Nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlProvinciaEdit" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlProvinciaEdit_SelectedIndexChanged">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate>
                                <asp:Label ID="lblLocalidad" runat="server" Text='<%# Bind("Localidad.Nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLocalidadEdit" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("CorreoElectronico") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("CorreoElectronico") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Teléfono">
                            <ItemTemplate>
                                <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTelefonoEdit" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Editar" UpdateText="Guardar" CancelText="Cancelar" 
                            ControlStyle-CssClass="btn btn-secondary" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Eliminar" 
                            ControlStyle-CssClass="btn btn-secondary" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuAdmin.aspx" CssClass="return-link">
                ← Volver al Menú Principal
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>