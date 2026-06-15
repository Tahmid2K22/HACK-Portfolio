<%@ Page Title="Settings - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="HACK_portfolio.admin.settings" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/admin.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <aside class="admin-sidebar">
            <div class="admin-logo">
                <asp:Image runat="server" ImageUrl="~/img/hackLogo.png" AlternateText="HACK Logo" />
                <h2>Admin Panel</h2>
            </div>
            <nav class="admin-nav">
                <asp:HyperLink runat="server" NavigateUrl="~/admin/dashboard.aspx" CssClass="admin-nav-link">
                    Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link">
                    Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link">
                    Manage Users
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link active">
                    Settings
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">
                    Back to Site
                </asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1>Settings</h1>
            </header>

            <div class="admin-content">
                <div class="settings-container">
                    <!-- Security Settings Section -->
                    <section class="settings-section">
                        <h2>Security Settings</h2>
                        <div class="form-group">
                            <label for="txtMinPasswordLength">Minimum Password Length</label>
                            <asp:TextBox runat="server" ID="txtMinPasswordLength" CssClass="form-control" TextMode="Number" Text="8"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkRequireUppercase" Checked="true" />
                                Require Uppercase Letters
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkRequireNumbers" Checked="true" />
                                Require Numbers
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkRequireSpecialChars" Checked="false" />
                                Require Special Characters
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="txtSessionTimeout">Session Timeout (minutes)</label>
                            <asp:TextBox runat="server" ID="txtSessionTimeout" CssClass="form-control" TextMode="Number" Text="30"></asp:TextBox>
                        </div>
                    </section>

                    <!-- Save Button -->
                    <div class="settings-actions">
                        <asp:Button runat="server" ID="btnSaveSettings" Text="Save Settings" CssClass="btn-primary" OnClick="btnSaveSettings_Click" />
                        <asp:Button runat="server" ID="btnResetSettings" Text="Reset to Default" CssClass="btn-secondary" OnClick="btnResetSettings_Click" OnClientClick="return confirm('Are you sure you want to reset all settings to default values?');" />
                    </div>

                    <!-- Success Message -->
                    <asp:Panel runat="server" ID="pnlSuccessMessage" CssClass="alert alert-success" Visible="false">
                        Settings saved successfully!
                    </asp:Panel>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
