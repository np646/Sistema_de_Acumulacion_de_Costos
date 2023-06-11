<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerProveedores.aspx.cs" Inherits="SAC_Enci_Proyecto.VerProveedores" %>

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
                    <td>LISTA DE PROVEEDORES</td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="prv_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="prv_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="prv_id" />
                                            <asp:BoundField DataField="prv_ruc" HeaderText="RUC" SortExpression="prv_ruc" />
                                            <asp:BoundField DataField="prv_autorizacion" HeaderText="Autorización" SortExpression="prv_autorizacion" />
                                            <asp:BoundField DataField="prv_nombre" HeaderText="Nombre" SortExpression="prv_nombre" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_PROVEEDORTODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" OnClick="btnRegresar_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
