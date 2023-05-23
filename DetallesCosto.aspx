<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesCosto.aspx.cs" Inherits="SAC_Enci_Proyecto.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Reporte por Tipo</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>
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
            <div >
                <div class="table-responsive col-auto mt-4 ms-5 border card rounded">
                    <h3 class="text-center mb-1" style="color:goldenrod;">Primero Agregar un elemento de la tabla, y luego llene los campos</h3>
                    <table class=" p-3 table table-light table-hover table-borderless">
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td><label>Orden de producción</label></td>
                                <td><asp:TextBox ID="txtNumOP" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" ReadOnly="True"></asp:TextBox></td>
                                <td><label>Comentario:</label></td>
                                <td><asp:TextBox ID="txtComentario" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                                <td><asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" class="btn btn-warning"/></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="mb-3">
                        <center><asp:Button ID="btnRegresar" runat="server" class="btn btn-warning" OnClick="btnRegresar_Click" Text="Regresar" /></center>
                    </div>
                </div>
                <div class="mb-5 col-auto mt-4 ms-5 rounded">
                    <div class="mt-4">
                        <center>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="legr_id,opr_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="text-align: center" BackColor="goldenrod" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="legr_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="legr_id" Visible="False" />
                                    <asp:BoundField DataField="opr_id" HeaderText="Orden de producción" InsertVisible="False" ReadOnly="True" SortExpression="opr_id" />
                                    <asp:BoundField DataField="cop_comentario" HeaderText="Comentario" SortExpression="cop_comentario" />
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
                            <br />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="opr_id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="opr_id" HeaderText="OP" InsertVisible="False" ReadOnly="True" SortExpression="opr_id" />
                                    <asp:BoundField DataField="itm_id" HeaderText="itm_id" SortExpression="itm_id" Visible="False" />
                                    <asp:BoundField DataField="pro_detalle" HeaderText="Detalle" SortExpression="pro_detalle" />
                                    <asp:BoundField DataField="itm_cantidad" HeaderText="Cantidad" SortExpression="itm_cantidad" />
                                    <asp:BoundField DataField="itm_fecha" HeaderText="Fecha" SortExpression="itm_fecha" />
                                    <asp:BoundField DataField="pro_pvp" HeaderText="PVP" SortExpression="pro_pvp" />
                                    <asp:BoundField DataField="itm_numpedido" HeaderText="Pedido" SortExpression="itm_numpedido" />
                                    <asp:ButtonField CommandName="Select" HeaderText="Seleccionar" Text="Agregar" ButtonType="Button"
                                        ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_ORDENESPRODUCCION" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </center>
                    </div>
                    <div class="mt-4">
                        <center>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_COSTOPORORDEN" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="legrid" SessionField="legrid" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </center>
                    </div>
                </div>
            </div>
        </section>

    </form>
</body>
</html>
