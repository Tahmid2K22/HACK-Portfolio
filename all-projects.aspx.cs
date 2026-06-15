using System;
using System.Data;

namespace HACK_portfolio
{
    public partial class AllProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            try
            {
                string query = @"SELECT p.ProjectID, p.ProjectName, p.ShortDescription, p.ThumbnailImageUrl,
                    c.CategoryName
                    FROM Projects p
                    INNER JOIN Categories c ON p.CategoryID = c.CategoryID
                    WHERE p.IsPublished = 1
                    ORDER BY p.IsFeatured DESC, p.CreatedDate DESC";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                ProjectsRepeater.DataSource = dt;
                ProjectsRepeater.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.error('Error loading projects: " + ex.Message + "');</script>");
            }
        }
    }
}
