using System;

namespace HACK_portfolio.admin
{
    public partial class settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin(Session))
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            try
            {
                txtMinPasswordLength.Text = DatabaseHelper.GetSetting("MinPasswordLength", "8");
                chkRequireUppercase.Checked = bool.Parse(DatabaseHelper.GetSetting("RequireUppercase", "true"));
                chkRequireNumbers.Checked = bool.Parse(DatabaseHelper.GetSetting("RequireNumbers", "true"));
                chkRequireSpecialChars.Checked = bool.Parse(DatabaseHelper.GetSetting("RequireSpecialChars", "false"));
                txtSessionTimeout.Text = DatabaseHelper.GetSetting("SessionTimeout", "30");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load settings error: " + ex.Message);
            }
        }

        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            try
            {
                DatabaseHelper.SetSetting("MinPasswordLength", txtMinPasswordLength.Text.Trim());
                DatabaseHelper.SetSetting("RequireUppercase", chkRequireUppercase.Checked.ToString());
                DatabaseHelper.SetSetting("RequireNumbers", chkRequireNumbers.Checked.ToString());
                DatabaseHelper.SetSetting("RequireSpecialChars", chkRequireSpecialChars.Checked.ToString());
                DatabaseHelper.SetSetting("SessionTimeout", txtSessionTimeout.Text.Trim());

                pnlSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                pnlSuccessMessage.Visible = false;
                System.Diagnostics.Debug.WriteLine("Save settings error: " + ex.Message);
            }
        }

        protected void btnResetSettings_Click(object sender, EventArgs e)
        {
            txtMinPasswordLength.Text = "8";
            chkRequireUppercase.Checked = true;
            chkRequireNumbers.Checked = true;
            chkRequireSpecialChars.Checked = false;
            txtSessionTimeout.Text = "30";

            pnlSuccessMessage.Visible = false;
        }
    }
}
