<%@ Page Title="Project Details | HACK" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="HACK_portfolio.ProjectPage" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="section-inner" style="padding:3rem 2rem; max-width:980px; margin:2rem auto;">
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link" Text="← Back to projects" />
        <article id="projectDetail">
            <asp:Image runat="server" ID="projImage" ClientIDMode="Static" AlternateText="Project" Style="width:100%;max-height:420px;object-fit:cover;border-radius:12px;margin-bottom:1rem;" />
            <h1 id="projTitle" style="font-family:var(--font-heading);font-size:2rem;margin:0 0 .5rem;">Project Title</h1>
            <p id="projCategory" style="color:var(--accent-deep);font-weight:800;text-transform:uppercase;letter-spacing:0.12em;margin:0 0 1rem;"></p>
            <p id="projDescription" style="color:var(--text-secondary);font-size:1.05rem;line-height:1.6;margin-bottom:1rem;"></p>
            <div id="projDetails" style="background:var(--bg-tertiary);padding:1.5rem;border-radius:8px;border:1px solid var(--border-color);color:var(--text-secondary);margin-bottom:1rem;line-height:1.8;white-space:pre-wrap;"></div>
            <div style="display:flex;gap:1rem;flex-wrap:wrap;">
                <asp:HyperLink runat="server" ID="projDemo" ClientIDMode="Static" CssClass="modal-btn demo-btn" Target="_blank" Text="View Demo" NavigateUrl="#" />
                <asp:HyperLink runat="server" ID="projGit" ClientIDMode="Static" CssClass="modal-btn github-btn" Target="_blank" Text="GitHub" NavigateUrl="#" />
            </div>
        </article>
    </main>

    <script src="scripts/projects-data.js"></script>
    <script>
        function getQueryParam(name) {
            const params = new URLSearchParams(window.location.search);
            return params.get(name);
        }

        const pid = parseInt(getQueryParam('id'), 10) || null;
        const projects = window.projectsData || [];
        const project = projects.find(p => p.id === pid) || projects[0] || null;

        if (project) {
            document.getElementById('projImage').src = project.image;
            document.getElementById('projImage').alt = project.title;
            document.getElementById('projTitle').textContent = project.title;
            document.getElementById('projCategory').textContent = project.category.toUpperCase();
            document.getElementById('projDescription').textContent = project.description;
            document.getElementById('projDetails').textContent = project.details;
            document.getElementById('projDemo').href = project.demoLink;
            document.getElementById('projGit').href = project.githubLink;
        } else {
            document.getElementById('projectDetail').innerHTML = '<p>Project not found.</p>';
        }
    </script>
</asp:Content>
