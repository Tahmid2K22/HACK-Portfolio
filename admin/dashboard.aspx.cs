using System;
using System.Data;
using MySql.Data.MySqlClient;
using HACK_portfolio;

namespace HACK_portfolio.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated as admin
            if (!AuthHelper.IsAdmin(Session))
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
                object totalProjects = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Projects");
                lblTotalProjects.Text = totalProjects != null ? totalProjects.ToString() : "0";

                object totalUsers = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Users");
                lblTotalUsers.Text = totalUsers != null ? totalUsers.ToString() : "0";

                object activeProjects = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM Projects WHERE Status = 'Active'");
                lblActiveProjects.Text = activeProjects != null ? activeProjects.ToString() : "0";

                object pendingRequests = DatabaseHelper.ExecuteScalar("SELECT COUNT(*) FROM MembershipRequests WHERE Status = 'Pending'");
                lblPendingRequests.Text = pendingRequests != null ? pendingRequests.ToString() : "0";

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
            switch (value)
            {
                case "active":
                    return "badge-success";
                case "pending":
                    return "badge-warning";
                case "completed":
                    return "badge-info";
                case "inactive":
                    return "badge-danger";
                default:
                    return "badge-secondary";
            }
        }

        public string GetRoleBadgeClass(object role)
        {
            if (role == null) return "badge-secondary";
            string value = role.ToString().ToLowerInvariant();
            switch (value)
            {
                case "admin":
                    return "badge-danger";
                case "member":
                    return "badge-info";
                case "guest":
                    return "badge-warning";
                default:
                    return "badge-secondary";
            }
        }
    }
}
