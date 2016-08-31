<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Part.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Part" %>
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
    border: 1px solid #cccccc;
    border-radius: 4px;
    width: 1.0em;
    height: 1.0em;
    /*float: left;*/
    /*margin-right: .5em;*/
    /*margin-left: .4em;*/

   /*change the position of checkbox here not bootstrap.css*/
    margin-left: 15px;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
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
 /*@import url('http://getbootstrap.com/dist/css/bootstrap.css');*/

 #container
{
        position: relative;
}
#txt_MatName
{
    position: absolute;
    top: 0;
    left: 0;
    z-index: 999;
    padding: 0;
    margin: 0;

}

#DropDown_MatName
{
    position: absolute;
    top: 0;
    left: 0;
    padding: 0;
    margin: 0;

}
    </style>

   <%--    <script type="text/javascript">
           $('#demolist li').on('click', function () {
               $('#datebox').val($(this).text());
           });
           </script>--%>
</asp:Content>


            

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p class="lead jumbotron">Part Maintenance</p>
                <div class="form-horizontal">
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txt_PartNo" CssClass="col-md-2 control-label">Part Number</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txt_PartNo" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_PartNo"
                                CssClass="text-danger" ErrorMessage="Part Number is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txt_PartName" CssClass="col-md-2 control-label">Part Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txt_PartName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_PartName" CssClass="text-danger" ErrorMessage="Part Name is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txt_PartDesc" CssClass="col-md-2 control-label">Part Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txt_PartDesc" CssClass="form-control" />
                        </div>
                    </div>

         
              <div class="form-group">
                <asp:Label ID="MaterialName" runat="server" AssociatedControlID="txt_MaterialName" CssClass="col-md-2 control-label" style="margin-top:17px;">Material Name</asp:Label>
         
              <div class="col-md-10">
               <div id="container">
                 <div id="txt_MatName">
                        <asp:TextBox ID="txt_MaterialName" runat="server" Width="259px" Height="34px"  style="border: 1px solid #cccccc;
    border-radius: 4px; margin-top:18px;"></asp:TextBox>  <%--combination of textbox and dropdown--%>
                 </div>
             
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txt_MaterialName" 
                             CssClass="text-danger" ErrorMessage="Material Name is required."/>
                      <div id="DropDown_MatName">
                           <asp:DropDownList ID="DropDown_MaterialName" runat="server" 
                                      onselectedindexchanged="DropDown_MaterialName_SelectedIndexChanged" AutoPostBack = "true" Height="34px" 
                    Width="280px" style="border: 1px solid #cccccc; border-radius: 4px; margin-top:18px;">     
                          </asp:DropDownList>    <%--combination of textbox and dropdown--%>
                      </div>
                </div>
              </div>
             </div>
             

                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CheckBox_isReleased" CssClass="col-md-2 control-label" style="margin-top:20px;">Released Part</asp:Label>
                          <div class="col-sm-12">
                                <div class="checkbox">
                                    <label style="font-size: 2.5em">
                                        <input type="checkbox" id="CheckBox_isReleased" value="" runat="server">  <%--add runat server for associatedControlID--%>
                                        <span class="cr" style="margin-top:16px;"><i class="cr-icon fa fa-check"></i></span>
                                    </label>
                                </div>
                           </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <asp:Button runat="server" OnClick="GoProcess_Click" Text="Go to Process" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            <%-- <div class="col-sm-12">
        <div class="checkbox">
            <label style="font-size: 2.5em">
                <input type="checkbox" value="" checked>
                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                Huge
            </label>
        </div>
   </div>--%>
<%--                       <br /> <br />     
<div class="container">
    <div class="col-sm-8">
        <div class="input-group">                                            
            <input type="text" ID="datebox" Class="form-control" />
            <div class="input-group-btn">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul id="demolist" class="dropdown-menu">
                    <li><a href="#">A</a></li>
                    <li><a href="#">B</a></li>
                    <li><a href="#">C</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>--%>

          
   

   
</asp:Content>
