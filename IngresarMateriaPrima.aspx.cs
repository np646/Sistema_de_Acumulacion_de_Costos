using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class AgregarMateriaPrima : System.Web.UI.Page
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
            int proveedorID = Int32.Parse(ddlProveedor.SelectedItem.Value);
            if (txtCodigo.Text != "" && txtDetalle.Text != "")
            {
                try
                {
                    DataSet dsDatos = datos.insertMateriaPrima(txtCodigo.Text, txtDetalle.Text, proveedorID);

                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        mensaje = "alert('Se ha ingresado la materia prima.');";
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