using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string legrid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            legrid = Session["legrid"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            DataSet dsDatos = datos.insertCostoPorOrden(Int32.Parse(txtNumOP.Text), Int32.Parse(legrid), txtComentario.Text);

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dsDatos = datos.insertDetalleOrden(Int32.Parse(txtNumOP.Text), Int32.Parse(legrid));
                System.Windows.Forms.MessageBox.Show("Se ha ingresado los datos.");
                GridView1.DataBind();
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {

            string pagina = Session["pagina"].ToString();
            Response.Redirect(pagina);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNumOP.Text = GridView2.SelectedRow.Cells[0].Text;
            
        }

    }
}