<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileMaintenance.aspx.cs" Inherits="FLEX_INTI.Maintenance.ProfileMaintenance" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
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

/*pop up style--------------*/
.box {
  /*width: 20%;*/
  margin: 0 auto;
  /*background: rgba(255,255,255,0.2);*/
  /*padding: 35px;*/
  /*border: 2px solid #fff;*/
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
  font-size: 1em;
  /*padding: 10px;*/
  /*color: #fff;*/
  /*border: 2px solid #06D85F;*/
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  /*background: #06D85F;*/
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 120px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
  z-index: 1000;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
</style>

 <%-- <style type="text/css">
        
        #mask
        {
            position: fixed;
            left: 0px;
            top: 0px;
            z-index: 4;
            opacity: 0.4;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)"; /* first!*/
            filter: alpha(opacity=40); /* second!*/
            background-color: gray;
            display: none;
            width: 100%;
            height: 100%;
        }
    </style>
    <script src="Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowPopup() {
            $('#mask').show();
            $('#<%=pnlpopup.ClientID %>').show();
        }
        function HidePopup() {
            $('#mask').hide();
            $('#<%=pnlpopup.ClientID %>').hide();
        }
        $(".btnClose").live('click',function () {
            HidePopup();
        });
    </script>--%>
<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a#popup').live('click', function (e) {
                 
                var page = $(this).attr("href")  //get url of link
               
                var $dialog = $('<div></div>')
                .html('<iframe style="border: 0px; " src="' + page + '" width="50%" height="50%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    height: 450,
                    width: 450,
                    title: "Edit Employee",
                    buttons: {
                        "Close": function () { $dialog.dialog('close'); }
                                },
                    close: function (event, ui) {
                         
                       __doPostBack('<%= btnRefresh.ClientID %>', '');  // To refresh gridview when user close dialog
                    }
                });
                $dialog.dialog('open');
                e.preventDefault();
            });
        });
    </script>--%>
</asp:Content>


            

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p class="lead jumbotron">Profile Maintenance</p>
<%--     <div id="mask">
    </div>
      <asp:Panel ID="pnlpopup" runat="server"  BackColor="White" Height="175px"
            Width="300px" Style="z-index:111;background-color: White; position: absolute; left: 35%; top: 12%; 
 
border: outset 2px gray;padding:5px;display:none">
            <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                <tr style="background-color: #0924BC">
                    <td colspan="2" style="color:White; font-weight: bold; font-size: 1.2em; padding:3px"
                        align="center">
                        Customer Details <a id="closebtn" style="color: white; float: right;text-decoration:none" class="btnClose"  href="#">X</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 45%; text-align: center;">
                        <asp:Label ID="LabelValidate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 45%">
                        CustomerID:
                    </td>
                    <td>
                        <asp:Label ID="lblID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Contact Name:
                    </td>
                    <td>
                        <asp:Label ID="lblContactName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Address:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        City:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <input type="button" class="btnClose" value="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:Panel>--%>

<%--                    <asp:GridView ID="gv_ProfileMaintenance" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.UserName, C.Name FROM  aspnetUsers A  
LEFT JOIN AspNetUserRoles B
ON A.Id = B.UserId LEFT JOIN ASPNETROLES C
ON B.ROLEID = C.Id
"></asp:SqlDataSource>--%>
        
         
  <%--  horizontal align="center" moves the grid view to the center--%>

 
<%--    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" >
   <ContentTemplate>--%>
     <div class="form-horizontal">
          <div class="form-group">
             <table>
                <tr>
                    <td>      
                    </td>
                    <td>
                     
                         <asp:Button runat="server" OnClick="CreateUser" style="float:right; margin-left:800px"  Text="Create User" CssClass="btn btn-default"/>
                    </td>
                </tr>
            </table>
         </div>
       </div>

    

    <asp:GridView ID="gv_ProfileMaintenance" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <%--  <asp:TemplateField ItemStyle-Width="200px">
                  <HeaderTemplate>
                     <div style="text-align:center;">Username</div>
                 </HeaderTemplate>
                <ItemTemplate>--%>
                      <asp:BoundField DataField = "Username" HeaderText = "Username" />
               <%--     <asp:Label ID="Id" runat="server" Text='<%# Eval("Username") %>' />--%>
         <%--       </ItemTemplate>--%>


