<%@ Page Title="Manage Users - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="manage-users.aspx.cs" Inherits="HACK_portfolio.admin.manage_users" %>
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
                    <span>📊</span> Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link">
                    <span>🚀</span> Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link active">
                    <span>👥</span> Manage Users
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">
                    <span>⚙️</span> Settings
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">
                    <span>🏠</span> Back to Site
                </asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1>Manage Users</h1>
                <div class="admin-user-info">
                    <asp:Button runat="server" Text="+ Add New User" CssClass="btn-primary" OnClick="btnAddUser_Click" />
                </div>
            </header>

            <div class="admin-content">
                <div class="filter-bar">
                    <asp:TextBox runat="server" ID="txtSearch" PlaceHolder="Search users..." CssClass="search-input"></asp:TextBox>
                    <asp:DropDownList runat="server" ID="ddlRole" CssClass="filter-select" AutoPostBack="true">
                        <asp:ListItem Text="All Roles" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                        <asp:ListItem Text="Member" Value="member"></asp:ListItem>
                        <asp:ListItem Text="Guest" Value="guest"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="table-container">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Join Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#001</td>
                                <td>John Doe</td>
                                <td>john.doe@example.com</td>
                                <td><span class="badge badge-danger">Admin</span></td>
                                <td>2025-01-15</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#002</td>
                                <td>Jane Smith</td>
                                <td>jane.smith@example.com</td>
                                <td><span class="badge badge-info">Member</span></td>
                                <td>2025-02-20</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#003</td>
                                <td>Mike Johnson</td>
                                <td>mike.johnson@example.com</td>
                                <td><span class="badge badge-info">Member</span></td>
                                <td>2025-03-10</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#004</td>
                                <td>Sarah Williams</td>
                                <td>sarah.williams@example.com</td>
                                <td><span class="badge badge-info">Member</span></td>
                                <td>2025-04-05</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#005</td>
                                <td>Robert Brown</td>
                                <td>robert.brown@example.com</td>
                                <td><span class="badge badge-secondary">Guest</span></td>
                                <td>2025-05-18</td>
                                <td><span class="badge badge-warning">Inactive</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#006</td>
                                <td>Emily Davis</td>
                                <td>emily.davis@example.com</td>
                                <td><span class="badge badge-info">Member</span></td>
                                <td>2025-06-02</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <asp:LinkButton runat="server" CssClass="page-btn">Previous</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn active">1</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">2</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">3</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">Next</asp:LinkButton>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
