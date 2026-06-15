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
                <asp:Repeater runat="server" ID="MembersRepeater">
                    <ItemTemplate>
                        <div class="member-card">
                            <asp:Image runat="server" ImageUrl="~/img/image.png" AlternateText='<%# Eval("FirstName") + " " + Eval("LastName") %>' CssClass="member-avatar" />
                            <h3 class="member-name"><%# Eval("FirstName") %> <%# Eval("LastName") %></h3>
                            <p class="member-role"><%# Eval("Department") %></p>
                            <%# !string.IsNullOrEmpty(Eval("Bio").ToString()) ? "<p class='member-bio'>" + Eval("Bio") + "</p>" : "" %>
                            <%# !string.IsNullOrEmpty(Eval("Skills").ToString()) ? "<p class='member-skills'><strong>Skills:</strong> " + Eval("Skills") + "</p>" : "" %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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



    <asp:Button runat="server" CssClass="back-to-top" ID="backToTop" Text="↑" ToolTip="Back to Top" UseSubmitBehavior="false" />
</asp:Content>
