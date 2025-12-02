using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Parcial3
{
    public partial class Clientes : Page
    {
        private readonly string connectionString = "Server=LAPTOP-7RHH446U\\SQLEXPRESS;Database=BUFFETEDB;Trusted_Connection=True;TrustServerCertificate=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClientes();
            }
        }

        private void LoadClientes()
        {
            lblError.Text = string.Empty;
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT cliente_id, cliente_nom FROM CLIENTES ORDER BY cliente_nom";
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }

                gvClientes.DataSource = dt;
                gvClientes.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Error cargando clientes: " + ex.Message;
            }
        }

        protected void gvClientes_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvClientes.PageIndex = e.NewPageIndex;
            LoadClientes();
        }
    }
}