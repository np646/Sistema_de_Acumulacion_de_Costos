<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orden.aspx.cs" Inherits="SAC_Enci_Proyecto.Orden" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Inicio</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Estilo.css"/>


    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }

        .auto-style7 {
        }

        .auto-style8 {
            width: 467px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="barra">

                <nav id="superior" class="container-fluid p-3">
                    <img src="images/logo2.png" alt="logo">
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

            <div class="menu3">
                <center>
                    <h3>ORDEN DE PRODUCCIÓN</h3>
                </center>
                <table class="table table-light table-hover table-borderless">
                    <thead></thead>
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <label>Fecha de expedición de la orden:</label>
                                <asp:TextBox ID="txtFechaExpeOrden" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td colspan="1">
                                <label>Número:</label>
                                <asp:TextBox ID="txtNumeroOP" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <label style="color: goldenrod">Datos sobre el producto a fabricar:</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <label>Producto:</label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="txtProducto" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td></td>
                            <td class="auto-style7">
                                <label>Cantidad:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantidad" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <label>Fecha de pnicio:</label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="txtFechaInicio" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td></td>
                            <td class="auto-style7">
                                <label>Fecha de culminación:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaFin" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <label>Numero de pedido:</label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="txtNumPedido" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="text-center mt-3 mb-3">
                    <center>
                        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="legr_id" DataSourceID="SqlDataSource1" CellSpacing="2" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="legr_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="legr_id" />
                                <asp:BoundField DataField="legr_fecha" HeaderText="Fecha" SortExpression="legr_fecha" />
                                <asp:BoundField DataField="egr_detalle" HeaderText="Detalle" SortExpression="egr_detalle" />
                                <asp:BoundField DataField="prv_ruc" HeaderText="Identificación" SortExpression="prv_ruc" />
                                <asp:BoundField DataField="prv_autorizacion" HeaderText="Autorización" SortExpression="prv_autorizacion" />
                                <asp:BoundField DataField="prv_nombre" HeaderText="Proveedor" SortExpression="prv_nombre" />
                                <asp:BoundField DataField="egr_clasificacion" HeaderText="Tipo" SortExpression="egr_clasificacion" />
                                <asp:BoundField DataField="egr_cantidad" HeaderText="Cantidad" SortExpression="egr_cantidad" />
                                <asp:BoundField DataField="egr_costounitario" HeaderText="Costo unitario" SortExpression="egr_costounitario" />
                                <asp:BoundField DataField="egr_costototal" HeaderText="Costo total" SortExpression="egr_costototal" />
                                <asp:BoundField DataField="iva_valor" HeaderText="IVA" SortExpression="iva_valor" />
                                <asp:BoundField DataField="egr_total" HeaderText="Total" SortExpression="egr_total" />
                            </Columns>
                            <FooterStyle BackColor="goldenrod" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="goldenrod" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F8F9FA" ForeColor="black" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </center>

                </div>

                <div class="mt-2" style="display: flex">
                    <div class="me-5 mb-2 p-3">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="goldenrod" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="egr_clasificacion" HeaderText="Clasificación" SortExpression="egr_clasificacion" />
                                <asp:BoundField DataField="egr_total" HeaderText="Total" SortExpression="egr_total" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="goldenrod" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_COSTOEGRESOPOROP" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtNumeroOP" Name="oprid" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="ms-5 mb-2 p-3">
                        <table class="table table-light table-hover table-borderless">

                            <tr>
                                <td>
                                    <label>MP: </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMP" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox></td>
                                <td>
                                    <label>MO: </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMO" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox></td>
                                <td>
                                    <label>CIF: </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCIF" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Total:</label></td>
                                <td>
                                    <asp:TextBox ID="txtTotal" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Costo de producción unitario: </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCunitario" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" ReadOnly="True">0</asp:TextBox></td>
                            </tr>

                        </table>
                        
                        
                    </div>
                    
                </div>

                <div class="text-center mb-3">
                    <asp:Button ID="btnAgregarMP" Class="btn btn-warning" runat="server" OnClick="btnAgregarMP_Click" Text="Modificar contenidos" />
                    <asp:Button ID="btnImprimir" Class="btn btn-warning" runat="server" OnClick="btnImprimir_Click" Text="Imprimir" />
                </div>

                <div class="text-center">
                    <asp:Button ID="btnRegresar" Class="btn btn-warning" runat="server" OnClick="btnRegresar_Click" Text="Regresar" />
                </div>

            </div>

            <div class="container-fluid text-center mb-2">
            <center>

                

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_LISTAEGRESOPOROP" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNumeroOP" Name="oprid" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </center>
            </div>

        </section>

    </form>
</body>
</html>
