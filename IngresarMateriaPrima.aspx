<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarMateriaPrima.aspx.cs" Inherits="SAC_Enci_Proyecto.AgregarMateriaPrima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>INGRESAR MATERIA PRIMA</td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Detalle:</td>
                                <td>
                                    <asp:TextBox ID="txtDetalle" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Proveedor:</td>
                                <td>
                                    <asp:DropDownList ID="ddlProveedor" runat="server" DataSourceID="SqlDataSource1" DataTextField="prv_nombre" DataValueField="prv_id">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_PROVEEDORTODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" OnClick="btnRegresar_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
