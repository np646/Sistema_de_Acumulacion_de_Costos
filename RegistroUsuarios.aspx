<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroUsuarios.aspx.cs" Inherits="SAC_Enci_Proyecto.RegistroUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Usuarios</title>
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
            <br /><br /><br />
            <center>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="goldenrod" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="reg_id" DataSourceID="SqlDataSource1" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="reg_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="reg_id" />
                        <asp:BoundField DataField="usu_nombre" HeaderText="Usuario" SortExpression="usu_nombre" />
                        <asp:BoundField DataField="reg_fechaingreso" HeaderText="Fecha de ingreso" SortExpression="reg_fechaingreso" />
                        <asp:BoundField DataField="reg_fechasalida" HeaderText="Fecha de salida" SortExpression="reg_fechasalida" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_REGISTROS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            </center>
            <br />
            <center>
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar" Class="btn btn-warning" OnClick="btnRegresar_Click" /></center>
            <br />
            <br />
        </section>
         
    </form>
</body>
</html>
