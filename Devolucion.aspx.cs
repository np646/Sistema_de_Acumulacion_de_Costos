using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Devolucion : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string oprid = "";
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {
            oprid = Session["oprid"].ToString();
            if (!string.IsNullOrEmpty(Session["lmpid"].ToString()))
            {
                DataSet dsDatos = datos.selectListaEgresosMPPorID(Int32.Parse(Session["lmpid"].ToString()));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtDetalle.Text = dsDatos.Tables[0].Rows[0]["mpr_detalle"].ToString();
                    txtCodigo.Text = dsDatos.Tables[0].Rows[0]["mpr_codigo"].ToString();
                    txtMprid.Text = dsDatos.Tables[0].Rows[0]["mpr_id"].ToString();
                    txtProveedor.Text = dsDatos.Tables[0].Rows[0]["prv_nombre"].ToString();
                    txtCantidadOrden.Text = dsDatos.Tables[0].Rows[0]["lmp_cantidad"].ToString();
                    txtCunitario.Text = dsDatos.Tables[0].Rows[0]["lmp_cunitario"].ToString();
                }
            }
        }

        protected void bnGuardar_Click(object sender, EventArgs e)
        {
            if (txtFecha.Text != "" && txtCantidadDevolucion.Text != "")
            {
                DataSet dsDatos1 = datos.insertDevolucionKardex(Int32.Parse(txtMprid.Text), Double.Parse(txtCantidadDevolucion.Text), Double.Parse(txtCunitario.Text), txtFecha.Text, Int32.Parse(oprid));
                //para gregar la devolución a la lista de egresos de mp, el 1 es porque el IVA se carga automáticamente desde el valor de la mprima
                DataSet dsDatos2 = datos.insertListaEgresosmp(1, Int32.Parse(txtMprid.Text), Int32.Parse(txtCantidadDevolucion.Text), Double.Parse(txtCunitario.Text), 0, txtFecha.Text, "SI");

                if (dsDatos2.Tables[0].Rows.Count > 0)
                {
                    dsDatos2 = datos.selectUltimaListaEgresosMP();
                    string lmpid = dsDatos2.Tables[0].Rows[0]["lmp_id"].ToString();
                    dsDatos2 = datos.insertDetalleOrdenMP(Int32.Parse(oprid), Int32.Parse(lmpid));
                    txtCantidadDevolucion.Text = "";
                    mensaje = "alert('Se ha ingresado los datos.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mprima.aspx");
        }
    }
}