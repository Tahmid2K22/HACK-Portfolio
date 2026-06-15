using System;
using System.Data;

namespace HACK_portfolio
{
    public partial class ProjectPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int projectId = 0;
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out projectId);
                }

                if (projectId > 0)
                {
                    LoadProject(projectId);
                }
                else
                {
                    pnlNotFound.Visible = true;
                }
            }
        }

        private void LoadProject(int projectId)
        {
            try
            {
                string query = @"SELECT p.ProjectID, p.ProjectName, p.ShortDescription, p.DetailedDescription,
                    p.ThumbnailImageUrl, p.CoverImageUrl, p.DemoUrl, p.GitHubUrl, p.VideoUrl,
                    p.Technologies, p.Tags, p.Status, p.IsFeatured, p.IsPublished, p.CreatedDate,
                    c.CategoryName
                    FROM Projects p
                    INNER JOIN Categories c ON p.CategoryID = c.CategoryID
                    WHERE p.ProjectID = @id AND p.IsPublished = 1";

                DataTable dt = DatabaseHelper.ExecuteQuery(query, new MySql.Data.MySqlClient.MySqlParameter[] {
                    new MySql.Data.MySqlClient.MySqlParameter("@id", projectId)
                });

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    string imageUrl = row["ThumbnailImageUrl"] != DBNull.Value ? row["ThumbnailImageUrl"].ToString() : "";
                    if (!string.IsNullOrEmpty(imageUrl))
                    {
                        projImage.ImageUrl = imageUrl;
                    }
                    else
                    {
                        projImage.ImageUrl = "~/img/image.png";
                    }

                    projTitle.InnerText = row["ProjectName"].ToString();
                    projCategory.InnerText = row["CategoryName"].ToString().ToUpper();
                    projDescription.InnerText = row["ShortDescription"] != DBNull.Value ? row["ShortDescription"].ToString() : "";

                    string detailedDesc = row["DetailedDescription"] != DBNull.Value ? row["DetailedDescription"].ToString() : "";
                    pnlDetails.Controls.Add(new System.Web.UI.LiteralControl(detailedDesc));

                    string technologies = row["Technologies"] != DBNull.Value ? row["Technologies"].ToString() : "";
                    if (!string.IsNullOrEmpty(technologies))
                    {
                        projTechnologies.InnerText = technologies;
                    }
                    else
                    {
                        pnlTechnologies.Visible = false;
                    }

                    string demoUrl = row["DemoUrl"] != DBNull.Value ? row["DemoUrl"].ToString() : "";
                    if (!string.IsNullOrEmpty(demoUrl))
                    {
                        projDemo.NavigateUrl = demoUrl;
                        projDemo.Visible = true;
                    }

                    string githubUrl = row["GitHubUrl"] != DBNull.Value ? row["GitHubUrl"].ToString() : "";
                    if (!string.IsNullOrEmpty(githubUrl))
                    {
                        projGit.NavigateUrl = githubUrl;
                        projGit.Visible = true;
                    }

                    string videoUrl = row["VideoUrl"] != DBNull.Value ? row["VideoUrl"].ToString() : "";
                    if (!string.IsNullOrEmpty(videoUrl))
                    {
                        projVideo.NavigateUrl = videoUrl;
                        projVideo.Visible = true;
                    }
                }
                else
                {
                    pnlNotFound.Visible = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load project error: " + ex.Message);
                pnlNotFound.Visible = true;
            }
        }
    }
}
