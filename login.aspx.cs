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
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validation
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                loginStatus.Text = "Please enter both email and password.";
                loginStatus.CssClass = "status error";
                return;
            }

            try
            {
                // Hash the password for comparison
                string hashedPassword = DatabaseHelper.HashPassword(password);

                // Query to check credentials
                string query = @"SELECT UserID, Username, FirstName, LastName, Email, Role, IsActive, IsEmailVerified
                                 FROM Users
                                 WHERE Email = @Email AND PasswordHash = @Password";

                MySqlParameter[] parameters = {
                    new MySqlParameter("@Email", email),
                    new MySqlParameter("@Password", hashedPassword)
                };

                DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters);

                if (dt.Rows.Count > 0)
                {
                    DataRow user = dt.Rows[0];

                    // Check if account is active
                    bool isActive = Convert.ToBoolean(user["IsActive"]);
                    if (!isActive)
                    {
                        loginStatus.Text = "Your account has been deactivated. Please contact an administrator.";
                        loginStatus.CssClass = "status error";
                        return;
                    }

                    // Check if email is verified (optional - can skip if not using email verification)
                    bool isEmailVerified = Convert.ToBoolean(user["IsEmailVerified"]);
                    if (!isEmailVerified)
                    {
                        loginStatus.Text = "Please verify your email address before logging in.";
                        loginStatus.CssClass = "status error";
                        return;
                    }

                    // Set session variables
                    Session["UserID"] = user["UserID"];
                    Session["Username"] = user["Username"];
                    Session["FirstName"] = user["FirstName"];
                    Session["LastName"] = user["LastName"];
                    Session["Email"] = user["Email"];
                    Session["Role"] = user["Role"];
                    Session["IsAdmin"] = user["Role"].ToString() == "Admin";

                    // Success message
                    loginStatus.Text = "Login successful! Redirecting...";
                    loginStatus.CssClass = "status success";

                    // Redirect to profile page
                    Response.AddHeader("REFRESH", "1;URL=profile.aspx");
                }
                else
                {
                    // Invalid credentials
                    loginStatus.Text = "Invalid email or password. Please try again.";
                    loginStatus.CssClass = "status error";
                }
            }
            catch (Exception ex)
            {
                // Handle errors
                loginStatus.Text = "Login error: " + ex.Message;
                loginStatus.CssClass = "status error";
            }
        }
    }
}
