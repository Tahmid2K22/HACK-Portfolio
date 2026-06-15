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
                    Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link">
                    Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link active">
                    Manage Users
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">
                    Settings
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">
                    Back to Site
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
                    <asp:Button runat="server" Text="Search" CssClass="btn-primary" OnClick="btnSearch_Click" />
                    <asp:DropDownList runat="server" ID="ddlRole" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                        <asp:ListItem Text="All Roles" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                        <asp:ListItem Text="Member" Value="member"></asp:ListItem>
                        <asp:ListItem Text="Guest" Value="guest"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="table-container">
                    <asp:Repeater ID="rptUsers" runat="server">
                        <HeaderTemplate>
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
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("UserID") %></td>
                                        <td><%# Eval("FirstName") %> <%# Eval("LastName") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td><span class="badge <%# GetRoleBadgeClass(Eval("Role")) %>"><%# Eval("Role") %></span></td>
                                        <td><%# Eval("JoinDate", "{0:yyyy-MM-dd}") %></td>
                                        <td><span class="badge <%# (bool)Eval("IsActive") ? "badge-success" : "badge-warning" %>"><%# (bool)Eval("IsActive") ? "Active" : "Inactive" %></span></td>
                                        <td>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/admin/edit-user.aspx?id=" + Eval("UserID") %>' CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                            <asp:LinkButton runat="server" CssClass="action-btn delete-btn" CommandName="Delete" CommandArgument='<%# Eval("UserID") %>' OnClick="btnDeleteUser_Click" OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                        </td>
                                    </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </main>
    </div>
</asp:Content>
