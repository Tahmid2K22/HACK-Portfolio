using System;

namespace HACK_portfolio.admin
{
    public partial class manage_users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is authenticated as admin
            if (!AuthHelper.IsAdmin(Session))
            {
                Response.Redirect("~/login.aspx");
                return;
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
