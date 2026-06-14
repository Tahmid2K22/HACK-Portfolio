using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HACK_portfolio
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["UserID"] != null;
            // Reuse navLogin link: show "Login" when not logged in, "Profile" when logged in
            if (isLoggedIn)
            {
                navLogin.Text = "Profile";
                navLogin.NavigateUrl = "~/profile.aspx";
            }
            else
            {
                navLogin.Text = "Login";
                navLogin.NavigateUrl = "~/login.aspx";
            }
        }
    }
}
