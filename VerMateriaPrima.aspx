<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerMateriaPrima.aspx.cs" Inherits="SAC_Enci_Proyecto.VerMateriaPrima" %>

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
                    <td colspan="2">MATERIA PRIMA EN BODEGA</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="mpr_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="mpr_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="mpr_id" />
                                <asp:BoundField DataField="mpr_codigo" HeaderText="Código" SortExpression="mpr_codigo" />
                                <asp:BoundField DataField="mpr_detalle" HeaderText="Detalle" SortExpression="mpr_detalle" />
                                <asp:BoundField DataField="prv_nombre" HeaderText="Nombre" SortExpression="prv_nombre" />
                                <asp:ButtonField ButtonType="Button" CommandName="kardex" HeaderText="KARDEX" Text="Seleccionar" />
                                <asp:ButtonField ButtonType="Button" CommandName="comprar" HeaderText="Comprar" Text="Seleccionar" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_MATERIAPRIMA" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" style="height: 26px" Text="Regresar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
