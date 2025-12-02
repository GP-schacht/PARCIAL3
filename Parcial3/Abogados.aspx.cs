using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Parcial3
{
    public partial class Abogados : Page
    {
        private readonly string connectionString = "Server=LAPTOP-7RHH446U\\SQLEXPRESS;Database=BUFFETEDB;Trusted_Connection=True;TrustServerCertificate=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAbogados();
            }
        }

        private void LoadAbogados()
        {
            lblError.Text = string.Empty;
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT abogado_id, abogado_nom FROM ABOGADOS ORDER BY abogado_nom";
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }

                gvAbogados.DataSource = dt;
                gvAbogados.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Error cargando abogados: " + ex.Message;
            }
        }

        protected void gvAbogados_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvAbogados.PageIndex = e.NewPageIndex;
            LoadAbogados();
        }
    }
}