<%@ Page Title="Edit Project - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="edit-project.aspx.cs" Inherits="HACK_portfolio.admin.edit_project" %>
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
                <asp:HyperLink runat="server" NavigateUrl="~/admin/dashboard.aspx" CssClass="admin-nav-link">Dashboard</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link active">Manage Projects</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link">Manage Users</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">Settings</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">Back to Site</asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1><asp:Label runat="server" ID="lblPageTitle" Text="Add New Project"></asp:Label></h1>
                <div class="admin-user-info">
                    <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="btn-secondary">Back to Projects</asp:HyperLink>
                </div>
            </header>

            <div class="admin-content">
                <asp:Panel runat="server" ID="pnlSuccessMessage" CssClass="alert alert-success" Visible="false">
                    Project saved successfully!
                </asp:Panel>

                <div class="settings-container">
                    <section class="settings-section">
                        <h2>Project Details</h2>
                        <div class="form-group">
                            <label for="txtProjectName">Project Name</label>
                            <asp:TextBox runat="server" ID="txtProjectName" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="ddlCategory">Category</label>
                            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="ddlStatus">Status</label>
                            <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control">
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Completed" Value="Completed" />
                                <asp:ListItem Text="Archived" Value="Archived" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtShortDescription">Short Description</label>
                            <asp:TextBox runat="server" ID="txtShortDescription" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                        </div>
                        <div class="form-group">
                            <label for="txtDetailedDescription">Detailed Description</label>
                            <asp:TextBox runat="server" ID="txtDetailedDescription" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                        </div>
                    </section>

                    <section class="settings-section">
                        <h2>Media & Links</h2>
                        <div class="form-group">
                            <label for="txtThumbnailUrl">Thumbnail Image URL</label>
                            <asp:TextBox runat="server" ID="txtThumbnailUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtCoverImageUrl">Cover Image URL</label>
                            <asp:TextBox runat="server" ID="txtCoverImageUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtDemoUrl">Demo URL</label>
                            <asp:TextBox runat="server" ID="txtDemoUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtGitHubUrl">GitHub URL</label>
                            <asp:TextBox runat="server" ID="txtGitHubUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtVideoUrl">Video URL</label>
                            <asp:TextBox runat="server" ID="txtVideoUrl" CssClass="form-control" />
                        </div>
                    </section>

                    <section class="settings-section">
                        <h2>Additional Info</h2>
                        <div class="form-group">
                            <label for="txtTechnologies">Technologies</label>
                            <asp:TextBox runat="server" ID="txtTechnologies" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtTags">Tags (comma-separated)</label>
                            <asp:TextBox runat="server" ID="txtTags" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkIsFeatured" />
                                Featured Project
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkIsPublished" Checked="true" />
                                Published
                            </label>
                        </div>
                    </section>

                    <div class="settings-actions">
                        <asp:Button runat="server" ID="btnSave" Text="Save Project" CssClass="btn-primary" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn-secondary" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
