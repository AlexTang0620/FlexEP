<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="FLEX_INTI.Maintenance.User" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
      .checkbox label:after, 
.radio label:after {
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr,  /*size of checkbox*/
.radio .cr {
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .20em;
    width: 1.0em;
    height: 1.0em;
    /*float: right;*/
    /*margin-right: .5em;*/
    /*padding-left: 100px;*/
    margin-left: 13.0em;
    margin-top: 10px;
    /*clear:both;*/
    /*margin-bottom:-25px;*/
}

.radio .cr {        
    border-radius: 50%;
}
.checkbox .cr .cr-icon,
.radio .cr .cr-icon {    /*tick position*/
    position: absolute;
    font-size: .7em;
    line-height: 0;
    top: 50%;
    left: 15%;  /*left and right positioning*/
}

.radio .cr .cr-icon {
    margin-left: 0.04em;
}

.checkbox label input[type="checkbox"],
.radio label input[type="radio"] {
    display: none;
}

.checkbox label input[type="checkbox"] + .cr > .cr-icon,
.radio label input[type="radio"] + .cr > .cr-icon {
    transform: scale(3) rotateZ(-20deg);
    opacity: 0;
    transition: all .3s ease-in;
}
.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
.radio label input[type="radio"]:checked + .cr > .cr-icon {
    transform: scale(1) rotateZ(0deg);
    opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled + .cr,
.radio label input[type="radio"]:disabled + .cr {
    opacity: .5;
}

    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p class="lead jumbotron">User Maintenance</p>
                <div class="form-horizontal">
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="extra_UserGroup" CssClass="col-md-2 control-label" style="margin-top:14px">User Group</asp:Label>
                        <div class="col-sm-12">
                            <div class="radio">
                              <asp:TextBox runat="server" ID="extra_UserGroup" CssClass="form-control" />
                             </div>
                          <%--  <div class="radio">
                                <label style="font-size: 1em">
                                    <input type="radio" name="o5" value="" id="radio_extra" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                </label>
                            </div>--%>
                              <div class="radio" style="padding-top: 0px;"> <%--take out the space between user group and technician--%>
                                 
                                <label style="font-weight:700; font-size: 1.0em;">
                                    <input type="radio" name="o5" value="" id="radio_Technician" runat="server"> <%-- You just need to set the required-attribute for one input of the radiogroup, but you can set it for all.--%>
                                    <span class="cr" style="margin-left: 29px;"><i class="cr-icon fa fa-circle"></i></span>
                                    Technician
                                </label>
                                  <%-- <asp:Label runat="server" AssociatedControlID="radio_Technician" CssClass="col-md-2 control-label">Technician</asp:Label>--%>
                           <%--</div>--%>
                            <%--<div class="radio">--%>
                                <label style="font-weight:700; font-size: 1.0em" >
                                    <input type="radio" name="o5" value="" id="radio_qcOperator" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    QC Operator
                                </label>
                           <%--</div>
                            <div class="radio">--%>
                                <label style="font-weight:700; font-size: 1.0em">
                                    <input type="radio" name="o5" value="" id="radio_Supervisor" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Supervisor
                                </label>
                        <%--   </div>
                             <div class="radio">--%>
                                <label style="font-weight:700; font-size: 1.0em">
                                    <input type="radio" name="o5" value="" id="radio_Admin" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Super Admin
                                </label>
                        
                           </div>
        
                            <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="User Group is required." />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <asp:Button runat="server" OnClick="CreateUser" Text="Create User" CssClass="btn btn-default"/>
                        </div>
                    </div>
                </div>
          

</asp:Content>