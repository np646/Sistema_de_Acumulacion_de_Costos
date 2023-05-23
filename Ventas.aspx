<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="SAC_Enci_Proyecto.Ventas" %>

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
            <div class="mt-3 justify-content-center" style="display:flex">
                <div class="col-auto mb-3 border card border mt-5 ms-5  p-3 bg-body rounded">
                    <h2 class="text-center mb-3">Reporte de egresos por tipo</h2>
                    <table style="width:100%">
                        <tbody>
                            <tr style="height:auto">
                                <td><label style="font-weight:600; color:goldenrod;">Fecha de inicio: </label></td>
                                <td><asp:TextBox ID="txtFechaInicio" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd" runat="server" TextMode="Date" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><br /> </td>
                            </tr>
                            <tr>
                                <td><label style="font-weight:600; color:goldenrod;">Fecha de finalización: </label></td>
                                <td><asp:TextBox ID="txtFechaFinalizacion" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd" runat="server" TextMode="Date"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><br /> </td>
                            </tr>
                            <tr>
                                <td><label style="font-weight:600; color:goldenrod;">Clasificación: </label></td>
                                <td>
                                    <asp:DropDownList ID="ddlTipo" runat="server" Width="70%">
                                        <asp:ListItem Value="MP">Materia prima directa</asp:ListItem>
                                        <asp:ListItem Value="MO">Mano de obra directa</asp:ListItem>
                                        <asp:ListItem Value="CIF">Costos indirectos de fabricación</asp:ListItem>
                                        <asp:ListItem Value="GA">Gastos administrativos</asp:ListItem>
                                        <asp:ListItem Value="GV">Gastos de ventas</asp:ListItem>
                                        <asp:ListItem Value="GF">Gastos financieros</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><br /> </td>
                            </tr>
                            <tr>
                                <td><label style="font-weight:600; color:goldenrod;">Total por rango de fechas:</label></td>
                                <td><asp:TextBox ID="txtTotal" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox></td>
                            </tr>
                            </tbody>
                    </table>
                        
                    <br /><br />
                    <div class="text-center mb-3">
                        <asp:Button ID="btnMostrarV" runat="server" Text="Mostrar" Class="btn btn-warning" OnClick="btnMostrarV_Click" />
                        <asp:Button ID="btnExcel" runat="server" OnClick="btnExcel_Click" Class="btn btn-warning" Text="Exportar a Excel" />
                        <asp:Button ID="btnImprimir" runat="server" Class="btn btn-warning" Text="Imprimir" />
                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" Class="btn btn-warning" OnClick="btnRegresar_Click" />
                    </div>
                    
                </div>
                <div class="col-auto mb-3 mt-5 ms-5 p-2">
                    <center>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="legr_id" DataSourceID="SqlDataSource2" BackColor="goldenrod" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="legr_id" HeaderText=" # " InsertVisible="False" ReadOnly="True" SortExpression="legr_id" />
                                <asp:BoundField DataField="egr_total" HeaderText=" Total " SortExpression="egr_total" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_REPORTEGASTOS" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtFechaInicio" Name="inicio" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtFechaFinalizacion" Name="fin" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlTipo" Name="clasificacion" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </div>
            </div>
        </section>  
    </form>
</body>
</html>