<%--<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>--%>

           <%-- <asp:TemplateField ItemStyle-Width="200px">
                    <HeaderTemplate>
                     <div style="text-align:center;">Role</div>
                 </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="name" runat="server" Text='<%# Eval("Name") %>' />
                </ItemTemplate>--%>

<%--<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>--%>
             <asp:BoundField DataField = "Name" HeaderText = "Role" />

             <asp:TemplateField ItemStyle-Width="200px">
                     <HeaderTemplate>
                     <div style="text-align:center;">Controls</div>
                 </HeaderTemplate>
                <ItemTemplate>
                  <%--<asp:LinkButton ID="Edit" runat="server" CommandName="edit">Edit</asp:LinkButton>--%>
         <%--            <a id="ShowPopup" href='EditEmployee.aspx?id=<%# Eval("Name") %>' >edit</a>--%>
<%--                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="ShowPopup"
CommandArgument='<%#Eval("Name") %>'>Edit</asp:LinkButton>--%>
<%--                    <h1>Popup/Modal Windows without JavaScript</h1>--%>

<div class="box">
    <asp:LinkButton ID="Edit" runat="server" CommandName="edit" href="#popup1" class="button" onClick="Edit_Click" CommandArgument='<%# Eval("Username") %>'>Edit</asp:LinkButton>
	<%--<a class="button" href="#popup1">Edit</a>--%>
</div>

                </ItemTemplate>

<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>
        </Columns>

        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
   

   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.UserName, C.Name FROM  aspnetUsers A  
LEFT JOIN AspNetUserRoles B
ON A.Id = B.UserId LEFT JOIN ASPNETROLES C
ON B.ROLEID = C.Id
"></asp:SqlDataSource>
   <%--     <asp:Button ID="btnRefresh" Text="refresh" runat="server"
            onclick="btnRefresh_Click" />--%>
<%--         </ContentTemplate>
</asp:UpdatePanel>--%>
   <div id="popup1" class="overlay">
	<div class="popup">
		<h2>Role</h2>
		<a class="close" href="#">x</a>
		<div class="content">
			  <div class="form-group">
                       <%-- <asp:Label runat="server" AssociatedControlID="extra_UserGroup" CssClass="col-md-2 control-label">User Group</asp:Label>--%>
                        <div class="col-sm-12">
                         <%--   <div class="radio">
                              <asp:TextBox runat="server" ID="extra_UserGroup" CssClass="form-control" />
                             </div>--%>
                          <%--  <div class="radio">
                                <label style="font-size: 1em">
                                    <input type="radio" name="o5" value="" id="radio_extra" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                </label>
                            </div>--%>
                           <%--take out the space between user group and technician--%>
                                 
                                <label style="font-weight:700; font-size: 1.0em; margin-right:12px"><%--same name attribute to group the radio buttons --%>
                                    <input type="radio" name="o5" value="" id="radio_Technician" runat="server"> <%-- You just need to set the required-attribute for one input of the radiogroup, but you can set it for all.--%>
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Technician
                                </label>
                            &nbsp;<br /><%-- <asp:Label runat="server" AssociatedControlID="radio_Technician" CssClass="col-md-2 control-label">Technician</asp:Label>--%><%--</div>--%><%--<div class="radio">--%>
                            <label style="font-weight:700; font-size: 1.0em" ><input type="radio" name="o5" value="" id="radio_qcOperator" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    QC Operator
                                </label>
                                  &nbsp;<br /><%--</div>
                            <div class="radio">--%><label style="font-weight:700; font-size: 1.0em; margin-right:12px"><input type="radio" name="o5" value="" id="radio_Supervisor" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Supervisor
                                </label>
                                  &nbsp;<br /><%--   </div>
                             <div class="radio">--%><label style="font-weight:700; font-size: 1.0em"><input type="radio" name="o5" value="" id="radio_Admin" runat="server">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Super Admin
                                </label>
<%--                            &nbsp;<br /><asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-default" CommandName="Update" <%--CommandArgument='<%# Container.DataItemIndex %>'--%>
                             &nbsp;<br /><asp:Button ID="Update" onClick="Update_Click" runat="server" Text="Update" CssClass="btn btn-default" CommandName="Update"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button runat="server" Text="Cancel" CssClass="btn btn-default" PostBackUrl="~/Maintenance/ProfileMaintenance.aspx" />
                           </div>
        
                            <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="User Group is required." />--%>
                        </div>
                    </div>
        </div>
    </div>

   
</asp:Content>
