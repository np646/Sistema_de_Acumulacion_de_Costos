<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerPedidos.aspx.cs" Inherits="SAC_Enci_Proyecto.VerPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Todos los Pedidos</title>
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

        <div class="text-center mt-5">
            <center>
            <div class="mb-1">
                <asp:Button ID="btnRegresar" runat="server" Class="btn btn-warning" OnClick="btnRegresar_Click" Text="Regresar" />
            </div>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="itm_id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="itm_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="itm_id" />
                    <asp:BoundField DataField="cli_nombre" HeaderText="Cliente" SortExpression="cli_nombre" Visible="False" />
                    <asp:BoundField DataField="cli_identificacion" HeaderText="Identificación" SortExpression="cli_identificacion" Visible="False" />
                    <asp:BoundField DataField="itm_cantidad" HeaderText="Cantidad" SortExpression="itm_cantidad" />
                    <asp:BoundField DataField="pro_detalle" HeaderText="Detalle" SortExpression="pro_detalle" />
                    <asp:BoundField DataField="pro_pvp" HeaderText="PVP" SortExpression="pro_pvp" />
                    <asp:BoundField DataField="itm_fechainicio" HeaderText="Fecha inicio" SortExpression="itm_fechainicio" />
                    <asp:BoundField DataField="itm_fechafinalizacion" HeaderText="Fecha fin" SortExpression="itm_fechafinalizacion" />
                    <asp:BoundField DataField="itm_numpedido" HeaderText="Pedido" SortExpression="itm_numpedido" />
                    <asp:BoundField DataField="itm_descripcion" HeaderText="Descripción" SortExpression="itm_descripcion" />
                    <asp:ButtonField CommandName="Select" HeaderText="Orden de producción" Text="Ver" 
                        ButtonType="Button" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ped_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="2" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ped_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="ped_id" />
                    <asp:BoundField DataField="cli_nombre" HeaderText="Cliente" SortExpression="cli_nombre" />
                    <asp:BoundField DataField="cli_identificacion" HeaderText="Identificación" SortExpression="cli_identificacion" />
                    <asp:BoundField DataField="ped_fecha" HeaderText="Fecha" SortExpression="ped_fecha" />
                    <asp:ButtonField CommandName="seleccionar" Text="Seleccionar" ButtonType="Button" 
                        ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card"/>
                    <asp:ButtonField ButtonType="Button" CommandName="ir" Text="Ir" 
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
            </asp:GridView>&nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_PEDIDOSTODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_ITEMPORPEDIDO" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="pedid" SessionField="pedidoid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                <br />
                

                </center>
            <br />
            </div>
    </form>
</body>
</html>
