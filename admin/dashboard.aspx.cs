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
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            try
            {
                // Total Projects
                string projectsQuery = "SELECT COUNT(*) FROM Projects";
                lblTotalProjects.Text = DatabaseHelper.ExecuteScalar(projectsQuery)?.ToString() ?? "0";

                // Total Users
                string usersQuery = "SELECT COUNT(*) FROM Users WHERE Role = 'Member'";
                lblTotalUsers.Text = DatabaseHelper.ExecuteScalar(usersQuery)?.ToString() ?? "0";

                // Active Projects
                string activeQuery = "SELECT COUNT(*) FROM Projects WHERE Status = 'Active'";
                lblActiveProjects.Text = DatabaseHelper.ExecuteScalar(activeQuery)?.ToString() ?? "0";

                // Pending Requests
                string pendingQuery = "SELECT COUNT(*) FROM MembershipRequests WHERE Status = 'Pending'";
                lblPendingRequests.Text = DatabaseHelper.ExecuteScalar(pendingQuery)?.ToString() ?? "0";

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
    }
}
