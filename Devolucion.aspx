<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devolucion.aspx.cs" Inherits="SAC_Enci_Proyecto.Devolucion" %>

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
                    <center><h2>DEVOLUCIÓN DESDE PRODUCCIÓN</h2></center> 
                    <asp:TextBox ID="txtMprid" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                    <table class="table table-light table-hover table-borderless">     
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td><label>Código:</label></td>
                                <td><asp:TextBox ID="txtCodigo" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox></td>

                                <td class="auto-style4">
                                    <label>Detalle:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtDetalle" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Proveedor:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtProveedor" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Fecha:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtFecha" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" placeholder="aaaa/mm/dd" TextMode="Date"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <label>Cantidad en OP:</label></td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCantidadOrden" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    <label class="text-center">Cantidad a devolver:</label></td>
                                <td>
                                    <asp:TextBox ID="txtCantidadDevolucion" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox>
                                </td>
                                <td style="width:auto;">
                                    <label>Costo Unitario:</label>
                                </td>
                                <td style="width:100px;">
                                    <asp:TextBox ID="txtCunitario" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning" ReadOnly="True"></asp:TextBox>
                                <td style="width:auto;">
                                    &nbsp;</td>
                                <td style="width:100px;">
                                    &nbsp;</td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <div class="text-center mb-3">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" class="btn btn-warning" Text="Regresar" style="width: 82px" />
                        <asp:Button ID="btnGuardar" runat="server" OnClick="bnGuardar_Click" class="btn btn-warning" Text="Guardar" />
                    </div>
</div>

                

            </div>
        </section>

    </form>
    </div>
</body>
</html>