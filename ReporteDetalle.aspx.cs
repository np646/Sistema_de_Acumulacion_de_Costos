using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC_Enci_Proyecto
{
    public partial class ReporteDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //En esta página todo funciona desde el datagrid
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu3.aspx");
        }

        protected void btnExportar_Click(object sender, EventArgs e)
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
            string popupScript = "<script language='javascript'>" +
                "window.print('cobros.aspx', 'CustomPopUp', " +
                "'width=850, height=350, menubar=no,scrollbars=yes, resizable=yes')" +
                "</script>";
            Page.RegisterStartupScript("PopupScript", popupScript);
        }
    }
}