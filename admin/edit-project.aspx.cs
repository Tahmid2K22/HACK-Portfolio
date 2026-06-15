using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio.admin
{
    public partial class edit_project : System.Web.UI.Page
    {
        private int ProjectId
        {
            get { return Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"]) : 0; }
        }

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

                if (ProjectId > 0)
                {
                    lblPageTitle.Text = "Edit Project";
                    LoadProject();
                }
                else
                {
                    lblPageTitle.Text = "Add New Project";
                }
            }
        }

        private void LoadCategories()
        {
            try
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories ORDER BY DisplayOrder";
                DataTable dt = DatabaseHelper.ExecuteQuery(query);

                ddlCategory.Items.Clear();
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

        private void LoadProject()
        {
            try
            {
                string query = "SELECT * FROM Projects WHERE ProjectID = @id";
                DataTable dt = DatabaseHelper.ExecuteQuery(query, new MySqlParameter[] { new MySqlParameter("@id", ProjectId) });

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    txtProjectName.Text = row["ProjectName"].ToString();
                    ddlCategory.SelectedValue = row["CategoryID"].ToString();
                    ddlStatus.SelectedValue = row["Status"].ToString();
                    txtShortDescription.Text = row["ShortDescription"].ToString();
                    txtDetailedDescription.Text = row["DetailedDescription"] != DBNull.Value ? row["DetailedDescription"].ToString() : "";
                    txtThumbnailUrl.Text = row["ThumbnailImageUrl"] != DBNull.Value ? row["ThumbnailImageUrl"].ToString() : "";
                    txtCoverImageUrl.Text = row["CoverImageUrl"] != DBNull.Value ? row["CoverImageUrl"].ToString() : "";
                    txtDemoUrl.Text = row["DemoUrl"] != DBNull.Value ? row["DemoUrl"].ToString() : "";
                    txtGitHubUrl.Text = row["GitHubUrl"] != DBNull.Value ? row["GitHubUrl"].ToString() : "";
                    txtVideoUrl.Text = row["VideoUrl"] != DBNull.Value ? row["VideoUrl"].ToString() : "";
                    txtTechnologies.Text = row["Technologies"] != DBNull.Value ? row["Technologies"].ToString() : "";
                    txtTags.Text = row["Tags"] != DBNull.Value ? row["Tags"].ToString() : "";
                    chkIsFeatured.Checked = row["IsFeatured"] != DBNull.Value && (sbyte)row["IsFeatured"] == 1;
                    chkIsPublished.Checked = row["IsPublished"] != DBNull.Value && (sbyte)row["IsPublished"] == 1;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load project error: " + ex.Message);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtProjectName.Text))
                {
                    return;
                }

                string slug = txtProjectName.Text.Trim().ToLower().Replace(" ", "-");
                slug = System.Text.RegularExpressions.Regex.Replace(slug, @"[^a-z0-9\-]", "");

                if (ProjectId > 0)
                {
                    string query = @"UPDATE Projects SET 
                        ProjectName = @name, Slug = @slug, ShortDescription = @shortDesc, 
                        DetailedDescription = @detailedDesc, CategoryID = @categoryId, Status = @status,
                        ThumbnailImageUrl = @thumbUrl, CoverImageUrl = @coverUrl,
                        DemoUrl = @demoUrl, GitHubUrl = @githubUrl, VideoUrl = @videoUrl,
                        Technologies = @technologies, Tags = @tags,
                        IsFeatured = @isFeatured, IsPublished = @isPublished,
                        ModifiedDate = NOW()
                        WHERE ProjectID = @id";

                    DatabaseHelper.ExecuteNonQuery(query, new MySqlParameter[]
                    {
                        new MySqlParameter("@name", txtProjectName.Text.Trim()),
                        new MySqlParameter("@slug", slug),
                        new MySqlParameter("@shortDesc", txtShortDescription.Text.Trim()),
                        new MySqlParameter("@detailedDesc", txtDetailedDescription.Text.Trim()),
                        new MySqlParameter("@categoryId", int.Parse(ddlCategory.SelectedValue)),
                        new MySqlParameter("@status", ddlStatus.SelectedValue),
                        new MySqlParameter("@thumbUrl", txtThumbnailUrl.Text.Trim()),
                        new MySqlParameter("@coverUrl", txtCoverImageUrl.Text.Trim()),
                        new MySqlParameter("@demoUrl", txtDemoUrl.Text.Trim()),
                        new MySqlParameter("@githubUrl", txtGitHubUrl.Text.Trim()),
                        new MySqlParameter("@videoUrl", txtVideoUrl.Text.Trim()),
                        new MySqlParameter("@technologies", txtTechnologies.Text.Trim()),
                        new MySqlParameter("@tags", txtTags.Text.Trim()),
                        new MySqlParameter("@isFeatured", chkIsFeatured.Checked ? 1 : 0),
                        new MySqlParameter("@isPublished", chkIsPublished.Checked ? 1 : 0),
                        new MySqlParameter("@id", ProjectId)
                    });
                }
                else
                {
                    int userId = Session["UserID"] != null ? int.Parse(Session["UserID"].ToString()) : 1;

                    string query = @"INSERT INTO Projects 
                        (ProjectName, Slug, ShortDescription, DetailedDescription, CategoryID, Status,
                         ThumbnailImageUrl, CoverImageUrl, DemoUrl, GitHubUrl, VideoUrl,
                         Technologies, Tags, IsFeatured, IsPublished, CreatedByUserID, CreatedDate)
                        VALUES 
                        (@name, @slug, @shortDesc, @detailedDesc, @categoryId, @status,
                         @thumbUrl, @coverUrl, @demoUrl, @githubUrl, @videoUrl,
                         @technologies, @tags, @isFeatured, @isPublished, @createdBy, NOW())";

                    DatabaseHelper.ExecuteNonQuery(query, new MySqlParameter[]
                    {
                        new MySqlParameter("@name", txtProjectName.Text.Trim()),
                        new MySqlParameter("@slug", slug),
                        new MySqlParameter("@shortDesc", txtShortDescription.Text.Trim()),
                        new MySqlParameter("@detailedDesc", txtDetailedDescription.Text.Trim()),
                        new MySqlParameter("@categoryId", int.Parse(ddlCategory.SelectedValue)),
                        new MySqlParameter("@status", ddlStatus.SelectedValue),
                        new MySqlParameter("@thumbUrl", txtThumbnailUrl.Text.Trim()),
                        new MySqlParameter("@coverUrl", txtCoverImageUrl.Text.Trim()),
                        new MySqlParameter("@demoUrl", txtDemoUrl.Text.Trim()),
                        new MySqlParameter("@githubUrl", txtGitHubUrl.Text.Trim()),
                        new MySqlParameter("@videoUrl", txtVideoUrl.Text.Trim()),
                        new MySqlParameter("@technologies", txtTechnologies.Text.Trim()),
                        new MySqlParameter("@tags", txtTags.Text.Trim()),
                        new MySqlParameter("@isFeatured", chkIsFeatured.Checked ? 1 : 0),
                        new MySqlParameter("@isPublished", chkIsPublished.Checked ? 1 : 0),
                        new MySqlParameter("@createdBy", userId)
                    });
                }

                pnlSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                pnlSuccessMessage.Visible = false;
                System.Diagnostics.Debug.WriteLine("Save project error: " + ex.Message);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/manage-projects.aspx");
        }
    }
}
