using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class AgregarMateriaPrima : System.Web.UI.Page
    {
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu4.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int proveedorID = Int32.Parse(ddlProveedor.SelectedItem.Value);

            DataSet dsDatos = datos.insertMateriaPrima(txtCodigo.Text,txtDetalle.Text, proveedorID);
           
        }
    }
}