using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Forms;

namespace SAC_Enci_Proyecto
{
    public partial class Cliente : System.Web.UI.Page
    {
        Acc datos = new Acc();
        string idCliente = "";
        string mensaje = "Ingrese los datos correctamente.";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnPedido_Click(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            if (txtNombre.Text != "" && txtIdentificacion.Text != "")
            {
                try
                {
                    DataSet dsDatos = datos.insertCliente(txtNombre.Text, txtIdentificacion.Text);

                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        idCliente = dsDatos.Tables[0].Rows[0]["cli_id"].ToString();
                        GridView1.DataBind();
                        txtNombre.Text = txtIdentificacion.Text = "";

                        mensaje = "alert('Se ha creado el cliente.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                    else
                    {
                        mensaje = "alert('No existe el cliente.');";
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
            //ahora se uiliza rowcommand
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
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                idCliente = txtCliid.Text = GridView1.Rows[crow].Cells[0].Text;
                Session["cliid"] = txtCliid.Text;
                if (txtFecha.Text == "")
                {
                    mensaje = "alert('Debe ingresar una fecha.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
                else
                {
                    DataSet dsDatos = datos.insertPedido(Int32.Parse(idCliente), txtFecha.Text);

                    if (dsDatos.Tables[0].Rows.Count > 0)
                    {
                        DataSet dsDatos1 = datos.selectUltimoPedido();
                        if (dsDatos1.Tables[0].Rows.Count > 0)
                        {
                            Session["pedido"] = dsDatos1.Tables[0].Rows[0]["ped_id"].ToString();
                            mensaje = "alert('Se ha creado un nuevo pedido.'); window.location='Pedidos.aspx';";
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                            
                        }
                    }
                    else
                    {
                        mensaje = "alert('Debe seleccionar un cliente.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                    }
                }
            }
            else if (e.CommandName == "editar")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                txtCliid.Text = GridView1.Rows[crow].Cells[0].Text;
                DataSet dsDatos = datos.selectCliente(txtCliid.Text);
                txtNombre.Text = dsDatos.Tables[0].Rows[0]["cli_nombre"].ToString();
                txtIdentificacion.Text = dsDatos.Tables[0].Rows[0]["cli_identificacion"].ToString();
                btnGuardar.Visible = true;
                btnIngresar.Visible = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsDatos1 = datos.updateCliente(txtNombre.Text, txtIdentificacion.Text, Int32.Parse(txtCliid.Text));
                if (dsDatos1.Tables[0].Rows.Count > 0)
                {
                    mensaje = "alert('Se han guardado los cambios.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
                }
                btnGuardar.Visible = false;
                btnIngresar.Visible = true;
                GridView1.DataBind();
            }
            catch
            {               
                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje, true);
            }
        }
    }
}