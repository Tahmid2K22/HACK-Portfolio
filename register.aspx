<%@ Page Title="Register | HACK Portal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="HACK_portfolio.Register" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/auth.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="auth-shell">
        <section class="auth-panel hero-panel register-hero">
            <p class="eyebrow">Club registration</p>
            <h1>Join HACK.</h1>
            <p>Create your member profile and keep your club details in one place.</p>
            <div class="auth-links">
                <asp:HyperLink runat="server" NavigateUrl="~/login.aspx" Text="Already registered? Sign in" />
                <asp:HyperLink runat="server" NavigateUrl="~/profile.aspx" Text="View profile" />
            </div>
            <ul class="auth-points">
                <li>Fast signup for club membership.</li>
                <li>Saved profile details in the browser.</li>
                <li>One-click access to your member view.</li>
            </ul>
        </section>

        <section class="auth-panel form-panel">
            <asp:Panel runat="server" CssClass="auth-form" DefaultButton="btnCreateAccount">
                <h2>Register</h2>
                <asp:Label runat="server" ID="registerStatus" CssClass="status" EnableViewState="false" />

                <div class="field-grid">
                    <asp:Label runat="server" AssociatedControlID="txtFullName"><span>Full name</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtFullName" CssClass="input" />

                    <asp:Label runat="server" AssociatedControlID="txtEmail"><span>Email</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="input" TextMode="Email" AutoCompleteType="Email" />

                    <asp:Label runat="server" AssociatedControlID="txtDepartment"><span>Department / Program</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtDepartment" CssClass="input" />

                    <asp:Label runat="server" AssociatedControlID="txtYearLevel"><span>Year / Level</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtYearLevel" CssClass="input" />

                    <asp:Label runat="server" AssociatedControlID="ddlInterest"><span>Primary interest</span></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlInterest" CssClass="input">
                        <asp:ListItem Text="Embedded Systems" />
                        <asp:ListItem Text="Robotics" />
                        <asp:ListItem Text="IoT" />
                        <asp:ListItem Text="AI / ML" />
                        <asp:ListItem Text="Hardware Design" />
                    </asp:DropDownList>

                    <asp:Label runat="server" AssociatedControlID="txtBio" CssClass="full-width"><span>Why do you want to join?</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtBio" CssClass="input" TextMode="MultiLine" Rows="4" />

                    <asp:Label runat="server" AssociatedControlID="txtPassword"><span>Password</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="input" TextMode="Password" AutoCompleteType="None" />

                    <asp:Label runat="server" AssociatedControlID="txtConfirmPassword"><span>Confirm password</span></asp:Label>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="input" TextMode="Password" AutoCompleteType="None" />
                </div>

                <div class="button-row">
                    <asp:Button runat="server" ID="btnCreateAccount" CssClass="primary-btn" Text="Create account" />
                    <asp:HyperLink runat="server" CssClass="secondary-btn" NavigateUrl="~/login.aspx" Text="Go to login" />
                </div>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
