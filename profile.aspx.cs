using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                string query = "SELECT * FROM Users WHERE UserID = @UserID";
                MySqlParameter[] parameters = new MySqlParameter[]
                {
                    new MySqlParameter("@UserID", userId)
                };

                DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters);

                if (dt.Rows.Count > 0)
                {
                    DataRow user = dt.Rows[0];

                    // Get user data
                    string firstName = user["FirstName"].ToString();
                    string lastName = user["LastName"].ToString();
                    string fullName = firstName + " " + lastName;
                    string email = user["Email"].ToString();
                    string role = user["Role"].ToString();

                    // Profile header
                    profileName.InnerText = fullName;
                    profileEmail.InnerText = email;

                    // Avatar initials
                    string initials = "";
                    if (!string.IsNullOrEmpty(firstName)) initials += firstName[0];
                    if (!string.IsNullOrEmpty(lastName)) initials += lastName[0];
                    avatarInitials.InnerText = initials.ToUpper();

                    // Role badge
                    profileRoleBadge.InnerText = role;
                    if (AuthHelper.IsAdmin(Session))
                    {
                        profileRoleBadge.Attributes["class"] = "role-badge role-admin";
                        adminLink.Visible = true;
                    }

                    // Profile details
                    profileDepartment.InnerText = user["Department"] != DBNull.Value && !string.IsNullOrEmpty(user["Department"].ToString())
                        ? user["Department"].ToString() : "Not specified";
                    profileYearLevel.InnerText = user["YearOfStudy"] != DBNull.Value && user["YearOfStudy"].ToString() != ""
                        ? user["YearOfStudy"].ToString() : "Not specified";
                    profileInterest.InnerText = user["Skills"] != DBNull.Value && !string.IsNullOrEmpty(user["Skills"].ToString())
                        ? user["Skills"].ToString() : "Not specified";
                    profileCreated.InnerText = user["JoinDate"] != DBNull.Value
                        ? Convert.ToDateTime(user["JoinDate"]).ToString("MMMM dd, yyyy") : "Unknown";
                    profileBio.InnerText = user["Bio"] != DBNull.Value && !string.IsNullOrEmpty(user["Bio"].ToString())
                        ? user["Bio"].ToString() : "No bio provided yet.";
                }
            }
            catch (Exception ex)
            {
                // Handle error
                Response.Write("<script>console.error('Error loading profile: " + ex.Message + "');</script>");
                profileStatus.Text = "Error loading profile";
            }
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}
