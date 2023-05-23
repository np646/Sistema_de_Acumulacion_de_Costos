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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            DataSet dsDatos = datos.insertUsuario(txtUsuario.Text, txtContrasena.Text);

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                System.Windows.Forms.MessageBox.Show("Se ha registrado al usuario.");
                Response.Redirect("IniciarSesion.aspx");

            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
            }

        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("IniciarSesion.aspx");
        }
    }
}