<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigurarIVA.aspx.cs" Inherits="SAC_Enci_Proyecto.ConfigurarIVA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Configurar Iva</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav id="superior" class="container-fluid p-3">
                <img src="images/logo2.png" alt="logo">
                &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
            </nav>
        </header>
        <section>
            <div class="mt-3 justify-content-center" style="display: flex">
                <div class="col-auto mb-3 text-center border card border mt-5 ms-5 shadow p-3 bg-body rounded">
                    <h2 class="text-center mb-3">IVA</h2>
                    <table style="width:100%">
                        <tbody>
                            <tr>
                                <td><label style="font-weight:600; color:goldenrod;">Valor acutal: </label></td>
                                <td><asp:TextBox ID="txtIVAActual" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><br /> </td>
                            </tr>
                            <tr>
                                <td><label style="font-weight:600; color:goldenrod;">Nuevo valor: </label></td>
                                <td><asp:TextBox ID="txtNuevoIVA" Class="border-end-0 border-start-0 border-top-0 border-warning" runat="server" ></asp:TextBox></td>
                            </tr>
                            </tbody>
                        </table>

                    <div class="text-center mt-4">
                        <asp:Button ID="btnRegresar" runat="server" Class="btn btn-warning" OnClick="btnRegresar_Click" Text="Regresar" />
                         <asp:Button ID="btnCambiar" runat="server" Class="btn btn-warning" OnClick="btnCambiar_Click" Text="Cambiar" />
                    </div>
                </div>
                <div class=" mb-3 mt-5 ms-3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="iva_id" DataSourceID="SqlDataSource1" BackColor="goldenrod" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="iva_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="iva_id" />
                                <asp:BoundField DataField="iva_valor" HeaderText="Valor" SortExpression="iva_valor" />
                                <asp:BoundField DataField="iva_fecha" HeaderText="Fecha" SortExpression="iva_fecha" />
                                <asp:BoundField DataField="iva_estado" HeaderText="iva_estado" SortExpression="iva_estado" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_IVAHISTORIAL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    
                </div>          
        </div>
        </section>
        
    </form>
</body>
</html>
