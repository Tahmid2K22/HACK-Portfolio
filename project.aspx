<%@ Page Title="Project Details | HACK" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="HACK_portfolio.ProjectPage" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="section-inner" style="padding:3rem 2rem; max-width:980px; margin:2rem auto;">
        <asp:HyperLink runat="server" NavigateUrl="~/all-projects.aspx" CssClass="back-link" Text="Back to projects" />
        <article id="projectDetail">
            <asp:Image runat="server" ID="projImage" AlternateText="Project" Style="width:100%;max-height:420px;object-fit:cover;border-radius:12px;margin-bottom:1rem;" />
            <h1 runat="server" id="projTitle" style="font-family:var(--font-heading);font-size:2rem;margin:0 0 .5rem;"></h1>
            <p runat="server" id="projCategory" style="color:var(--accent-deep);font-weight:800;text-transform:uppercase;letter-spacing:0.12em;margin:0 0 1rem;"></p>
            <p runat="server" id="projDescription" style="color:var(--text-secondary);font-size:1.05rem;line-height:1.6;margin-bottom:1rem;"></p>
            <asp:Panel runat="server" ID="pnlDetails" Style="background:var(--bg-tertiary);padding:1.5rem;border-radius:8px;border:1px solid var(--border-color);color:var(--text-secondary);margin-bottom:1rem;line-height:1.8;white-space:pre-wrap;" />
            <asp:Panel runat="server" ID="pnlTechnologies" Style="margin-bottom:1rem;">
                <h3 style="font-family:var(--font-heading);margin:0 0 .5rem;">Technologies</h3>
                <p runat="server" id="projTechnologies" style="color:var(--text-secondary);"></p>
            </asp:Panel>
            <div style="display:flex;gap:1rem;flex-wrap:wrap;">
                <asp:HyperLink runat="server" ID="projDemo" CssClass="modal-btn demo-btn" Target="_blank" Text="View Demo" Visible="false" />
                <asp:HyperLink runat="server" ID="projGit" CssClass="modal-btn github-btn" Target="_blank" Text="GitHub" Visible="false" />
                <asp:HyperLink runat="server" ID="projVideo" CssClass="modal-btn" Target="_blank" Text="Watch Video" Visible="false" />
            </div>
        </article>
        <asp:Panel runat="server" ID="pnlNotFound" Visible="false">
            <p style="text-align:center;padding:3rem;color:var(--text-secondary);">Project not found.</p>
        </asp:Panel>
    </main>
</asp:Content>
