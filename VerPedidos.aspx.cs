using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC_Enci_Proyecto
{
    public partial class VerPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ahora se utiliza rowcommand
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu2.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ultimopedidoid"] = GridView2.SelectedRow.Cells[6].Text;
            Session["itemid"] = GridView2.SelectedRow.Cells[0].Text;
            Response.Redirect("Orden.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "seleccionar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["pedidoid"] = GridView1.Rows[crow].Cells[0].Text;
                Session["pedido"] = GridView1.Rows[crow].Cells[0].Text;
                GridView2.DataBind();
            }
            else if (e.CommandName == "ir")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["pedid"] = GridView1.Rows[crow].Cells[0].Text;
                Session["pedido"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Pedidos.aspx");
            }
        }
    }
}