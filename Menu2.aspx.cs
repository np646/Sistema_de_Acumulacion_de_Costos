using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Produccion : System.Web.UI.Page
    {
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ibtnMprima_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Egresos.aspx");
        }

        protected void ibtnPedido_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cliente.aspx");
        }

        protected void ibtnVerOrden_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("VerOrdenes.aspx");
        }

        protected void ibtnVerPedido_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("VerPedidos.aspx");
        }
    }
}