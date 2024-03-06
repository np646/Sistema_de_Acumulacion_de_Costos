<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="SAC_Enci_Proyecto.Cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Images/logo2.png" />
    

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/Estilo.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: justify
        }
    </style>
    <title>Cliente</title>
</head>
<body>
        <form id="form1" runat="server">
            <header>
                <div id="barra">

                    <nav id="superior" class="container-fluid p-3">
                        <img src="images/logo2.png" alt="logo" />
                        &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
                    </nav>
                    <nav id="superiorder" class="container-fluid p-3">
                        <ul id="navegacion2">
                            <li id="nav-link">
                                <a id="lista" href="Menu.aspx">Men&uacute;</a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </header>
            <section>
                <div class="container-fluid p-3 m-auto mt-4">
                    <div class="menu2 table-responsive">
                        <center>
                            <h2>DATOS DEL CLIENTE</h2>
                        </center>
                        <table class="table table-light table-hover table-borderless">
                            <thead></thead>
                            <tbody>
                                <tr>
                                    <td> <label>Identificación: </label></td>
                                    <td><asp:TextBox ID="txtIdentificacion" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox></td>
                                    <td><label>Nombre:</label></td>
                                    <td><asp:TextBox ID="txtNombre" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox></td>
                                    <td><asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click1" Class="btn btn-warning" Text="Ingresar nuevo cliente" /><br /></td>
                                </tr>
                                <tr>
                                <td><label>Seleccione la fecha del pedido:</label></td>
                                <td><asp:TextBox  TextMode="Date" ID="txtFecha" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd"></asp:TextBox></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>
                            </tbody>
                        </table>       
                        <asp:TextBox ID="txtCliid" runat="server" Visible="false"></asp:TextBox>
                    &nbsp;
                         <div class="text-center mb-3">
                             <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Class="btn btn-warning" Text="Guardar" Visible="False" />
                             </div>
                        <br />
                    </div>
                    <div class="mt-3 justify-content-center" style="display:flex">
                        <div class="col-auto text-center table-responsive " style="margin:1% 3% 2% 3%;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="cli_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="text-align: center" CellSpacing="2" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="cli_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="cli_id" />
                                    <asp:BoundField DataField="cli_identificacion" HeaderText="Identificación" SortExpression="cli_identificacion" />
                                    <asp:BoundField DataField="cli_nombre" HeaderText="Nombre" SortExpression="cli_nombre" />
                                    <asp:BoundField DataField="cli_estado" HeaderText="Estado" SortExpression="cli_estado" Visible="False" />
                                    <asp:ButtonField CommandName="generar" Text="Generar pedido" ButtonType="Button" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
                                    <asp:ButtonField ButtonType="Button" CommandName="eliminar" Text="Eliminar" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
                                    <asp:ButtonField ButtonType="Button" CommandName="editar" Text="Editar" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="goldenrod" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F8F9FA" ForeColor="black" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_CLIENTES" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </section>
        </form>
</body>
</html>
