using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace SAC_Enci_Proyecto
{
    public partial class Ventas : System.Web.UI.Page
    {
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu3.aspx");
        }

        protected void btnMostrarV_Click(object sender, EventArgs e)
        {
            string tipo = ddlTipo.SelectedItem.Value;
            DataSet dsDatos = datos.selectReporteGastos(txtFechaInicio.Text, txtFechaFinalizacion.Text, tipo);
            GridView1.DataBind();
            DataSet dsDatos2 = datos.selectReporteTotalGastos(txtFechaInicio.Text, txtFechaFinalizacion.Text, tipo);
            if (dsDatos2.Tables[0].Rows.Count > 0)
            {
               txtTotal.Text = dsDatos2.Tables[0].Rows[0]["suma"].ToString();
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        //
        //Para exportar a un archivo Excel
        //

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Reporte" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {

        }
    }
}