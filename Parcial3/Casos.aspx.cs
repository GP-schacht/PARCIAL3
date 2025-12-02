using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuffeteWeb
{
    public partial class Casos : System.Web.UI.Page
    {
        string connectionString = "Server=LAPTOP-7RHH446U\\SQLEXPRESS;Database=BUFFETEDB;Trusted_Connection=True;TrustServerCertificate=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCasos();
            }
        }

        private void CargarCasos()
        {
            // Load into a DataTable to avoid issues with closed connection when binding
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = @"
                    SELECT c.caso_id, c.inicio_dte, c.final_dte, e.estatus_dsc
                    FROM CASOS c
                    INNER JOIN ESTATUS_MST e ON c.estatus_id = e.estatus_id
                    ORDER BY c.caso_id";
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            gvCasos.DataSource = dt;
            gvCasos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // Simple example: filter by client name if your DB has such field;
            // left as TODO if schema differs. For now reload all.
            CargarCasos();
        }

        protected void gvCasos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Guard against missing or non-integer CommandArgument
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out int index))
                return;

            if (index < 0 || index >= gvCasos.DataKeys.Count)
                return;

            string casoId = gvCasos.DataKeys[index].Value.ToString();

            if (e.CommandName == "Detalle")
            {
                Response.Redirect($"CasoDetalle.aspx?caso_id={HttpUtility.UrlEncode(casoId)}");
            }
            else if (e.CommandName == "Editar")
            {
                Response.Redirect($"CasoEditar.aspx?caso_id={HttpUtility.UrlEncode(casoId)}");
            }
            else if (e.CommandName == "Eliminar")
            {
                // Example deletion: execute DELETE then reload grid (confirm client-side already)
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "DELETE FROM CASOS WHERE caso_id = @id";
                    cmd.Parameters.AddWithValue("@id", casoId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                CargarCasos();
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CasoNuevo.aspx");
        }
    }
}