<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerOrdenes.aspx.cs" Inherits="SAC_Enci_Proyecto.VerOrdenes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Ordenes de Producción</title>
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
            <div class="mt-3 justify-content-center" style="display: flex">
                <div class="col-auto mb-3 border card border mt-5 ms-5 p-2 rounded">
                    <h2 class="text-center mb-3" style="color: goldenrod;">ÓRDENES DE PRODUCCIÓN</h2>
                    <center>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="opr_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" CellSpacing="2" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="opr_id" HeaderText="Orden" InsertVisible="False" ReadOnly="True" SortExpression="opr_id" />
                                <asp:BoundField DataField="itm_id" HeaderText="Item" SortExpression="itm_id" />
                                <asp:BoundField DataField="pro_detalle" HeaderText="Detalle" SortExpression="pro_detalle" />
                                <asp:BoundField DataField="itm_cantidad" HeaderText="Cantidad" SortExpression="itm_cantidad" />
                                <asp:BoundField DataField="itm_fecha" HeaderText="Fecha" SortExpression="itm_fecha" />
                                <asp:BoundField DataField="pro_pvp" HeaderText="PVP" SortExpression="pro_pvp" />
                                <asp:BoundField DataField="itm_fechainicio" HeaderText="Fecha inicio" SortExpression="itm_fechainicio" />
                                <asp:BoundField DataField="itm_fechafinalizacion" HeaderText="Fecha fin" SortExpression="itm_fechafinalizacion" />
                                <asp:BoundField DataField="itm_numpedido" HeaderText="Pedido" SortExpression="itm_numpedido" />
                                <asp:ButtonField ButtonType="Button" CommandName="ver" Text="Ver orden" 
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_ORDENESPRODUCCION" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="btnRegresar" Class="btn btn-warning" runat="server" OnClick="btnRegresar_Click" Text="Regresar" />
                    </center>
                </div>
                </div>
        </section>
        
    </form>
</body>
</html>
