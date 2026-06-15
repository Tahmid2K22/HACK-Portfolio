<%@ Page Title="Manage Projects - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="manage-projects.aspx.cs" Inherits="HACK_portfolio.admin.manage_projects" %>
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
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link active">
                    Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link">
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
                <h1>Manage Projects</h1>
                <div class="admin-user-info">
                    <asp:Button runat="server" Text="+ Add New Project" CssClass="btn-primary" OnClick="btnAddProject_Click" />
                </div>
            </header>

            <div class="admin-content">
                <div class="filter-bar">
                    <asp:TextBox runat="server" ID="txtSearch" PlaceHolder="Search projects..." CssClass="search-input"></asp:TextBox>
                    <asp:Button runat="server" Text="Search" CssClass="btn-primary" OnClick="btnSearch_Click" />
                    <asp:DropDownList runat="server" ID="ddlCategory" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        <asp:ListItem Text="All Categories" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Robotics" Value="robotics"></asp:ListItem>
                        <asp:ListItem Text="IoT" Value="iot"></asp:ListItem>
                        <asp:ListItem Text="Embedded Systems" Value="embedded"></asp:ListItem>
                        <asp:ListItem Text="AI/ML" Value="ai"></asp:ListItem>
                        <asp:ListItem Text="Software" Value="software"></asp:ListItem>
                        <asp:ListItem Text="Hardware" Value="hardware"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Text="All Status" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="active"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="completed"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="table-container">
                    <asp:Repeater ID="rptProjects" runat="server">
                        <HeaderTemplate>
                            <table class="admin-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Project Name</th>
                                        <th>Category</th>
                                        <th>Status</th>
                                        <th>Members</th>
                                        <th>Created Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ProjectID") %></td>
                                        <td><%# Eval("ProjectName") %></td>
                                        <td><%# Eval("CategoryName") %></td>
                                        <td><span class="badge <%# GetStatusBadgeClass(Eval("Status")) %>"><%# Eval("Status") %></span></td>
                                        <td><%# Eval("MemberCount") %></td>
                                        <td><%# Eval("CreatedDate", "{0:yyyy-MM-dd}") %></td>
                                        <td>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/admin/edit-project.aspx?id=" + Eval("ProjectID") %>' CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                            <asp:LinkButton runat="server" CssClass="action-btn delete-btn" CommandName="Delete" CommandArgument='<%# Eval("ProjectID") %>' OnClick="btnDeleteProject_Click" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
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
