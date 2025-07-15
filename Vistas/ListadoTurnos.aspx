<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="Vistas.ListadoTurnos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de Turnos - Clínica Médica</title>
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

        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #fdfdfd;
            border-radius: var(--border-radius);
            border: 1px solid var(--medium-gray);
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
            align-items: flex-end;
        }

        .form-group {
            margin-bottom: 15px;
            flex: 1;
            min-width: 200px;
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

        .info-label {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
            color: var(--dark-gray);
            padding: 10px;
            background-color: var(--primary-light);
            border-radius: var(--border-radius);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contenedor {
                padding: 20px 15px;
            }
            
            .form-row {
                flex-direction: column;
            }
            
            .form-group {
                min-width: 100%;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
    <script type="text/javascript">
        function confirmarActualizacion() {
            return confirm("¿Está seguro que desea actualizar este turno?");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Listado de Turnos del Médico</h1>
            
            <asp:Label ID="Label1" runat="server" CssClass="info-label"></asp:Label>

            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha" AssociatedControlID="txtFecha"></asp:Label>
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVfecha" runat="server" 
                            ControlToValidate="txtFecha" ErrorMessage="La fecha es obligatoria" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="Filtrar"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado" AssociatedControlID="ddlEstado"></asp:Label>
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVestado" runat="server" 
                            ControlToValidate="ddlEstado" ErrorMessage="El estado es obligatorio" 
                            CssClass="error-message" Display="Dynamic" ValidationGroup="Filtrar"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-primary" 
                            OnClick="Button1_Click" ValidationGroup="Filtrar" />
                    </div>
                </div>
            </div>

            <div class="grid-container">
                <asp:Label ID="lblResultado" runat="server" Visible="false" CssClass="message"></asp:Label>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="IdTurno" OnRowEditing="GridView1_RowEditing"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowUpdating="GridView1_RowUpdating"
                    CssClass="gridview" GridLines="None" Width="100%"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <%# Eval("Fecha", "{0:dd/MM/yyyy}") %>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Hora">
                            <ItemTemplate>
                                <%# Eval("Hora", "{0:hh\\:mm}") %>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="Paciente" DataField="NombrePaciente" ReadOnly="true">
                            <ItemStyle Width="20%" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <%# Eval("Estado") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEstado" runat="server" SelectedValue='<%# Bind("Estado") %>' CssClass="form-control">
                                    <asp:ListItem Text="Presente" Value="Presente" />
                                    <asp:ListItem Text="Ausente" Value="Ausente" />
                                    <asp:ListItem Text="Cancelado" Value="Cancelado" />
                                    <asp:ListItem Text="Completado" Value="Completado" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Width="12%" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Observaciones">
                            <ItemTemplate>
                                <%# Eval("ObservacionConsulta") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtObservaciones" runat="server" Text='<%# Bind("ObservacionConsulta") %>' 
                                    TextMode="MultiLine" Rows="2" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="30%" />
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" EditText="Editar" UpdateText="Guardar" CancelText="Cancelar"
                            ButtonType="Link" ControlStyle-CssClass="btn btn-secondary" ItemStyle-Width="20%">
                            <ControlStyle CssClass="btn btn-secondary"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:HyperLink ID="hplRegresarUnMenu" runat="server" NavigateUrl="~/MenuMedico.aspx" CssClass="return-link">
                ← Volver al Menú
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>