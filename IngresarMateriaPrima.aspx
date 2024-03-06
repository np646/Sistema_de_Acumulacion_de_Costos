﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarMateriaPrima.aspx.cs" Inherits="SAC_Enci_Proyecto.AgregarMateriaPrima" %>

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
    <title>Ingreso de Materia Prima</title>
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
                <div class="menu2 table-responsive">
                    <center>
                        <h2>INGRESAR MATERIA PRIMA</h2>
                    </center>
                    <table class="table table-light table-hover table-borderless">
                        <thead></thead>
                        <tbody>
                            <tr>
                                <td> <label>Código: </label></td>
                                <td><asp:TextBox ID="txtCodigo" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox></td>
                                <td><label>Detalle:</label></td>
                                <td><asp:TextBox ID="txtDetalle" runat="server" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:TextBox></td>
                                <td><label>Proveedor:</label></td>
                                <td><asp:DropDownList ID="ddlProveedor" runat="server" DataSourceID="SqlDataSource1" DataTextField="prv_nombre" DataValueField="prv_id" Class="border-end-0 border-start-0 border-top-0 border-warning"></asp:DropDownList></td>
                                <td><asp:Button ID="btnGuardar" runat="server" Text="Guardar" Class="btn btn-warning" OnClick="btnGuardar_Click" /></td>
                            </tr>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_PROVEEDORTODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                
                        </tbody>
                    </table>     
                    <div class="text-center">
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Class="btn btn-warning" Text="Regresar" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
