using System;

namespace HACK_portfolio.admin
{
    public partial class settings : System.Web.UI.Page
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
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            // TODO: Load settings from database or configuration file
            // For now, default values are set in the ASPX page
        }

        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            try
            {
                // TODO: Save settings to database or configuration file
                // Validate input values
                if (string.IsNullOrWhiteSpace(txtSiteName.Text))
                {
                    // Show error message
                    return;
                }

                // Save site settings
                string siteName = txtSiteName.Text.Trim();
                string siteDescription = txtSiteDescription.Text.Trim();
                string contactEmail = txtContactEmail.Text.Trim();

                // Save email configuration
                string smtpHost = txtSmtpHost.Text.Trim();
                int smtpPort = int.Parse(txtSmtpPort.Text);
                string smtpUsername = txtSmtpUsername.Text.Trim();
                string smtpPassword = txtSmtpPassword.Text;
                bool enableSSL = chkEnableSSL.Checked;

                // Save security settings
                int minPasswordLength = int.Parse(txtMinPasswordLength.Text);
                bool requireUppercase = chkRequireUppercase.Checked;
                bool requireNumbers = chkRequireNumbers.Checked;
                bool requireSpecialChars = chkRequireSpecialChars.Checked;
                int sessionTimeout = int.Parse(txtSessionTimeout.Text);

                // Show success message
                pnlSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                // TODO: Log error and show error message
                // For now, just hide success message
                pnlSuccessMessage.Visible = false;
            }
        }

        protected void btnResetSettings_Click(object sender, EventArgs e)
        {
            // Reset to default values
            txtSiteName.Text = "HACK Portfolio";
            txtSiteDescription.Text = "Official portfolio website for HACK club projects and members";
            txtContactEmail.Text = "contact@hackportfolio.com";

            txtSmtpHost.Text = "";
            txtSmtpPort.Text = "587";
            txtSmtpUsername.Text = "";
            txtSmtpPassword.Text = "";
            chkEnableSSL.Checked = true;

            txtMinPasswordLength.Text = "8";
            chkRequireUppercase.Checked = true;
            chkRequireNumbers.Checked = true;
            chkRequireSpecialChars.Checked = false;
            txtSessionTimeout.Text = "30";

            pnlSuccessMessage.Visible = false;
        }
    }
}
