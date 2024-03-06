<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerMateriaPrima.aspx.cs" Inherits="SAC_Enci_Proyecto.VerMateriaPrima" %>

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
    <title>Materia prima en bodega</title>
</head>
<body>

    <form id="form1" runat="server">

        <header>
            <div id="barra">
                 <nav id="superior" class="container-fluid p-3">
                    <img src="images/logo2.png" alt="logo" />
                        &nbsp;&nbsp;
                    <p class="auto-style1">
                        <strong>Sistema de Acumulaci&oacute;n de Costos</strong>
                    </p>
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
                <div style="margin-left:50vh;" class="menu4 text-center">
                    <center>
                        <h2>MATERIA PRIMA EN BODEGA</h2>
                    </center>
                    <div class="mt-4 mb-4">
                        <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="mpr_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="mpr_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="mpr_id" />
                                <asp:BoundField DataField="mpr_codigo" HeaderText="Código" SortExpression="mpr_codigo" />
                                <asp:BoundField DataField="mpr_detalle" HeaderText="Detalle" SortExpression="mpr_detalle" />
                                <asp:BoundField DataField="prv_nombre" HeaderText="Nombre" SortExpression="prv_nombre" />
                                <asp:ButtonField ButtonType="Button" CommandName="kardex" HeaderText="KARDEX" Text="Ver Kardex" 
                                    ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
                                    <ControlStyle BackColor="White" CssClass="border-warning card" ForeColor="Black"></ControlStyle>
                                    </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" CommandName="comprar" HeaderText="Comprar" Text="Comprar" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
                                    <ControlStyle BackColor="White" CssClass="border-warning card" ForeColor="Black"></ControlStyle>
                                    </asp:ButtonField>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_MATERIAPRIMA" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </center></div>
                    <div class="text-center">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Class="btn btn-warning" Text="Regresar" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
