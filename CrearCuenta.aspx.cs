using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class CrearCuenta : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text != "" && txtContrasena.Text != "")
            {
                DataSet dsDatos = datos.insertUsuario(txtUsuario.Text, txtContrasena.Text);
                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    mensaje = "alert('Se ha registrado al usuario.'); window.location='IniciarSesion.aspx';";
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

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("IniciarSesion.aspx");
        }
    }
}