using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio
{
    public partial class Register : System.Web.UI.Page
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

            btnCreateAccount.Click += BtnCreateAccount_Click;
        }

        private void BtnCreateAccount_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string department = txtDepartment.Text.Trim();
            string yearLevel = txtYearLevel.Text.Trim();
            string interest = ddlInterest.SelectedValue;
            string bio = txtBio.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Validation
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                registerStatus.Text = "Please fill in all required fields.";
                registerStatus.CssClass = "status error";
                return;
            }

            if (password != confirmPassword)
            {
                registerStatus.Text = "Passwords do not match.";
                registerStatus.CssClass = "status error";
                return;
            }

            if (password.Length < 6)
            {
                registerStatus.Text = "Password must be at least 6 characters long.";
                registerStatus.CssClass = "status error";
                return;
            }

            try
            {
                // Split full name into first and last name
                string[] nameParts = fullName.Split(new char[] { ' ' }, 2);
                string firstName = nameParts[0];
                string lastName = nameParts.Length > 1 ? nameParts[1] : "";

                // Generate username from email
                string username = email.Split('@')[0];

                // Check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                MySqlParameter[] checkParams = { new MySqlParameter("@Email", email) };
                int count = Convert.ToInt32(DatabaseHelper.ExecuteScalar(checkQuery, checkParams));

                if (count > 0)
                {
                    registerStatus.Text = "Email already registered. Please login instead.";
                    registerStatus.CssClass = "status error";
                    return;
                }

                // Hash password
                string hashedPassword = DatabaseHelper.HashPassword(password);

                // Insert new user
                string insertQuery = @"INSERT INTO Users (Username, Email, PasswordHash, FirstName, LastName,
                    Department, YearOfStudy, Bio, Skills, Role, IsActive, IsEmailVerified)
                    VALUES (@Username, @Email, @Password, @FirstName, @LastName,
                    @Department, @YearOfStudy, @Bio, @Skills, 'Member', 1, 1)";

                MySqlParameter[] parameters = {
                    new MySqlParameter("@Username", username),
                    new MySqlParameter("@Email", email),
                    new MySqlParameter("@Password", hashedPassword),
                    new MySqlParameter("@FirstName", firstName),
                    new MySqlParameter("@LastName", lastName),
                    new MySqlParameter("@Department", string.IsNullOrEmpty(department) ? "" : department),
                    new MySqlParameter("@YearOfStudy", string.IsNullOrEmpty(yearLevel) ? (object)DBNull.Value : yearLevel),
                    new MySqlParameter("@Bio", string.IsNullOrEmpty(bio) ? "" : bio),
                    new MySqlParameter("@Skills", interest)
                };

                int result = DatabaseHelper.ExecuteNonQuery(insertQuery, parameters);

                if (result > 0)
                {
                    // Get the newly created user ID and log them in automatically
                    string getUserQuery = "SELECT UserID, Username, FirstName, LastName, Role FROM Users WHERE Email = @Email";
                    MySqlParameter[] getUserParams = { new MySqlParameter("@Email", email) };
                    DataTable dtUser = DatabaseHelper.ExecuteQuery(getUserQuery, getUserParams);

                    if (dtUser.Rows.Count > 0)
                    {
                        DataRow row = dtUser.Rows[0];
                        // Set session variables
                        Session["UserID"] = row["UserID"];
                        Session["Username"] = row["Username"];
                        Session["FirstName"] = row["FirstName"];
                        Session["LastName"] = row["LastName"];
                        Session["Role"] = row["Role"];
                        Session["IsAdmin"] = row["Role"].ToString() == "Admin";

                        registerStatus.Text = "Registration successful! Logging you in...";
                        registerStatus.CssClass = "status success";
                        Response.AddHeader("REFRESH", "2;URL=profile.aspx");
                    }
                    else
                    {
                        registerStatus.Text = "Registration successful! Redirecting to login...";
                        registerStatus.CssClass = "status success";
                        Response.AddHeader("REFRESH", "2;URL=login.aspx");
                    }
                }
                else
                {
                    registerStatus.Text = "Registration failed. Please try again.";
                    registerStatus.CssClass = "status error";
                }
            }
            catch (Exception ex)
            {
                registerStatus.Text = "Registration error: " + ex.Message;
                registerStatus.CssClass = "status error";
            }
        }
    }
}
