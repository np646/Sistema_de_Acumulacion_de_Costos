<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerProveedores.aspx.cs" Inherits="SAC_Enci_Proyecto.VerProveedores" %>

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
    <title>Proveedores registrados</title>
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
                        <h2>LISTA DE PROVEEDORES</h2>
                    </center>
                    <div class="mt-4 mb-5">
                        <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="prv_id" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="prv_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="prv_id" />
                                <asp:BoundField DataField="prv_ruc" HeaderText="RUC" SortExpression="prv_ruc" />
                                <asp:BoundField DataField="prv_autorizacion" HeaderText="Autorización" SortExpression="prv_autorizacion" />
                                <asp:BoundField DataField="prv_nombre" HeaderText="Nombre" SortExpression="prv_nombre" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_PROVEEDORTODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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