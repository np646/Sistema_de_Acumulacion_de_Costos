using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace SAC_Enci_Proyecto
{
    public partial class Orden : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string oprnum = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string ultimopedidoid = Session["ultimopedidoid"].ToString();
            string itemid = Session["itemid"].ToString();
            txtNumPedido.Text = ultimopedidoid;
            txtProducto.Text = itemid;

            GridView1.Visible = false;
            GridView3.Visible = false;
            btnAgregarMP.Visible = false;
            btnAgregarEgresos.Visible = false;

            DataSet dsDatos = datos.selectOPporItemID(Int32.Parse(itemid));

            txtNumeroOP.Text = oprnum = dsDatos.Tables[0].Rows[0]["opr_id"].ToString();
            txtFechaExpeOrden.Text = dsDatos.Tables[0].Rows[0]["itm_fecha"].ToString();
            txtProducto.Text = dsDatos.Tables[0].Rows[0]["pro_detalle"].ToString();
            txtFechaInicio.Text = dsDatos.Tables[0].Rows[0]["itm_fechainicio"].ToString();
            txtFechaFin.Text = dsDatos.Tables[0].Rows[0]["itm_fechafinalizacion"].ToString();
            txtNumPedido.Text = dsDatos.Tables[0].Rows[0]["itm_numpedido"].ToString();
            txtCantidad.Text = dsDatos.Tables[0].Rows[0]["itm_cantidad"].ToString();

            GridView1.DataBind();
            GridView3.DataBind();

            DataSet dsDatos2 = datos.selectTotalPorOP(Int32.Parse(txtNumeroOP.Text));
            DataSet dsDatos3 = datos.selectTotalPorMPOP(Int32.Parse(txtNumeroOP.Text));

            double totalegr, totalmpr;
            if (!String.IsNullOrEmpty(dsDatos2.Tables[0].Rows[0]["suma"].ToString()))
            {
                totalegr = Double.Parse(dsDatos2.Tables[0].Rows[0]["suma"].ToString());
            }
            else
            {
                totalegr = 0;
            }

            if (!String.IsNullOrEmpty(dsDatos3.Tables[0].Rows[0]["suma"].ToString()))
            {
                totalmpr = Double.Parse(dsDatos3.Tables[0].Rows[0]["suma"].ToString());
            }
            else
            {
                totalmpr = 0;
            }
               txtTotal.Text = (totalegr + totalmpr).ToString();
                dsDatos2 = datos.selectCUnitarioOP(Double.Parse(txtTotal.Text), Int32.Parse(txtCantidad.Text));
                double resultado = Double.Parse(txtTotal.Text) / Int32.Parse(txtCantidad.Text);
                resultado = Math.Round(resultado, 2);
                txtCunitario.Text = resultado.ToString();
                dsDatos2 = datos.updateOP(Int32.Parse(txtNumeroOP.Text), Double.Parse(txtTotal.Text), Double.Parse(txtCunitario.Text));
                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "MP");
                txtMP.Text = dsDatos3.Tables[0].Rows[0]["suma"].ToString();
                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "MO");
                txtMO.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "CIF");
                txtCIF.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            if (Session["pedido"] == null)
            {
                Response.Redirect("Menu2.aspx");
            }
            else {
                Response.Redirect("Pedidos.aspx");
            }
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            string popupScript = "<script language='javascript'>" +
                "window.print('cobros.aspx', 'CustomPopUp', " +
                "'width=850, height=350, menubar=no,scrollbars=yes, resizable=yes')" +
                "</script>";
            Page.RegisterStartupScript("PopupScript", popupScript);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAgregarMP_Click1(object sender, EventArgs e)
        {
            Session["oprid"] = oprnum;
            Response.Redirect("Mprima.aspx");
        }


        protected void btnAgregarEgresos_Click(object sender, EventArgs e)
        {
            Session["oprid"] = oprnum;
            Response.Redirect("Egresos.aspx");
        }

        protected void btnVerTotal_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView3.Visible = false;
            btnAgregarMP.Visible = false;
            btnAgregarEgresos.Visible = false;
        }

        protected void btnMateriaPrima_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView3.Visible = true;
            btnAgregarMP.Visible = true;
            btnAgregarEgresos.Visible = false;
        }

        protected void btnEgresos_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView3.Visible = false;
            btnAgregarMP.Visible = false;
            btnAgregarEgresos.Visible = true;
        }

        protected void txtFechaExpeOrden_TextChanged(object sender, EventArgs e)
        {
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // para cambiar el color de una fila si es devolución
            for (int i = 0; i < GridView3.Rows.Count; i++)
            {
                // int esdevolucion = Convert.ToInt32(GridView1.Rows[i].Cells[8].Text);
                if (GridView3.Rows[i].Cells[8].Text == "SI")
                {
                    GridView3.Rows[i].BackColor = Color.Silver;
                }
            }
        }
    }
}