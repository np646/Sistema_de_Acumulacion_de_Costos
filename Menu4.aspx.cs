using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Menu4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btnIngresarPrv_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngresarProveedor.aspx");
        }

        protected void btnIngresarMprima_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngresarMateriaPrima.aspx");
        }

        protected void btnVerPrv_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerProveedores.aspx");
        }

        protected void btnVerMPrima_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerMateriaPrima.aspx");
        }

        protected void btnIngresarPrv_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("IngresarProveedor.aspx");
        }
    }
}