using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio.admin
{
    public partial class manage_projects : System.Web.UI.Page
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
                LoadCategories();
                LoadProjects();
            }
        }

        private void LoadCategories()
        {
            try
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories ORDER BY DisplayOrder";
                DataTable dt = DatabaseHelper.ExecuteQuery(query);

                ddlCategory.Items.Clear();
                ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem("All Categories", "all"));

                foreach (DataRow row in dt.Rows)
                {
                    ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem(row["CategoryName"].ToString(), row["CategoryID"].ToString()));
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

                var parameters = new List<MySqlParameter>();

                if (ddlCategory.SelectedValue != "all")
                {
                    query += " AND p.CategoryID = @categoryId";
                    parameters.Add(new MySqlParameter("@categoryId", int.Parse(ddlCategory.SelectedValue)));
                }

                if (ddlStatus.SelectedValue != "all")
                {
                    query += " AND p.Status = @status";
                    parameters.Add(new MySqlParameter("@status", ddlStatus.SelectedValue));
                }

                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    query += " AND (p.ProjectName LIKE @search)";
                    parameters.Add(new MySqlParameter("@search", "%" + txtSearch.Text.Trim() + "%"));
                }

                query += " GROUP BY p.ProjectID ORDER BY p.CreatedDate DESC";

                DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters.ToArray());
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load projects error: " + ex.Message);
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProjects();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProjects();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadProjects();
        }

        protected void btnDeleteProject_Click(object sender, EventArgs e)
        {
            try
            {
                var btn = (System.Web.UI.WebControls.LinkButton)sender;
                int projectId = int.Parse(btn.CommandArgument);
                DatabaseHelper.ExecuteNonQuery("DELETE FROM Projects WHERE ProjectID = @id",
                    new MySqlParameter[] { new MySqlParameter("@id", projectId) });
                LoadProjects();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting project: " + ex.Message);
            }
        }

        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/edit-project.aspx");
        }

        protected string GetStatusBadgeClass(object status)
        {
            if (status == null) return "badge-info";
            string s = status.ToString().ToLower();
            if (s == "active") return "badge-success";
            if (s == "pending") return "badge-warning";
            if (s == "completed") return "badge-info";
            if (s == "archived") return "badge-secondary";
            return "badge-info";
        }
    }
}
