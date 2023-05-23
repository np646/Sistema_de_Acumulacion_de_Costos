using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC_Enci_Proyecto
{
    public partial class Menu3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void ibtnRTipo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }

        protected void ibtnRdetalle_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ReporteDetalle.aspx");
        }

        protected void ibtnBuscarPedido_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("BusquedaPedido.aspx");
        }

        protected void ibtnBuscarOrden_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("BusquedaOrden.aspx");
        }
    }
}