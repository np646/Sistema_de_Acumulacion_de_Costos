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
            /*Session["ultimopedidoid"] = GridView1.SelectedRow.Cells[7].Text;
            Session["itemid"] = GridView1.SelectedRow.Cells[1].Text;

            Response.Redirect("Orden.aspx");*/
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

                System.Windows.Forms.MessageBox.Show("Se ha eliminado el item.");
                GridView1.DataBind();
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