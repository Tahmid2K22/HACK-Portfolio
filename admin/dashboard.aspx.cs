using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated as admin
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
                LoadRecentProjects();
                LoadRecentMembers();
            }
        }

        private void LoadDashboardData()
        {
            try
            {
                lblTotalProjects.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Projects")?.ToString() ?? "0";
                lblTotalUsers.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Users")?.ToString() ?? "0";
                lblActiveProjects.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Projects WHERE Status = 'Active'")?.ToString() ?? "0";
                lblPendingRequests.Text = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM MembershipRequests WHERE Status = 'Pending'")?.ToString() ?? "0";

                if (Session["FirstName"] != null)
                {
                    lblAdminName.Text = Session["FirstName"].ToString();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Dashboard error: " + ex.Message);
            }
        }

        private void LoadRecentProjects()
        {
            try
            {
                string query = @"SELECT p.ProjectName, c.CategoryName, p.Status, DATE_FORMAT(p.CreatedDate, '%Y-%m-%d') AS CreatedDate
                    FROM Projects p
                    LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
                    ORDER BY p.CreatedDate DESC
                    LIMIT 5";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                rptRecentProjects.DataSource = dt;
                rptRecentProjects.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadRecentProjects error: " + ex.Message);
            }
        }

        private void LoadRecentMembers()
        {
            try
            {
                string query = @"SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Email, Role,
                    CASE WHEN IsActive = 1 THEN 'Active' ELSE 'Inactive' END AS Status
                    FROM Users
                    ORDER BY CreatedDate DESC
                    LIMIT 5";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                rptRecentMembers.DataSource = dt;
                rptRecentMembers.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadRecentMembers error: " + ex.Message);
            }
        }

        public string GetStatusBadgeClass(object status)
        {
            if (status == null) return "badge-secondary";
            string value = status.ToString().ToLowerInvariant();
            return value switch
            {
                "active" => "badge-success",
                "pending" => "badge-warning",
                "completed" => "badge-info",
                "inactive" => "badge-danger",
                _ => "badge-secondary",
            };
        }

        public string GetRoleBadgeClass(object role)
        {
            if (role == null) return "badge-secondary";
            string value = role.ToString().ToLowerInvariant();
            return value switch
            {
                "admin" => "badge-danger",
                "member" => "badge-info",
                "guest" => "badge-warning",
                _ => "badge-secondary",
            };
        }
    }
}
