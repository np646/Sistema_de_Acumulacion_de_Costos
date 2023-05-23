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

        protected void Page_Load(object sender, EventArgs e)
        {
            btnGuardar.Visible = btnCancelar.Visible = false;
            String ped = Session["pedido"].ToString();
            //try
            //{
                /*
                DataSet dsDatos = datos.selectUltimoPedido();

                

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    txtNumPedido.Text = dsDatos.Tables[0].Rows[0]["ped_id"].ToString();
                    txtCliente.Text = dsDatos.Tables[0].Rows[0]["cli_nombre"].ToString();
                    txtIdentificacion.Text = dsDatos.Tables[0].Rows[0]["cli_identificacion"].ToString();

                    Session["ultimopedidoid"] = pedid = dsDatos.Tables[0].Rows[0]["ped_id"].ToString();

                    DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                    if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                    {

                        txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();

                        //dsDatos2 = datos.updatePedido(Int32.Parse(txtNumPedido.Text), Double.Parse(txtTotal.Text));

                    }


                }
                else /*/
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

                        //dsDatos2 = datos.updatePedido(Int32.Parse(txtNumPedido.Text), Double.Parse(txtTotal.Text));

                    }
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
                }
            //}
            //catch
            //{
            //    System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            //}
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            //try
            //{
                string cliid = Session["cliid"].ToString();

                double total = Int32.Parse(txtCantidad.Text) * Double.Parse(txtPVP.Text);
                DataSet dsDatos2 = datos.insertItem(Int32.Parse(cliid), Int32.Parse(txtCantidad.Text), txtProducto.Text, Double.Parse(txtPVP.Text), txtFechaIngreso.Text, txtFechaSalida.Text, txtDescripcion.Text, Int32.Parse(txtNumPedido.Text), total);

                if (dsDatos2.Tables[0].Rows.Count > 0)
                {
                    DataSet dsDatos3 = datos.selectUltimoItem();
                    string itmid = dsDatos3.Tables[0].Rows[0]["itm_id"].ToString();

                    dsDatos2 = datos.insertOrdenProduccion(Int32.Parse(itmid));

                    dsDatos2 = datos.insertDetallePedido(Int32.Parse(pedid), Int32.Parse(itmid));
                    System.Windows.Forms.MessageBox.Show("Se ha ingresado los datos.");



                    DataSet dsDatos4 = datos.selectTotalPorPedido(Int32.Parse(txtNumPedido.Text));
                    if (!String.IsNullOrEmpty(dsDatos4.Tables[0].Rows[0]["suma"].ToString()))
                    {

                        txtTotal.Text = dsDatos4.Tables[0].Rows[0]["suma"].ToString();

                        //dsDatos2 = datos.updatePedido(Int32.Parse(txtNumPedido.Text), Double.Parse(txtTotal.Text));

                    }

                    txtCantidad.Text = txtProducto.Text = txtPVP.Text = txtDescripcion.Text = txtFechaIngreso.Text = txtFechaSalida.Text = "";

                    GridView1.DataBind();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Ingrese los datos correctamente.");
                }
           // }
            //catch
            //{
             //   System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            //}
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*En lugar de esto ahora se utiliza RowCommand para usar varios botones
               Session["itemid"] = GridView1.SelectedRow.Cells[0].Text;
              // txtitemid.Text = Session["itemid"].ToString();

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
                txtDescripcion.Text = "Eliminar";

                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                txtItmid.Text = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.deleteDetallePedido(Int32.Parse(txtItmid.Text));

                System.Windows.Forms.MessageBox.Show("Se ha eliminado el item.");
                GridView1.DataBind();
            }
            else if (e.CommandName == "ver")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                Session["itemid"] = GridView1.Rows[crow].Cells[0].Text;
                // txtitemid.Text = Session["itemid"].ToString();

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
           // try
           // {
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

                    System.Windows.Forms.MessageBox.Show("Se han guardado los cambios.");
                }

                GridView1.DataBind();
                btnGuardar.Visible = btnCancelar.Visible = false;
                btnRegresar.Visible = btnIngresar.Visible = true;
                txtCantidad.Text = txtProducto.Text = txtPVP.Text = txtDescripcion.Text = txtFechaIngreso.Text = txtFechaSalida.Text = "";
            //}
            //catch
            //{
             //   System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            //}
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
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            }
        }
    }
}