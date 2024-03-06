<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="SAC_Enci_Proyecto.Compras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Produccion</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>
    <style type="text/css">
        .auto-style1 {
            text-align: justify
        }
    </style>
</head>
<body>
    <div class="auto-style1">
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
            <div class="container-fluid p-3 m-auto mt-4" >
                <div class="menu2">
                    <center><h2>INFORMACIÓN</h2></center> 

                    <table class="table table-light table-hover table-borderless">     
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td style="width:auto;">
                                    <label>Detalle:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtDetalle" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>ID-RUC:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtRuc" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Proveedor:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtProveedor" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    &nbsp;</td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:auto;">
                                    <label>Cantidad:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                &nbsp;</td>
                                <td style="width:auto;">
                                    <label>Costo unitario:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCostoUnitario" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Fecha:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtFecha" TextMode="Date" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd" runat="server"></asp:TextBox>
                                </td>
                                
                                <td style="width:auto;">
                                    &nbsp;</td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:auto;">
                                    <label>Lleva IVA: </label></td>
                                <td style="width:100px;">
                                    <asp:CheckBox ID="cbIVA" runat="server" AutoPostBack="True" OnCheckedChanged="cbIVA_CheckedChanged" Checked="True" />
                                </td>
                                <td style="width:auto;">
                                    <label>IVA:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtIVA" runat="server"  Class="border-end-0 border-start-0 border-top-0 border-warning" OnTextChanged="txtIVA_TextChanged" ReadOnly="True">0</asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <asp:TextBox ID="txtPrvid" runat="server" Visible="False"></asp:TextBox>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtLegrid" runat="server" Visible="False"></asp:TextBox>
                                </td>
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
                    <asp:GridView ID="GridView1" runat="server" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="mpr_id" DataSourceID="BDD_ENCI" BackColor="Goldenrod" BorderColor="White" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="2" OnRowCommand="GridView1_RowCommand" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="mpr_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="mpr_id" />
                            <asp:BoundField DataField="mpr_codigo" HeaderText="Código" SortExpression="mpr_codigo" />
                            <asp:BoundField DataField="mpr_detalle" HeaderText="Detalle" SortExpression="mpr_detalle" />
                            <asp:BoundField DataField="mpr_cunitario" HeaderText="Costo unitario" SortExpression="mpr_cunitario" />
                            <asp:BoundField DataField="prv_ruc" HeaderText="RUC" SortExpression="prv_ruc" />
                            <asp:BoundField DataField="prv_nombre" HeaderText="Nombre" SortExpression="prv_nombre" />
                            <asp:BoundField DataField="prv_autorizacion" HeaderText="Autorización" SortExpression="prv_autorizacion" />
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

                    <asp:SqlDataSource ID="BDD_ENCI" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_MATERIAPRIMAPORID" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="mprid" SessionField="mprid" Type="String" />
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
