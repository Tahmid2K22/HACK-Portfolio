using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace HACK_portfolio
{
    public partial class Members : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            try
            {
                string query = "SELECT UserID, Username, FirstName, LastName, Department, Bio, Skills, ProfileImageUrl FROM Users WHERE IsActive = 1 AND Role = 'Member' ORDER BY JoinDate DESC";
                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                MembersRepeater.DataSource = dt;
                MembersRepeater.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.error('Error loading members: " + ex.Message + "');</script>");
            }
        }
    }
}
