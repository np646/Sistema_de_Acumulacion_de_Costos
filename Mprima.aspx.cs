using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Text;
using System.Drawing;


namespace SAC_Enci_Proyecto
{
    public partial class Mprima : System.Web.UI.Page
    {
        //A esta pagina solo se accede a traves de generar pedido
        double iva = 0;
        Acc datos = new Acc();
        string oprid = "";
        string mprid = "";
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;
            oprid = Session["oprid"].ToString();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtCantidad.Text != "" && txtFecha.Text != "")
            {
                try
                {
                    //DataSet dsDatos = datos.insertListaEgresosmp(Double.Parse(txtIVA.Text), Int32.Parse(txtMprid.Text), Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text),1, txtFecha.Text);
                    //el iva va con 1 porque en los calculos ya se calcula con el valor unitario en el kardex
                    DataSet dsDatos = datos.insertListaEgresosmp(1, Int32.Parse(txtMprid.Text), Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), 1, txtFecha.Text, "NO");

                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        dsDatos = datos.selectUltimaListaEgresosMP();
                        string lmpid = dsDatos.Tables[0].Rows[0]["lmp_id"].ToString();
                        dsDatos = datos.insertDetalleOrdenMP(Int32.Parse(oprid), Int32.Parse(lmpid));
                        //para guardar en la salidas del kardex de esa materia prima
                        DataSet dsDatos1 = datos.insertSalidaKardex(Int32.Parse(txtMprid.Text), Double.Parse(txtCantidad.Text), txtFecha.Text, Int32.Parse(oprid));

                        GridView1.DataBind();
                        txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = txtCantidadBodega.Text = "";

                        mensaje = "alert('Se ha ingresado los datos.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                }
                catch (Exception a)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }

        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["legrid"] = GridView1.SelectedRow.Cells[0].Text;
            txtProveedor.Text = Session["legrid"].ToString();
            Session["pagina"] = "Mprima.aspx";
            Response.Redirect("DetallesCosto.aspx");
        }



        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orden.aspx");
        }

        protected void cbIVA_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "devolucion")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                Session["lmpid"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Devolucion.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            /*try
            {
                DataSet dsDatos = datos.updateLegresomp(txtDetalle.Text, txtRuc.Text, "esta parte hay que quitar", txtProveedor.Text, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), 1, Int32.Parse(txtLegrid.Text), Int32.Parse(txtPrvid.Text), 1);

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    System.Windows.Forms.MessageBox.Show("Se han guardado los cambios.");
                }

                GridView1.DataBind();
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
            }*/
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
        }

        protected void btnBuscarMpr_Click(object sender, EventArgs e)
        {
            string mprCodigo = ddlMateriaPrima.SelectedItem.Value;

            DataSet dsDatos = datos.selectMateriaPrimaPorCodigo(mprCodigo);
            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                txtMprid.Text = dsDatos.Tables[0].Rows[0]["mpr_id"].ToString();
                txtDetalle.Text = dsDatos.Tables[0].Rows[0]["mpr_detalle"].ToString();
                txtCostoUnitario.Text = dsDatos.Tables[0].Rows[0]["mpr_cunitario"].ToString();
                txtRuc.Text = dsDatos.Tables[0].Rows[0]["prv_ruc"].ToString();
                txtProveedor.Text = dsDatos.Tables[0].Rows[0]["prv_nombre"].ToString();
                txtCantidadBodega.Text = dsDatos.Tables[0].Rows[0]["mpr_cantidad"].ToString();
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // para cambiar el color de una fila si es devolución
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                // int esdevolucion = Convert.ToInt32(GridView1.Rows[i].Cells[8].Text);
                if (GridView1.Rows[i].Cells[8].Text == "SI")
                {
                    GridView1.Rows[i].BackColor = Color.Silver;
                }
            }
        }
    }
}
