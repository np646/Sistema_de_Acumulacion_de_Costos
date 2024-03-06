<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu3.aspx.cs" Inherits="SAC_Enci_Proyecto.Menu3" %>

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
        .auto-style1 {
            color: black;
        }
        .auto-style4 {
            color: black;
            font-size: large;
        }
        </style>
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
        
        <section class="pt-5">
            <div class="mt-5">
                <div class="form-menu">
                    <table style="width:100%;">
                        <tr>
                            <td class="text-center">
                                <asp:ImageButton ID="ibtnRdetalle" runat="server" Height="150px" ImageUrl="~/Images/lupa1.png" Width="150px" OnClick="ibtnRdetalle_Click" />
                                <br /><center><h3 class="auto-style4">Por detalle</h3></center>
                            </td>

                            <td class="text-center">
                                <asp:ImageButton ID="ibtnRTipo" runat="server" Height="150px" ImageUrl="~/Images/lupa2.png" Width="150px" OnClick="ibtnRTipo_Click"/>
                                <br /><center><h3 class="auto-style4">Por tipo</h3></center>
                            </td>

                            <td class="text-center">
                                <asp:ImageButton ID="ibtnBuscarOrden" runat="server" Height="150px" ImageUrl="~/Images/icono100.png" Width="150px" OnClick="ibtnBuscarOrden_Click" />
                                <br /><center><h3 class="auto-style4">Por ordenes en fechas</h3></center>
                            </td>

                            <td class="text-center">
                                <asp:ImageButton ID="ibtnBuscarPedido" runat="server" Height="150px" ImageUrl="~/Images/icono101.png" Width="150px" OnClick="ibtnBuscarPedido_Click" />
                                <br /><center><h3 class="auto-style4">Por pedidos en fechas</h3></center>
                            </td>
                        </tr>

                    </table>
                    <div class="text-center mt-2 p-1">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" class="btn btn-warning" Text="Regresar" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
