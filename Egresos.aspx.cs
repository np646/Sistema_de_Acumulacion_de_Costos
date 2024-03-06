using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Egresos : System.Web.UI.Page
    {
        double iva = 0;
        Acc datos = new Acc();
        string oprid = "";
        string mensaje = "Ingrese los datos correctamente.";

        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;
            oprid = Session["oprid"].ToString();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string tipo = (ddlTipo.SelectedItem.Value);

            if (txtDetalle.Text != "" && txtCantidad.Text != "" && txtCostoUnitario.Text != "" && txtFecha.Text != "" && tipo != "")
            {
                try
                {
                    DataSet dsDatos = datos.insertListaEgresos(txtDetalle.Text, tipo, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), Double.Parse(txtIVA.Text), txtFecha.Text);

                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        dsDatos = datos.selectUltimaListaEgresos();
                        string legrid = dsDatos.Tables[0].Rows[0]["legr_id"].ToString();
                        dsDatos = datos.insertDetalleOrden(Int32.Parse(oprid), Int32.Parse(legrid));
                        GridView1.DataBind();
                        txtDetalle.Text = txtCantidad.Text = txtCostoUnitario.Text = txtFecha.Text = "";
                        mensaje = "alert('Se ha ingresado los datos.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                }
                catch
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
            //ahora se sa rowcommand
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orden.aspx");
        }

        protected void cbIVA_CheckedChanged(object sender, EventArgs e)
        {
            if (!cbIVA.Checked)
            {
                txtIVA.Text = "0";
            }
            else
            {
                DataSet dsDatos1 = datos.selectIVAActual();
                if (dsDatos1.Tables[0].Rows.Count > 0)
                {
                    txtIVA.Text = dsDatos1.Tables[0].Rows[0]["iva_valor"].ToString();
                }
                else
                {
                    mensaje = "alert('No se ha definido un valor de IVA.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
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
                GridView1.DataBind();
                mensaje = "alert('Se ha eliminado el item.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
            else if (e.CommandName == "editar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                txtLegrid.Text = GridView1.Rows[crow].Cells[0].Text;
                txtDetalle.Text = GridView1.Rows[crow].Cells[2].Text;
                //Nataly Salazar
                txtCantidad.Text = GridView1.Rows[crow].Cells[4].Text;
                txtCostoUnitario.Text = GridView1.Rows[crow].Cells[5].Text;
                txtIVA.Text = GridView1.Rows[crow].Cells[7].Text;

                ddlTipo.SelectedItem.Value = GridView1.Rows[crow].Cells[3].Text;
                //para que al editar se seleccione el tipo
                switch (ddlTipo.SelectedItem.Value)
                {

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
                //para que se muestre el checkbox si tiene iva o no
                if (Double.Parse(GridView1.Rows[crow].Cells[7].Text) > 0)
                {
                    cbIVA.Checked = true;
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
                DataSet dsDatos = datos.updateLegreso(txtDetalle.Text, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), Double.Parse(txtIVA.Text), tipo, Int32.Parse(txtLegrid.Text));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    mensaje = "alert('Se han guardado los cambios.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }

                GridView1.DataBind();
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }
    }
}