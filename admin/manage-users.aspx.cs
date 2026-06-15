using System;
using System.Data;
using System.Text;

namespace HACK_portfolio.admin
{
    public partial class manage_users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin(Session))
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            try
            {
                StringBuilder query = new StringBuilder();
                query.Append("SELECT UserID, Username, Email, FirstName, LastName, Role, IsActive, JoinDate FROM Users WHERE 1=1");

                if (ddlRole.SelectedValue != "all")
                {
                    query.Append(" AND Role = @role");
                }

                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    query.Append(" AND (FirstName LIKE @search OR LastName LIKE @search OR Email LIKE @search OR Username LIKE @search)");
                }

                query.Append(" ORDER BY JoinDate DESC");

                var parameters = new System.Collections.Generic.List<MySql.Data.MySqlClient.MySqlParameter>();

                if (ddlRole.SelectedValue != "all")
                {
                    parameters.Add(new MySql.Data.MySqlClient.MySqlParameter("@role", ddlRole.SelectedValue));
                }

                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    parameters.Add(new MySql.Data.MySqlClient.MySqlParameter("@search", "%" + txtSearch.Text.Trim() + "%"));
                }

                DataTable dt = DatabaseHelper.ExecuteQuery(query.ToString(), parameters.ToArray());
                rptUsers.DataSource = dt;
                rptUsers.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading users: " + ex.Message);
            }
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUsers();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers();
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            try
            {
                var btn = (System.Web.UI.WebControls.LinkButton)sender;
                int userId = int.Parse(btn.CommandArgument);
                DatabaseHelper.ExecuteNonQuery("DELETE FROM Users WHERE UserID = @id",
                    new MySql.Data.MySqlClient.MySqlParameter[] {
                        new MySql.Data.MySqlClient.MySqlParameter("@id", userId)
                    });
                LoadUsers();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting user: " + ex.Message);
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/edit-user.aspx");
        }

        protected string GetRoleBadgeClass(object role)
        {
            if (role == null) return "badge-info";
            string r = role.ToString().ToLower();
            if (r == "admin") return "badge-danger";
            if (r == "member") return "badge-info";
            return "badge-secondary";
        }
    }
}
