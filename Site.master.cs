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
                navLogin.Visible = true;
                navProfile.Visible = false;
            }
            else
            {
                navLogin.Text = "Login";
                navLogin.NavigateUrl = "~/login.aspx";
                navLogin.Visible = true;
                navProfile.Visible = false;
            }

            // Populate debug literal with session values (temporary)
            try
            {
                var userId = Session["UserID"] != null ? Session["UserID"].ToString() : "(null)";
                var username = Session["Username"] != null ? Session["Username"].ToString() : "(null)";
                litSessionDebug.Text = $"UserID={userId}; Username={username}";
                litSessionDebug.Visible = true; // TEMP: show debug info for troubleshooting
            }
            catch { /* ignore in case session not available */ }
        }
    }
}
