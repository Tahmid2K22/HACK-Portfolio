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
                    profileName.InnerText = user["FirstName"].ToString() + " " + user["LastName"].ToString();
                    profileEmail.InnerText = user["Email"].ToString();
                    profileDepartment.InnerText = user["Department"].ToString();
                    profileYearLevel.InnerText = user["YearLevel"] != DBNull.Value ? user["YearLevel"].ToString() : "-";
                    profileInterest.InnerText = user["Interests"] != DBNull.Value ? user["Interests"].ToString() : "-";
                    profileCreated.InnerText = user["JoinDate"] != DBNull.Value ? Convert.ToDateTime(user["JoinDate"]).ToString("MMM dd, yyyy") : "-";
                    profileBio.InnerText = user["Bio"] != DBNull.Value ? user["Bio"].ToString() : "-";
                    profileStatus.Text = "Active Member";
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
