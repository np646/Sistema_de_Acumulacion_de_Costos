using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Pedidos : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string pedid = "";
        string itmid = "";
        string proid = "";
        string mensaje = "Ingrese los datos correctamente.";
        String ped = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;
            ped = Session["pedido"].ToString();
            if (!string.IsNullOrEmpty(ped))
            {
                DataSet dsDatos1 = datos.selectPedido(Int32.Parse(ped));
                txtNumPedido.Text = dsDatos1.Tables[0].Rows[0]["ped_id"].ToString();
                txtCliente.Text = dsDatos1.Tables[0].Rows[0]["cli_nombre"].ToString();
                txtIdentificacion.Text = dsDatos1.Tables[0].Rows[0]["cli_identificacion"].ToString();

                Session["ultimopedidoid"] = pedid = dsDatos1.Tables[0].Rows[0]["ped_id"].ToString();

                DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                {
                    txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            
            if (txtCantidad.Text != "" && txtProducto.Text != "" && txtPVP.Text != "" && txtFechaIngreso.Text != "" && txtFechaSalida.Text != "")
            {
                DataSet dsDatos1 = datos.selectPedido(Int32.Parse(ped));
                string cliid = dsDatos1.Tables[0].Rows[0]["cli_id"].ToString();
                double total = Int32.Parse(txtCantidad.Text) * Double.Parse(txtPVP.Text);


                DataSet dsDatos2 = datos.insertItem(Int32.Parse(cliid), Int32.Parse(txtCantidad.Text), txtProducto.Text, Double.Parse(txtPVP.Text), txtFechaIngreso.Text, txtFechaSalida.Text, txtDescripcion.Text, Int32.Parse(txtNumPedido.Text), total);

                if (dsDatos2.Tables[0].Rows.Count > 0)
                {
                    DataSet dsDatos3 = datos.selectUltimoItem();
                    string itmid = dsDatos3.Tables[0].Rows[0]["itm_id"].ToString();
                    dsDatos2 = datos.insertOrdenProduccion(Int32.Parse(itmid));
                    dsDatos2 = datos.insertDetallePedido(Int32.Parse(pedid), Int32.Parse(itmid));
                   
                   
                    DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                    if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                    {
                        txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                    txtCantidad.Text = txtProducto.Text = txtPVP.Text = txtDescripcion.Text = txtFechaIngreso.Text = txtFechaSalida.Text = "";
                    GridView1.DataBind();

                    mensaje = "alert('Se ha ingresado los datos.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
                else
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
            // ahora se utiliza RowCommand 
        }


        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu2.aspx");
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                txtDescripcion.Text = "Eliminar";
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                txtItmid.Text = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.deleteDetallePedido(Int32.Parse(txtItmid.Text));
                GridView1.DataBind();
                mensaje = "alert('Se ha eliminado el item.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
            else if (e.CommandName == "ver")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                Session["itemid"] = GridView1.Rows[crow].Cells[0].Text;
                Response.Redirect("Orden.aspx");
            }
            else if (e.CommandName == "editar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                txtItmid.Text = GridView1.Rows[crow].Cells[0].Text;
                txtCantidad.Text = GridView1.Rows[crow].Cells[3].Text;
                txtProducto.Text = GridView1.Rows[crow].Cells[4].Text;
                txtPVP.Text = GridView1.Rows[crow].Cells[5].Text;
                txtDescripcion.Text = GridView1.Rows[crow].Cells[9].Text;
                if (txtDescripcion.Text.Equals("&nbsp;"))
                {
                    txtDescripcion.Text = "";
                }
                txtFechaIngreso.Text = GridView1.Rows[crow].Cells[6].Text; //revisar
                txtFechaSalida.Text = GridView1.Rows[crow].Cells[7].Text; //revisar
                DataSet dsDatos = datos.selectProductoPorItem(Int32.Parse(txtItmid.Text));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtProid.Text = dsDatos.Tables[0].Rows[0]["pro_id"].ToString();
                }
                btnGuardar.Visible = btnCancelar.Visible = true;
                btnRegresar.Visible = btnIngresar.Visible = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            double total = Int32.Parse(txtCantidad.Text) * Double.Parse(txtPVP.Text);
            DataSet dsDatos = datos.updateItem(Int32.Parse(txtCantidad.Text), txtProducto.Text, Double.Parse(txtPVP.Text), txtDescripcion.Text, Int32.Parse(txtItmid.Text), Int32.Parse(txtProid.Text), total);

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                {
                    txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();
                    dsDatos4 = datos.updatePedido(Int32.Parse(txtNumPedido.Text), Double.Parse(txtTotal.Text));
                }
                mensaje = "alert('Se han guardado los cambios.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }

            GridView1.DataBind();
            btnGuardar.Visible = btnCancelar.Visible = false;
            btnRegresar.Visible = btnIngresar.Visible = true;
            txtCantidad.Text = txtProducto.Text = txtPVP.Text = txtDescripcion.Text = txtFechaIngreso.Text = txtFechaSalida.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtCantidad.Text = txtProducto.Text = txtPVP.Text = txtDescripcion.Text = txtFechaIngreso.Text = txtFechaSalida.Text = "";
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }
    }
}