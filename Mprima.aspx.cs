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

namespace SAC_Enci_Proyecto
{
    public partial class Mprima : System.Web.UI.Page
    {
        //A esta pagina solo se accede a traves de generar pedido
        Acc datos = new Acc();
        string oprid = "";
        string mprid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;
            oprid = Session["oprid"].ToString();
           
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {


            try
            {
                string tipo = (ddlTipo.SelectedItem.Value);
                DataSet dsDatos = datos.insertListaEgresos(txtDetalle.Text, txtRuc.Text, txtAutorizacion.Text, txtProveedor.Text, tipo, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), Double.Parse(txtIVA.Text));


                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    dsDatos = datos.selectUltimaListaEgresos();
                    string legrid = dsDatos.Tables[0].Rows[0]["legr_id"].ToString();

                    dsDatos = datos.insertDetalleOrden(Int32.Parse(oprid), Int32.Parse(legrid));
                   
                    if (tipo.Equals("MP"))
                    {
                        //para guardar en la salidas del kardex de esa materia prima
                        DataSet dsDatos1 = datos.insertSalidaKardex(Int32.Parse(txtMprid.Text), Double.Parse(txtCantidad.Text));
                        
                    }
                    System.Windows.Forms.MessageBox.Show("Se ha ingresado los datos");
                    GridView1.DataBind();
                    txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtAutorizacion.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
                }
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
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
            if (!cbIVA.Checked)
            {
               // txtIVA.Visible = false;
                txtIVA.Text = "0";
            }
            else
            {
                DataSet dsDatos = datos.selectIVAActual();
                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtIVA.Text = dsDatos.Tables[0].Rows[0]["iva_valor"].ToString();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No se ha definido un valor de IVA.");
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
               

                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                txtLegrid.Text = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.deleteLegreso(Int32.Parse(txtLegrid.Text));

                System.Windows.Forms.MessageBox.Show("Se ha eliminado el item.");
                GridView1.DataBind();
            }
            else if (e.CommandName == "detalle")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                Session["legrid"] = GridView1.Rows[crow].Cells[0].Text;
                txtProveedor.Text = Session["legrid"].ToString();
                Session["pagina"] = "Mprima.aspx";
                Response.Redirect("DetallesCosto.aspx");
            }
            else if (e.CommandName == "editar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());


                txtLegrid.Text = GridView1.Rows[crow].Cells[0].Text;
                txtDetalle.Text = GridView1.Rows[crow].Cells[2].Text;
                txtRuc.Text = GridView1.Rows[crow].Cells[3].Text;
                txtAutorizacion.Text = GridView1.Rows[crow].Cells[4].Text;
                txtProveedor.Text = GridView1.Rows[crow].Cells[5].Text;
                txtCantidad.Text = GridView1.Rows[crow].Cells[7].Text;
                txtCostoUnitario.Text = GridView1.Rows[crow].Cells[8].Text;

                ddlTipo.SelectedItem.Value = GridView1.Rows[crow].Cells[6].Text;
                //para que al editar se seleccione el tipo
                switch (ddlTipo.SelectedItem.Value)
                {
                    case "MP":
                        ddlTipo.SelectedItem.Text = "Materia prima directa";
                        break;
                    case "MO":
                        ddlTipo.SelectedItem.Text = "Mano de obra directa";
                        break;
                    case "CIF":
                        ddlTipo.SelectedItem.Text = "Costos indirectos de fabricación";
                        break;
                    case "GA":
                        ddlTipo.SelectedItem.Text = "Gastos administrativos";
                        break;
                    case "GV":
                        ddlTipo.SelectedItem.Text = "Gastos de ventas";
                        break;
                    case "GF":
                        ddlTipo.SelectedItem.Text = "Gastos financieros";
                        break;

                    default:
                        // code block
                        break;
                }

                DataSet dsDatos = datos.selectProveedorPorLegrid(Int32.Parse(txtLegrid.Text));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtPrvid.Text = dsDatos.Tables[0].Rows[0]["prv_id"].ToString();

                }

                btnGuardar.Visible = btnCancelar.Visible = true;
                btnRegresar.Visible = btnIngresar.Visible = false;

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string tipo = (ddlTipo.SelectedItem.Value);
                DataSet dsDatos = datos.updateLegreso(txtDetalle.Text, txtRuc.Text, txtAutorizacion.Text, txtProveedor.Text, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), Double.Parse(txtIVA.Text), tipo, Int32.Parse(txtLegrid.Text), Int32.Parse(txtPrvid.Text));


                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    /*DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                    if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                    {

                        txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();

                        dsDatos4 = datos.updatePedido(Int32.Parse(txtNumPedido.Text), Double.Parse(txtTotal.Text));

                    }*/

                    System.Windows.Forms.MessageBox.Show("Se han guardado los cambios.");
                }

                GridView1.DataBind();
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtAutorizacion.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtAutorizacion.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
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
                txtAutorizacion.Text = dsDatos.Tables[0].Rows[0]["prv_autorizacion"].ToString();
                txtProveedor.Text = dsDatos.Tables[0].Rows[0]["prv_nombre"].ToString();
            }

        
        }
    }
    }
