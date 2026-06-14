using System;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace HACK_portfolio.admin
{
    public partial class manage_projects : System.Web.UI.Page
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
                LoadCategories();
                LoadProjects();
            }

            ddlCategory.SelectedIndexChanged += FilterChanged;
            ddlStatus.SelectedIndexChanged += FilterChanged;
        }

        private void LoadCategories()
        {
            try
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories ORDER BY DisplayOrder";
                DataTable dt = DatabaseHelper.ExecuteQuery(query);

                ddlCategory.Items.Clear();
                ddlCategory.Items.Add(new ListItem("All Categories", "all"));

                foreach (DataRow row in dt.Rows)
                {
                    ddlCategory.Items.Add(new ListItem(row["CategoryName"].ToString(), row["CategoryID"].ToString()));
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load categories error: " + ex.Message);
            }
        }

        private void LoadProjects()
        {
            try
            {
                string query = @"SELECT p.ProjectID, p.ProjectName, p.Status, p.CreatedDate,
                    c.CategoryName, COUNT(DISTINCT pm.UserID) as MemberCount
                    FROM Projects p
                    INNER JOIN Categories c ON p.CategoryID = c.CategoryID
                    LEFT JOIN ProjectMembers pm ON p.ProjectID = pm.ProjectID
                    WHERE 1=1";

                // Apply filters
                if (ddlCategory.SelectedValue != "all")
                {
                    query += " AND p.CategoryID = " + ddlCategory.SelectedValue;
                }

                if (ddlStatus.SelectedValue != "all")
                {
                    query += " AND p.Status = '" + ddlStatus.SelectedValue + "'";
                }

                query += " GROUP BY p.ProjectID ORDER BY p.CreatedDate DESC";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);

                // Bind to a repeater or gridview if you have one
                // For now, just store in ViewState
                ViewState["ProjectsData"] = dt;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load projects error: " + ex.Message);
            }
        }

        private void FilterChanged(object sender, EventArgs e)
        {
            LoadProjects();
        }

        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            // Redirect to add project page
            Response.Redirect("~/admin/edit-project.aspx");
        }
    }
}
