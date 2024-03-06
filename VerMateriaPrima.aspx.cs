using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC_Enci_Proyecto
{
    public partial class VerMateriaPrima : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu4.aspx");
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "kardex")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["mpridcompra"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Kardex.aspx");
            }
            else if (e.CommandName == "comprar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["mpridcompra"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Compras.aspx");
            }
            else if (e.CommandName == "devolucion")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["mpridcompra"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Devolucion.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}