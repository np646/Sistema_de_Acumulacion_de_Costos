<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kardex.aspx.cs" Inherits="SAC_Enci_Proyecto.Kardex" %>

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
                    <td colspan="2">KARDEX</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="kar_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="kar_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="kar_id" />
                                            <asp:BoundField DataField="mpr_codigo" HeaderText="Código" SortExpression="mpr_codigo" />
                                            <asp:BoundField DataField="mpr_detalle" HeaderText="Detalle" SortExpression="mpr_detalle" />
                                            <asp:BoundField DataField="kar_fecha" HeaderText="Fecha" SortExpression="kar_fecha" />
                                            <asp:BoundField DataField="kar_descripcion" HeaderText="Descripción" SortExpression="kar_descripcion" />
                                            <asp:BoundField DataField="kar_en_cantidad" HeaderText="Entrada cantidad" SortExpression="kar_en_cantidad" />
                                            <asp:BoundField DataField="kar_en_cunitario" HeaderText="Entrada cunitario" SortExpression="kar_en_cunitario" />
                                            <asp:BoundField DataField="kar_en_ctotal" HeaderText="Entrada ctotal" SortExpression="kar_en_ctotal" />
                                            <asp:BoundField DataField="kar_sa_cantidad" HeaderText="Salida cantidad" SortExpression="kar_sa_cantidad" />
                                            <asp:BoundField DataField="kar_sa_cunitario" HeaderText="Salida cunitario" SortExpression="kar_sa_cunitario" />
                                            <asp:BoundField DataField="kar_sa_ctotal" HeaderText="Salida ctotal" SortExpression="kar_sa_ctotal" />
                                            <asp:BoundField DataField="kar_sd_cantidad" HeaderText="Saldo cantidad" SortExpression="kar_sd_cantidad" />
                                            <asp:BoundField DataField="kar_sd_cunitario" HeaderText="Saldo cunitario" SortExpression="kar_sd_cunitario" />
                                            <asp:BoundField DataField="kar_sd_ctotal" HeaderText="Saldo ctotal" SortExpression="kar_sd_ctotal" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdd_enciConnectionString %>" ProviderName="<%$ ConnectionStrings:bdd_enciConnectionString.ProviderName %>" SelectCommand="SP_SELECT_KARDEXPORMPRID" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="mprid" SessionField="mpridcompra" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Text="Regresar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
