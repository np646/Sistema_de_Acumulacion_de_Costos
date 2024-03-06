using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Compras : System.Web.UI.Page
    {
        string mensaje = "Ingrese los datos correctamente.";
        double iva = 0;
        Acc datos = new Acc();
        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;

            //para abrir la página de egresos desde ingresarmateriaprima 
            if (!string.IsNullOrEmpty(Session["mpridcompra"].ToString()))
            {
                txtDetalle.Text = "SI FUNCIONA";

                DataSet dsDatos = datos.selectMateriaPrimaPorID(Int32.Parse(Session["mpridcompra"].ToString()));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtDetalle.Text = dsDatos.Tables[0].Rows[0]["mpr_detalle"].ToString();
                    txtRuc.Text = dsDatos.Tables[0].Rows[0]["prv_ruc"].ToString();
                    txtProveedor.Text = dsDatos.Tables[0].Rows[0]["prv_nombre"].ToString();
                }
            }

            if (!cbIVA.Checked)
            {
                txtIVA.Text = "0";
                iva = 0;
            }
            else
            {
                DataSet dsDatos1 = datos.selectIVAActual();

                if (dsDatos1.Tables[0].Rows.Count > 0)
                {
                    txtIVA.Text = dsDatos1.Tables[0].Rows[0]["iva_valor"].ToString();
                    iva = Double.Parse(dsDatos1.Tables[0].Rows[0]["iva_valor"].ToString());
                }
                else
                {
                    mensaje = "alert('No se ha definido un valor de IVA.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                iva = iva + 1;
                double resp = Double.Parse(txtCostoUnitario.Text) * iva;
                double resultado = Math.Round(resp, 2);

                DataSet dsDatos = datos.insertListaEgresosmp(Double.Parse(txtIVA.Text), Int32.Parse(Session["mpridcompra"].ToString()), Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), 1, txtFecha.Text, "NO");
                DataSet dsDatos1 = datos.insertEntradaKardex(Int32.Parse(Session["mpridcompra"].ToString()), Double.Parse(txtCantidad.Text), resultado, txtFecha.Text); //*1.12 es para que vaya con iva de 0.12

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataBind();
                    mensaje = "alert('Se ha ingresado los datos.'); window.location='Kardex.aspx';";
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
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ahoa se usa rowcommand
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            //si se ingresa desde ingresarmateriaprima 
            if (!string.IsNullOrEmpty(Session["mpridcompra"].ToString()))
            {
                Response.Redirect("Kardex.aspx");
            }
            Response.Redirect("Menu2.aspx");
        }

        protected void cbIVA_CheckedChanged(object sender, EventArgs e)
        {
            if (!cbIVA.Checked)
            {
                txtIVA.Text = "0";
                iva = 0;
            }
            else
            {
                DataSet dsDatos1 = datos.selectIVAActual();
                if (dsDatos1.Tables[0].Rows.Count > 0)
                {
                    txtIVA.Text = dsDatos1.Tables[0].Rows[0]["iva_valor"].ToString();
                    iva = Double.Parse(dsDatos1.Tables[0].Rows[0]["iva_valor"].ToString());
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
                //Nataly Salazar
                txtRuc.Text = GridView1.Rows[crow].Cells[3].Text;
                txtProveedor.Text = GridView1.Rows[crow].Cells[5].Text;
                txtCantidad.Text = GridView1.Rows[crow].Cells[7].Text;
                txtCostoUnitario.Text = GridView1.Rows[crow].Cells[8].Text;
                txtIVA.Text = GridView1.Rows[crow].Cells[10].Text;

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
                DataSet dsDatos = datos.updateLegresomp(txtDetalle.Text, txtRuc.Text, "esto hay que quitar", txtProveedor.Text, Int32.Parse(txtCantidad.Text), Double.Parse(txtCostoUnitario.Text), Double.Parse(txtIVA.Text), Int32.Parse(txtLegrid.Text), Int32.Parse(txtPrvid.Text));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    mensaje = "alert('Se han guardado los cambios.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }

                GridView1.DataBind();
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
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
                txtLegrid.Text = txtDetalle.Text = txtRuc.Text = txtProveedor.Text = txtCantidad.Text = txtCostoUnitario.Text = "";
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }

        protected void txtIVA_TextChanged(object sender, EventArgs e)
        {
        }
    }
}