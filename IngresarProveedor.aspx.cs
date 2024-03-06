using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class IngresarProveedor : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu4.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtRUC.Text != "" && txtNombre.Text != "")
            {
                try
                {
                    DataSet dsDatos = datos.insertProveedor(txtRUC.Text, txtAutorizacion.Text, txtNombre.Text);
                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        txtRUC.Text = txtNombre.Text = txtAutorizacion.Text = "";
                        mensaje = "alert('Se ha ingresado el proveedor.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }
    }
}