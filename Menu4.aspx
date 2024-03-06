<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu4.aspx.cs" Inherits="SAC_Enci_Proyecto.Menu4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Images/logo2.png" />
    <title>Menu</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/Estilo.css" />
    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav id="superior" class="container-fluid p-3">
                <img src="images/logo2.png" alt="logo" />
                &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
            </nav>
        </header>
        <section>
            <br />
            <br />
            <br />
            <br />
            <div class="form-menu">
                <center><strong>
                    <asp:Label ID="lblBienvenido" runat="server" Text="" CssClass="auto-style5"></asp:Label></strong></center>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="text-center">
                            <asp:ImageButton ID="btnIngresarPrv" runat="server" Height="120px" ImageUrl="~/Images/ingresoProv.png" Width="120px" OnClick="btnIngresarPrv_Click" />
                            <center>
                                <span style="color: #2f3d4e; font-size: 20px;">Ingresar nuevo proveedor</span>
                            </center>
                        </td>
                        <td class="text-center">
                            <asp:ImageButton ID="btnIngresarMprima" runat="server" Height="120px" ImageUrl="~/Images/mprima.png" Width="120px" OnClick="btnIngresarMprima_Click"  />
                            <center>
                                <span style="color: #2f3d4e; font-size: 20px;">Ingresar nueva materia prima</span>
                            </center>
                            
                        </td>
                        <td class="text-center">
                            <asp:ImageButton ID="btnVerPrv" runat="server" Height="120px" ImageUrl="~/Images/verProv.png" Width="120px" OnClick="btnVerPrv_Click" />
                            <center>
                                <span style="color: #2f3d4e; font-size: 20px;">Ver proveedores</span>
                            </center>
                            
                        </td>
                        <td class="text-center">
                            <asp:ImageButton ID="btnVerMPrima" runat="server" Height="120px" ImageUrl="~/Images/lupa1.png" Width="120px" OnClick="btnVerMPrima_Click"/>
                            <center>
                                <span style="color: #2f3d4e; font-size: 20px;">Ver materia prima</span>
                            </center>
                            
                        </td>
                    </tr>
                </table>
                <div class="text-center mt-4 p-1">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" class="btn btn-warning" Text="Regresar" />
                    </div>
            </div>
        </section>
    </form>
</body>
</html>

