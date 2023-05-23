using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC_Enci_Proyecto
{
    public partial class BusquedaPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ver")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                Session["pedid"] = GridView1.Rows[crow].Cells[0].Text;
                Session["pedido"] = GridView1.Rows[crow].Cells[0].Text;
                // txtitemid.Text = Session["itemid"].ToString();

                Response.Redirect("Pedidos.aspx");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu3.aspx");
        }
    }
}