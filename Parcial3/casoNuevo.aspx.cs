using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Parcial3
{
    public partial class casoNuevo : Page
    {
        // Consider moving connection string to web.config later.
        private readonly string connectionString = "Server=LAPTOP-7RHH446U\\SQLEXPRESS;Database=BUFFETEDB;Trusted_Connection=True;TrustServerCertificate=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEstatus();
                LoadClientes();
                LoadAbogados();
            }
        }

        private void LoadEstatus()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "SELECT estatus_id, estatus_dsc FROM ESTATUS_MST ORDER BY estatus_dsc";
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            ddlEstatus.Items.Clear();
            ddlEstatus.Items.Add(new System.Web.UI.WebControls.ListItem("-- Seleccione --", ""));
            ddlEstatus.DataSource = dt;
            ddlEstatus.DataTextField = "estatus_dsc";
            ddlEstatus.DataValueField = "estatus_id";
            ddlEstatus.DataBind();
        }

        private void LoadClientes()
        {
            // Ajusta el nombre de la tabla/columnas si tu esquema difiere.
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "SELECT cliente_id, cliente_nom FROM CLIENTES ORDER BY cliente_nom";
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            ddlCliente.Items.Clear();
            ddlCliente.Items.Add(new System.Web.UI.WebControls.ListItem("-- Seleccione --", ""));
            ddlCliente.DataSource = dt;
            ddlCliente.DataTextField = "cliente_nom";
            ddlCliente.DataValueField = "cliente_id";
            ddlCliente.DataBind();
        }

        private void LoadAbogados()
        {
            // Ajusta el nombre de la tabla/columnas si tu esquema difiere.
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "SELECT abogado_id, abogado_nom FROM ABOGADOS ORDER BY abogado_nom";
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            ddlAbogado.Items.Clear();
            ddlAbogado.Items.Add(new System.Web.UI.WebControls.ListItem("-- Seleccione --", ""));
            ddlAbogado.DataSource = dt;
            ddlAbogado.DataTextField = "abogado_nom";
            ddlAbogado.DataValueField = "abogado_id";
            ddlAbogado.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            lblMessage.Text = string.Empty;

            if (!Page.IsValid)
                return;

            if (!DateTime.TryParse(txtInicio.Text, out DateTime inicio))
            {
                lblMessage.Text = "Fecha de inicio inválida.";
                return;
            }

            if (!DateTime.TryParse(txtFinal.Text, out DateTime finalDate))
            {
                lblMessage.Text = "Fecha final inválida.";
                return;
            }

            if (string.IsNullOrEmpty(ddlEstatus.SelectedValue) ||
                string.IsNullOrEmpty(ddlCliente.SelectedValue) ||
                string.IsNullOrEmpty(ddlAbogado.SelectedValue))
            {
                lblMessage.Text = "Complete todos los campos obligatorios.";
                return;
            }

            // Convierte IDs a int si procede
            if (!int.TryParse(ddlEstatus.SelectedValue, out int estatusId) ||
                !int.TryParse(ddlCliente.SelectedValue, out int clienteId) ||
                !int.TryParse(ddlAbogado.SelectedValue, out int abogadoId))
            {
                lblMessage.Text = "Valores seleccionados inválidos.";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = con.CreateCommand())
                {
                    // Ajusta las columnas si tu tabla CASOS tiene nombres/columnas diferentes.
                    cmd.CommandText = @"
                        INSERT INTO CASOS (inicio_dte, final_dte, estatus_id, cliente_id, abogado_id)
                        VALUES (@inicio, @final, @estatus, @cliente, @abogado)";
                    cmd.Parameters.AddWithValue("@inicio", inicio);
                    cmd.Parameters.AddWithValue("@final", finalDate);
                    cmd.Parameters.AddWithValue("@estatus", estatusId);
                    cmd.Parameters.AddWithValue("@cliente", clienteId);
                    cmd.Parameters.AddWithValue("@abogado", abogadoId);

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        Response.Redirect("Casos.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        lblMessage.Text = "No se pudo guardar el caso.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error al guardar: " + ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Casos.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}