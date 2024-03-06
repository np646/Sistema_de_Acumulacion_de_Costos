<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="SAC_Enci_Proyecto.Pedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Pedidos</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>
    <style type="text/css">
        .auto-style4 {
            width: auto;
            height: 25px;
        }
        .auto-style5 {
            width: 80px;
            height: 25px;
        }
        .auto-style6 {
            text-align: left;
            width: 79px;
        }
        .auto-style7 {
            width: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div id="barra">

            <nav id="superior" class="container-fluid p-3">
            <img src="images/logo2.png" alt="logo"/>
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
            <div class="container-fluid p-2 m-auto">
                <div class="menu2">
                    <center>
                        <h2>INFORMACIÓN</h2>
                    </center>

                    <table class="table table-light table-hover table-borderless">
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td style="width:auto;">
                                    <label>Cliente:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtCliente" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>ID-RUC:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtIdentificacion" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Cantidad:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtCantidad" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Producto:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtProducto" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:auto;">
                                    <label>Precio PVP:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtPVP" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Fecha ingreso:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtFechaIngreso" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" TextMode="Date"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Fecha salida:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtFechaSalida" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" TextMode="Date"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Número pedido:</label>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtNumPedido" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <label>Descripción:</label></td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtDescripcion" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width:auto;">
                                    <asp:TextBox ID="txtItmid" runat="server" Visible="False"></asp:TextBox>
                                </td>
                                <td style="width:80px;">
                                    <asp:TextBox ID="txtProid" runat="server" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Text="Regresar" class="btn btn-warning"/>
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-warning" OnClick="btnIngresar_Click" />
                        <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" class="btn btn-warning"/>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" class="btn btn-warning"/>
                    </div>

                    <center>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="itm_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="2" OnRowCommand="GridView1_RowCommand" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="itm_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="itm_id" />
                                <asp:BoundField DataField="cli_nombre" HeaderText="Cliente" SortExpression="cli_nombre" />
                                <asp:BoundField DataField="cli_identificacion" HeaderText="ID-RUC" SortExpression="cli_identificacion" />
                                <asp:BoundField DataField="itm_cantidad" HeaderText="Cantidad" SortExpression="itm_cantidad" />
                                <asp:BoundField DataField="pro_detalle" HeaderText="Producto" SortExpression="pro_detalle" />
                                <asp:BoundField DataField="pro_pvp" HeaderText="PVP" SortExpression="pro_pvp" />
                                <asp:BoundField DataField="itm_fechainicio" HeaderText="Inicio" SortExpression="itm_fechainicio" />
                                <asp:BoundField DataField="itm_fechafinalizacion" HeaderText="Fin" SortExpression="itm_fechafinalizacion" />
                                <asp:BoundField DataField="itm_numpedido" HeaderText="Pedido" SortExpression="itm_numpedido" />
                                <asp:BoundField DataField="itm_descripcion" HeaderText="Descripción" SortExpression="itm_descripcion" />
                                <asp:BoundField DataField="itm_total" HeaderText="Total" SortExpression="itm_total" />
                                <asp:ButtonField ButtonType="Button" CommandName="ver" Text="Hoja de costos" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
<ControlStyle BackColor="White" CssClass="border-warning card" ForeColor="Black"></ControlStyle>
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" CommandName="editar" Text="Editar" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
<ControlStyle BackColor="White" CssClass="border-warning card" ForeColor="Black"></ControlStyle>
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" CommandName="eliminar" Text="Eliminar" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
<ControlStyle BackColor="White" CssClass="border-warning card" ForeColor="Black"></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F8F9FA" ForeColor="black" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_ITEMPORPEDIDO" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="pedid" SessionField="ultimopedidoid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <br />
                        <br />

                    </center>

                        <table class="w-100">
                            <tr>
                                <td class="auto-style6"><label>TOTAL:</label></td>

                    <center>
                                <td class="text-start">
                                    <em>
                                    <asp:TextBox ID="txtTotal" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                    </em>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            
                        </table>

                        <br />

                    </center>
                </div>
                
            </div>
        </section>
    </form>
</body>
</html>
