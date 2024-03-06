using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class VerOrdenes : System.Web.UI.Page
    {
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //ahora se utiliza rowcommand
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu2.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                string oprid = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.deleteOrdenProduccion(Int32.Parse(oprid));
                GridView1.DataBind();
                string mensaje = mensaje = "alert('Se ha eliminado el item.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
            else if (e.CommandName == "ver")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["ultimopedidoid"] = GridView1.Rows[crow].Cells[7].Text;
                Session["itemid"] = GridView1.Rows[crow].Cells[1].Text;
                Response.Redirect("Orden.aspx");
            }
        }
    }
}