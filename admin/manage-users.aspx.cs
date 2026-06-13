using System;

namespace HACK_portfolio.admin
{
    public partial class manage_users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated as admin
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("~/login.aspx");
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            // TODO: Load users from database
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            // Redirect to add user page or show modal
            Response.Redirect("~/admin/edit-user.aspx");
        }
    }
}
