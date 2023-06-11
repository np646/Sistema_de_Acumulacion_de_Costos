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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu4.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsDatos = datos.insertProveedor(txtRUC.Text, txtAutorizacion.Text, txtNombre.Text);

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    System.Windows.Forms.MessageBox.Show("Se ha ingresado el proveedor.");
                    
                }
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            }
        }
    }
}