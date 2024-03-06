<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="SAC_Enci_Proyecto.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Menu</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>
    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <nav id="superior" class="container-fluid p-3">
            <img src="images/logo2.png" alt="logo"/>
            &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
        </nav>
    </header>
        <section>
            <br /><br /><br /><br />
            <div class="form-menu">
                <center><strong><asp:Label ID="lblBienvenido" runat="server" Text="" CssClass="auto-style5"></asp:Label></strong></center>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="text-center">
                            <asp:ImageButton ID="ibtnRegistro" runat="server" Height="120px" ImageUrl="~/Images/icono1.png" Width="120px" OnClick="ibtnRegistro_Click" />
                            <br /><center>
                            <span style="color: #2f3d4e; font-size:20px;">Registros</span></center></td>

                        <td class="text-center">
                            <asp:ImageButton ID="ibtnIniciar" runat="server" Height="120px" ImageUrl="~/Images/icono2.png" Width="120px" OnClick="ibtnIniciar_Click" />
                            <br />
                            <center>
                                <span style="color: #2f3d4e; font-size:20px;">Ingreso de datos</span>
                            </center></td>

                        <td class="text-center">
                            <asp:ImageButton ID="ibtnVentas" runat="server" Height="120px" ImageUrl="~/Images/icono3.png" Width="120px" OnClick="ibtnVentas_Click" />
                            <br />
                            <center><span style="color: #2f3d4e; font-size:20px;">Reportes</span></center></td>

                        <td class="text-center">
                            <asp:ImageButton ID="ibtnIva" runat="server" Height="120px" ImageUrl="~/Images/icono4.png" Width="120px" OnClick="ibtnIva_Click" />
                            <center><span style="color: #2f3d4e; font-size:20px;">Configurar IVA</span></center></td>
                        <td class="text-center">
                            <asp:ImageButton ID="btnBodega" runat="server" OnClick="btnBodega_Click" Height="120px" Width="120px" ImageUrl="~/Images/bodega.png" />
                            <center><span style="color: #2f3d4e; font-size:20px;">Bodega</span></center></td>
                    </tr>
                </table>
                <br />
                <center><asp:Button class="btn btn-warning" ID="btnCerarSesion" runat="server" Text="Cerrar Sesión" OnClick="btnCerarSesion_Click" /></center>
            </div>
            <br /><br />
            </section>     
    </form>
</body>
</html>
