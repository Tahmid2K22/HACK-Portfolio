<%@ Page Title="Members | HACK Portfolio" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="members.aspx.cs" Inherits="HACK_portfolio.Members" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="about-section" id="members">
        <div class="section-inner">
            <p class="section-label">Meet Our Team</p>
            <h2 class="section-title">The brilliant minds behind HACK.</h2>
            <p class="section-text">
                Our club is driven by a passionate community of students dedicated to hardware innovation 
                and engineering excellence.
            </p>

            <div class="members-grid">
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member1.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Amit Kairy</h3>
                    <p class="member-role">President</p>
                </div>
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member2.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Faysal Mahmud</h3>
                    <p class="member-role">VPresident(Technical)</p>
                </div>
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member3.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Mofazzal Hossen</h3>
                    <p class="member-role">Vice President</p>
                </div>
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member4.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Saleh Sadid Mir</h3>
                    <p class="member-role">Workshop Manager</p>
                </div>
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member5.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Isaac Aneek Sarkar</h3>
                    <p class="member-role">Workshop Manager</p>
                </div>
                <div class="member-card">
                    <asp:Image runat="server" ImageUrl="~/img/member6.png" AlternateText="Member" CssClass="member-avatar" />
                    <h3 class="member-name">Sazzad Hossein</h3>
                    <p class="member-role">Associative Member</p>
                </div>
            </div>

            <section class="membership-form-section">
                <h3 class="section-subtitle">Join HACK</h3>
                <p class="section-subtext">Interested in joining? Fill out this quick form and we'll be in touch.</p>
                <asp:Panel runat="server" CssClass="membership-form">
                    <div class="form-row">
                        <label for="txtMemberName">Full name</label>
                        <asp:TextBox runat="server" ID="txtMemberName" ClientIDMode="Static" />
                    </div>
                    <div class="form-row">
                        <label for="txtMemberEmail">Email</label>
                        <asp:TextBox runat="server" ID="txtMemberEmail" ClientIDMode="Static" TextMode="Email" />
                    </div>
                    <div class="form-row">
                        <label for="txtMemberDept">Department / Program</label>
                        <asp:TextBox runat="server" ID="txtMemberDept" ClientIDMode="Static" />
                    </div>
                    <div class="form-row">
                        <label for="txtMemberYear">Year / Level</label>
                        <asp:TextBox runat="server" ID="txtMemberYear" ClientIDMode="Static" />
                    </div>
                    <div class="form-row">
                        <label for="ddlMemberInterests">Interests</label>
                        <asp:DropDownList runat="server" ID="ddlMemberInterests" ClientIDMode="Static">
                            <asp:ListItem Text="Embedded Systems" Value="embedded" />
                            <asp:ListItem Text="Robotics" Value="robotics" />
                            <asp:ListItem Text="IoT" Value="iot" />
                            <asp:ListItem Text="AI/ML" Value="ml" />
                            <asp:ListItem Text="Hardware" Value="hardware" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-row">
                        <label for="txtMemberMessage">Message (optional)</label>
                        <asp:TextBox runat="server" ID="txtMemberMessage" ClientIDMode="Static" TextMode="MultiLine" Rows="4" />
                    </div>
                    <div class="form-row form-actions">
                        <asp:Button runat="server" ID="btnMemberSubmit" CssClass="submit-btn" Text="Submit" UseSubmitBehavior="false" />
                        <asp:Button runat="server" ID="btnMemberReset" CssClass="reset-btn" Text="Reset" UseSubmitBehavior="false" />
                    </div>
                </asp:Panel>
                <div class="form-row form-actions" style="margin-top: 1rem; justify-content: flex-start; flex-wrap: wrap;">
                    <asp:HyperLink runat="server" NavigateUrl="~/register.aspx" CssClass="submit-btn" Text="Open registration portal" />
                    <asp:HyperLink runat="server" NavigateUrl="~/login.aspx" CssClass="reset-btn" Text="Member login" />
                </div>
            </section>
        </div>
    </section>

    <nav class="glass-nav">
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#home" Text="Home" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#about" Text="About" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#projects" Text="Projects" />
        <asp:HyperLink runat="server" NavigateUrl="~/members.aspx" Text="Members" />
        <asp:HyperLink runat="server" NavigateUrl="~/register.aspx" Text="Register" />
        <asp:HyperLink runat="server" NavigateUrl="~/login.aspx" Text="Login" />
        <asp:HyperLink runat="server" NavigateUrl="~/profile.aspx" Text="Profile" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#contact" Text="Contact" />
    </nav>

    <asp:Button runat="server" CssClass="back-to-top" ID="backToTop" Text="↑" ToolTip="Back to Top" UseSubmitBehavior="false" />
</asp:Content>
