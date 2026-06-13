using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio
{
    public partial class _Default : System.Web.UI.Page
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
                string query = @"SELECT 
                                                p.ProjectID, 
                                                p.ProjectName, 
                                                p.ShortDescription, 
                                                p.ThumbnailImageUrl, 
                                                p.IsFeatured, 
                                                p.IsPublished, 
                                                p.CreatedDate, 
                                                c.CategoryName 
                                            FROM projects p 
                                            INNER JOIN Categories c ON p.CategoryID = c.CategoryID 
                                            WHERE p.IsPublished = 1 
                                            ORDER BY p.IsFeatured DESC, p.CreatedDate DESC
                                            LIMIT 4";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                ProjectsRepeater.DataSource = dt;
                ProjectsRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Handle error - could log or display message
                Response.Write("<script>console.error('Error loading projects: " + ex.Message + "');</script>");
            }
        }
    }
}
