using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class ConfigurarIVA : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dsDatos = datos.selectIVAActual();
            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                txtIVAActual.Text = dsDatos.Tables[0].Rows[0]["iva_valor"].ToString();
            }
            else
            {
                txtIVAActual.Text = "0";
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            if (txtNuevoIVA.Text != "")
            {
                DataSet dsDatos = datos.insertIVA(Double.Parse(txtNuevoIVA.Text));
                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    dsDatos = datos.selectIVAActual();
                    txtIVAActual.Text = dsDatos.Tables[0].Rows[0]["iva_valor"].ToString();
                    GridView1.DataBind();
                    txtNuevoIVA.Text = "";

                    mensaje = "alert('Se han guardado los cambios.');";
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
            Response.Redirect("Menu.aspx");
        }
    }
}