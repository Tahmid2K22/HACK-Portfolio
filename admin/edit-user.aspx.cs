using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio.admin
{
    public partial class edit_user : System.Web.UI.Page
    {
        private int UserId
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
                if (UserId > 0)
                {
                    lblPageTitle.Text = "Edit User";
                    LoadUser();
                }
                else
                {
                    lblPageTitle.Text = "Add New User";
                }
            }
        }

        private void LoadUser()
        {
            try
            {
                string query = "SELECT * FROM Users WHERE UserID = @id";
                DataTable dt = DatabaseHelper.ExecuteQuery(query, new MySqlParameter[] { new MySqlParameter("@id", UserId) });

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    txtUsername.Text = row["Username"].ToString();
                    txtEmail.Text = row["Email"].ToString();
                    ddlRole.SelectedValue = row["Role"].ToString();
                    chkIsActive.Checked = row["IsActive"] != DBNull.Value && (sbyte)row["IsActive"] == 1;
                    chkIsEmailVerified.Checked = row["IsEmailVerified"] != DBNull.Value && (sbyte)row["IsEmailVerified"] == 1;
                    txtFirstName.Text = row["FirstName"].ToString();
                    txtLastName.Text = row["LastName"].ToString();
                    txtPhoneNumber.Text = row["PhoneNumber"] != DBNull.Value ? row["PhoneNumber"].ToString() : "";
                    txtStudentID.Text = row["StudentID"] != DBNull.Value ? row["StudentID"].ToString() : "";
                    txtDepartment.Text = row["Department"] != DBNull.Value ? row["Department"].ToString() : "";
                    txtYearOfStudy.Text = row["YearOfStudy"] != DBNull.Value ? row["YearOfStudy"].ToString() : "";
                    txtBio.Text = row["Bio"] != DBNull.Value ? row["Bio"].ToString() : "";
                    txtSkills.Text = row["Skills"] != DBNull.Value ? row["Skills"].ToString() : "";
                    txtProfileImageUrl.Text = row["ProfileImageUrl"] != DBNull.Value ? row["ProfileImageUrl"].ToString() : "";
                    txtLinkedInUrl.Text = row["LinkedInUrl"] != DBNull.Value ? row["LinkedInUrl"].ToString() : "";
                    txtGitHubUrl.Text = row["GitHubUrl"] != DBNull.Value ? row["GitHubUrl"].ToString() : "";
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load user error: " + ex.Message);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    return;
                }

                if (UserId > 0)
                {
                    string query = @"UPDATE Users SET 
                        Username = @username, Email = @email, Role = @role,
                        IsActive = @isActive, IsEmailVerified = @isEmailVerified,
                        FirstName = @firstName, LastName = @lastName,
                        PhoneNumber = @phoneNumber, StudentID = @studentId,
                        Department = @department, YearOfStudy = @yearOfStudy,
                        Bio = @bio, Skills = @skills,
                        ProfileImageUrl = @profileImageUrl,
                        LinkedInUrl = @linkedInUrl, GitHubUrl = @gitHubUrl
                        WHERE UserID = @id";

                    DatabaseHelper.ExecuteNonQuery(query, new MySqlParameter[]
                    {
                        new MySqlParameter("@username", txtUsername.Text.Trim()),
                        new MySqlParameter("@email", txtEmail.Text.Trim()),
                        new MySqlParameter("@role", ddlRole.SelectedValue),
                        new MySqlParameter("@isActive", chkIsActive.Checked ? 1 : 0),
                        new MySqlParameter("@isEmailVerified", chkIsEmailVerified.Checked ? 1 : 0),
                        new MySqlParameter("@firstName", txtFirstName.Text.Trim()),
                        new MySqlParameter("@lastName", txtLastName.Text.Trim()),
                        new MySqlParameter("@phoneNumber", txtPhoneNumber.Text.Trim()),
                        new MySqlParameter("@studentId", txtStudentID.Text.Trim()),
                        new MySqlParameter("@department", txtDepartment.Text.Trim()),
                        new MySqlParameter("@yearOfStudy", string.IsNullOrEmpty(txtYearOfStudy.Text) ? (object)DBNull.Value : int.Parse(txtYearOfStudy.Text)),
                        new MySqlParameter("@bio", txtBio.Text.Trim()),
                        new MySqlParameter("@skills", txtSkills.Text.Trim()),
                        new MySqlParameter("@profileImageUrl", txtProfileImageUrl.Text.Trim()),
                        new MySqlParameter("@linkedInUrl", txtLinkedInUrl.Text.Trim()),
                        new MySqlParameter("@gitHubUrl", txtGitHubUrl.Text.Trim()),
                        new MySqlParameter("@id", UserId)
                    });
                }

                pnlSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                pnlSuccessMessage.Visible = false;
                System.Diagnostics.Debug.WriteLine("Save user error: " + ex.Message);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/manage-users.aspx");
        }
    }
}
