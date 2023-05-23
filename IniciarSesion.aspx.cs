using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            DataSet dsDatos = datos.selectVerificarUsuario(txtUsuario.Text, txtContrasena.Text);
            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                Session["usuario"] = txtUsuario.Text;


                dsDatos = datos.insertRegistro(txtUsuario.Text);

                Response.Redirect("Menu.aspx");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Usuario o contraseña incorrectos.");
                txtContrasena.Text = txtUsuario.Text = "";
            }

        }
    }
}