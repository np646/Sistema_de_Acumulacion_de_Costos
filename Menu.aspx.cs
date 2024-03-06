using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace SAC_Enci_Proyecto
{
    public partial class Menu : System.Web.UI.Page
    {
        Acc datos = new Acc();
        int usuarioID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCerarSesion_Click(object sender, EventArgs e)
        {
            DataSet dsDatos = datos.updateRegistro();

            Response.Redirect("IniciarSesion.aspx");
        }

        protected void ibtnRegistro_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("RegistroUsuarios.aspx");
        }

        protected void ibtnIniciar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Menu2.aspx");
        }

        protected void ibtnVentas_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Menu3.aspx");
        }

        protected void ibtnIva_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ConfigurarIVA.aspx");
        }

        protected void btnBodega_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu4.aspx");
        }
    }
}