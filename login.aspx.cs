using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if already logged in
                if (Session["UserID"] != null)
                {
                    Response.Redirect("~/profile.aspx");
                }
            }

            btnSignIn.Click += BtnSignIn_Click;
        }

        private void BtnSignIn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                loginStatus.Text = "Please enter both email and password.";
                loginStatus.CssClass = "status error";
                return;
            }

            try
            {
                string hashedPassword = DatabaseHelper.HashPassword(password);
                string query = "SELECT UserID, Username, FirstName, LastName, Role, IsActive FROM Users WHERE Email = @Email AND PasswordHash = @Password";

                MySqlParameter[] parameters = {
                    new MySqlParameter("@Email", email),
                    new MySqlParameter("@Password", hashedPassword)
                };

                DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters);

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    bool isActive = Convert.ToBoolean(row["IsActive"]);

                    if (!isActive)
                    {
                        loginStatus.Text = "Your account is inactive. Please contact admin.";
                        loginStatus.CssClass = "status error";
                        return;
                    }

                    // Store user info in session
                    Session["UserID"] = row["UserID"];
                    Session["Username"] = row["Username"];
                    Session["FirstName"] = row["FirstName"];
                    Session["LastName"] = row["LastName"];
                    Session["Role"] = row["Role"];
                    Session["IsAdmin"] = row["Role"].ToString() == "Admin";

                    // Update last login date
                    string updateQuery = "UPDATE Users SET LastLoginDate = NOW() WHERE UserID = @UserID";
                    MySqlParameter[] updateParams = { new MySqlParameter("@UserID", row["UserID"]) };
                    DatabaseHelper.ExecuteNonQuery(updateQuery, updateParams);

                    // Redirect based on role
                    if (row["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("~/admin/dashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/profile.aspx");
                    }
                }
                else
                {
                    loginStatus.Text = "Invalid email or password.";
                    loginStatus.CssClass = "status error";
                }
            }
            catch (Exception ex)
            {
                loginStatus.Text = "Login error: " + ex.Message;
                loginStatus.CssClass = "status error";
            }
        }
    }
}
