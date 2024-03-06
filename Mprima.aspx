<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mprima.aspx.cs" Inherits="SAC_Enci_Proyecto.Mprima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="Images/logo2.png">
    <title>Produccion</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Estilo.css">
    <style type="text/css">
        .auto-style1 {
            text-align: justify
        }
        .auto-style4 {
            width: 134px;
        }
        .auto-style5 {
            width: 134px;
            height: 87px;
        }
        .auto-style6 {
            height: 87px;
        }
        .auto-style7 {
            width: 100px;
            height: 87px;
        }
        .auto-style8 {
            width: auto;
            height: 87px;
        }
    </style>
</head>
<body>
    <div class="auto-style1">
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
            <div class="container-fluid p-3 m-auto mt-4" >
                <div class="menu2">
                    <center><h2>INFORMACIÓN</h2>
                    </center>

                    <table class="table table-light table-hover table-borderless">     
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td class="auto-style5">Código:</td>
                                <td class="auto-style6">
                                    <asp:DropDownList Class="border-end-0 border-start-0 border-top-0 border-warning" ID="ddlMateriaPrima" runat="server" DataSourceID="SqlDataSource1" DataTextField="mpr_codigo" DataValueField="mpr_codigo">
                                    </asp:DropDownList>
                                    <label>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_MATERIAPRIMA" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </label>
                                    <label>
                                    <asp:Button ID="btnBuscarMpr" runat="server" class="btn " OnClick="btnBuscarMpr_Click" Text="🔎" />
                                    </label>
                                </td>

                                <td class="auto-style5">
                                    <label>Detalle:</label>
                                </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtDetalle" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="auto-style8">
                                    <label>ID-RUC:</label>
                                </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtRuc" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="auto-style8">
                                    <label>Proveedor:</label></td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtProveedor" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <label>Cantidad bodega:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCantidadBodega" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    <label>Cantidad:</label></td>
                                <td>
                                    <asp:TextBox ID="txtCantidad" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Costo unitario:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCostoUnitario" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                     </td>
                                <td style="width:auto;">
                                    <label>Fecha:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtFecha" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd" TextMode="Date" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtPrvid" runat="server" Visible="False"></asp:TextBox>
                                    </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtLegrid" runat="server" Visible="False"></asp:TextBox>
                                </td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtMprid" runat="server" Visible="False" Width="130px"></asp:TextBox>
                                </td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                                <td style="width:auto;">
                                    &nbsp;</td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                                <td style="width:auto;">
                                    &nbsp;</td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center mb-3">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" class="btn btn-warning" Text="Regresar" />
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-warning" OnClick="btnIngresar_Click"/>
                        <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" class="btn btn-warning" Text="Guardar" />
                        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" class="btn btn-warning" Text="Cancelar" />
                    </div>

                    <center>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="3" AutoGenerateColumns="False" DataSourceID="BDD_ENCI" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="2" OnRowCommand="GridView1_RowCommand" DataKeyNames="lmp_id" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="lmp_id" HeaderText="ID" SortExpression="lmp_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="lmp_fecha" HeaderText="Fecha" SortExpression="lmp_fecha" />
                            <asp:BoundField DataField="mpr_codigo" HeaderText="Código" SortExpression="mpr_codigo" />
                            <asp:BoundField DataField="mpr_detalle" HeaderText="Detalle" SortExpression="mpr_detalle" />
                            <asp:BoundField DataField="lmp_cantidad" HeaderText="Cantidad" SortExpression="lmp_cantidad" />
                            <asp:BoundField DataField="lmp_cunitario" HeaderText="Costo unitario" SortExpression="lmp_cunitario" />
                            <asp:BoundField DataField="lmp_costototal" HeaderText="Costo total" SortExpression="lmp_costototal" />
                            <asp:BoundField DataField="lmp_total" HeaderText="Total" SortExpression="lmp_total" />
                            <asp:BoundField DataField="lmp_dev" HeaderText="Es devolución" SortExpression="lmp_dev" />
                            <asp:ButtonField ButtonType="Button" CommandName="devolucion" HeaderText="Acción" Text="Devolución" ControlStyle-BackColor="white" ControlStyle-ForeColor="black" ControlStyle-CssClass="border-warning card">
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

                    <asp:SqlDataSource ID="BDD_ENCI" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_LISTAEGRESOMPPOROP" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="oprid" SessionField="oprid" Type="Int32" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                    </center>
                </div>

                

            </div>
        </section>

    </form>
    </div>
</body>
</html>
