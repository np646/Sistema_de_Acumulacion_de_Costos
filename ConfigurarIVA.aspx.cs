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
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet dsDatos = datos.selectIVAActual();
            if (dsDatos.Tables[0].Rows.Count>0)
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
            DataSet dsDatos = datos.insertIVA(Double.Parse(txtNuevoIVA.Text));
            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dsDatos = datos.selectIVAActual();
                txtIVAActual.Text = dsDatos.Tables[0].Rows[0]["iva_valor"].ToString();
                GridView1.DataBind();
                System.Windows.Forms.MessageBox.Show("Se han guardado los cambios.");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
            }
            
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {

            Response.Redirect("Menu.aspx");
        }
    }
}