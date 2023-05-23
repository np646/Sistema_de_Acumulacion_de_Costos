using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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

            DataSet dsDatos = datos.selectOPporItemID(Int32.Parse(itemid));



            txtNumeroOP.Text = oprnum = dsDatos.Tables[0].Rows[0]["opr_id"].ToString();
            txtFechaExpeOrden.Text = dsDatos.Tables[0].Rows[0]["itm_fecha"].ToString();
            txtProducto.Text = dsDatos.Tables[0].Rows[0]["pro_detalle"].ToString();
            txtFechaInicio.Text = dsDatos.Tables[0].Rows[0]["itm_fechainicio"].ToString();
            txtFechaFin.Text = dsDatos.Tables[0].Rows[0]["itm_fechafinalizacion"].ToString();
            txtNumPedido.Text = dsDatos.Tables[0].Rows[0]["itm_numpedido"].ToString();
            txtCantidad.Text = dsDatos.Tables[0].Rows[0]["itm_cantidad"].ToString();

            GridView1.DataBind();
            DataSet dsDatos2 = datos.selectTotalPorOP(Int32.Parse(txtNumeroOP.Text));
            if (!String.IsNullOrEmpty(dsDatos2.Tables[0].Rows[0]["suma"].ToString()))
            {

                txtTotal.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
                dsDatos2 = datos.selectCUnitarioOP(Double.Parse(txtTotal.Text), Int32.Parse(txtCantidad.Text));

                double resultado = Double.Parse(txtTotal.Text) / Int32.Parse(txtCantidad.Text);
                resultado = Math.Round(resultado, 2);
                //txtCunitario.Text = dsDatos2.Tables[0].Rows[0]["cunitario"].ToString();
                txtCunitario.Text = resultado.ToString();
                dsDatos2 = datos.updateOP(Int32.Parse(txtNumeroOP.Text), Double.Parse(txtTotal.Text), Double.Parse(txtCunitario.Text));

                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "MP");
                txtMP.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "MO");
                txtMO.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
                dsDatos2 = datos.selectCostoEgresoPorTipo(Int32.Parse(txtNumeroOP.Text), "CIF");
                txtCIF.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
            }

            GridView2.DataBind();

        }



        protected void btnAgregarMP_Click(object sender, EventArgs e)
        {
            Session["oprid"] = oprnum;
            Response.Redirect("Mprima.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {

            Response.Redirect("Pedidos.aspx");
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
    }
}