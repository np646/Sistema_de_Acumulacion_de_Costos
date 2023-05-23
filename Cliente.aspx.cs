using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SAC_Enci_Proyecto
{
    public partial class Cliente : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string idCliente = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPedido_Click(object sender, EventArgs e)
        {

            // idCliente = txtCliid.Text;
            // Session["cliid"] = txtCliid.Text;
            //DataSet dsDatos = datos.insertPedido(Int32.Parse(idCliente));

            //if (dsDatos.Tables[0].Rows.Count > 0)
            //{
            //DataSet dsDatos1 = datos.selectUltimoPedido();
            //if (dsDatos1.Tables[0].Rows.Count > 0)
            ////{


            //Session["ultimopedidoid"] =  dsDatos.Tables[0].Rows[0]["ped_id"].ToString();
            //Session["pedido"] =

            //System.Windows.Forms.MessageBox.Show("Se ha creado un nuevo pedido.");
            //Response.Redirect("Pedidos.aspx");

            // }

            //}
            //else
            //{
            //System.Windows.Forms.MessageBox.Show("Debe seleccionar un cliente.");
            //}

        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            try
            {
                DataSet dsDatos = datos.insertCliente(txtNombre.Text, txtIdentificacion.Text);

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    System.Windows.Forms.MessageBox.Show("Se ha creado el cliente.");
                    idCliente = dsDatos.Tables[0].Rows[0]["cli_id"].ToString();
                    GridView1.DataBind();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No existe el cliente.");
                }
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           /* idCliente = GridView1.SelectedRow.Cells[0].Text.ToString();
            DataSet dsDatos = datos.selectCliente(idCliente);

            txtCliid.Text = dsDatos.Tables[0].Rows[0]["cli_id"].ToString();
           */
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eliminar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                idCliente = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.deleteCliente(Int32.Parse(idCliente));
                GridView1.DataBind();
            }
            else if (e.CommandName == "generar")
            {
                /*

                                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                                idCliente = GridView1.Rows[crow].Cells[0].Text;
                                DataSet dsDatos = datos.selectCliente(idCliente);

                                txtCliid.Text = dsDatos.Tables[0].Rows[0]["cli_id"].ToString();



                                idCliente = txtCliid.Text;
                                Session["cliid"] = txtCliid.Text;
                                DataSet dsDatos2 = datos.insertPedido(Int32.Parse(idCliente));

                                if (dsDatos2.Tables[0].Rows.Count > 0)
                                {
                                    System.Windows.Forms.MessageBox.Show("Se ha creado un nuevo pedido.");
                                    Response.Redirect("Pedidos.aspx");
                                }
                                else
                                {
                                    System.Windows.Forms.MessageBox.Show("Debe seleccionar un cliente.");
                                }
                /*/

                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                idCliente = txtCliid.Text= GridView1.Rows[crow].Cells[0].Text;
                Session["cliid"] = txtCliid.Text;
                DataSet dsDatos = datos.insertPedido(Int32.Parse(idCliente));

                if (dsDatos.Tables[0].Rows.Count > 0)
                {
                    DataSet dsDatos1 = datos.selectUltimoPedido();
                    if (dsDatos1.Tables[0].Rows.Count > 0)
                    {


                        Session["pedido"] =  dsDatos1.Tables[0].Rows[0]["ped_id"].ToString();
                       

                        System.Windows.Forms.MessageBox.Show("Se ha creado un nuevo pedido.");
                        Response.Redirect("Pedidos.aspx");

                    }

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Debe seleccionar un cliente.");
                }
            }
            else if (e.CommandName == "editar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());

                txtCliid.Text= GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.selectCliente(txtCliid.Text);

                txtNombre.Text = dsDatos.Tables[0].Rows[0]["cli_nombre"].ToString();

                txtIdentificacion.Text = dsDatos.Tables[0].Rows[0]["cli_identificacion"].ToString();

                btnGuardar.Visible = true;
               
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsDatos1 = datos.updateCliente(txtNombre.Text, txtIdentificacion.Text, Int32.Parse(txtCliid.Text));


                if (dsDatos1.Tables[0].Rows.Count > 0)
                {
                    System.Windows.Forms.MessageBox.Show("Se han guardado los cambios.");
                }
                btnGuardar.Visible = false;
                GridView1.DataBind();
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Ingrese correctamente los datos");
            }
        }

       
    }
}