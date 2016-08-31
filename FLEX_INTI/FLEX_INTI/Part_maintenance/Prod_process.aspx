<%@ Page Title="Add Process" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prod_process.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Prod_process" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <p class="lead jumbotron">Create process for part.</p>

    <div class="form-horizontal">
        <div class="form-group row">
               <div class="col-xs-4"><asp:Button runat="server" CssClass="btn btn-info" Text="Add Process" ID="addProcess" OnClick="addProcess_Click" /></div>
<%--               <div class="col-xs-4"><button type="button" class="btn btn-info" id="add">Add Process</button></div>--%>
        </div>

        <div hidden>
            <asp:Button runat="server" ID="invisible" OnClick="invisible_Click" />
            <asp:HiddenField runat="server" ID="Hidden1" ClientIDMode="Static" Value="1"/>
        </div>

        <asp:Panel ID="partProcess" runat="server">
            <%-- CS codes generate process n part details here --%>
            
        </asp:Panel> 

      <div id="group" runat="server">
<%--            <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="#colap" class="panel-title pull-left" data-toggle="collapse" data-target="#colap">Process 1</a>
                    
                    <button type="button" id="editbtn" class="btn btn-info">Edit process</button>
                    <button type="button" id="specAdd" class="btn btn-info" value="1">Add specification &raquo;</button>
                    <div class="clearfix"></div>
                </div>
                <div id="colap" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Process name: " runat="server"></asp:Label>
                            <asp:TextBox ID="txtName1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Process number: " runat="server"></asp:Label>
                            <asp:TextBox ID="txtNum1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                            
                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Process description: " runat="server"></asp:Label>
                            <asp:TextBox ID="txtDesc1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbl1" CssClass="col-md-2 control-label" runat="server"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>--%>
        </div>

         <div class="form-group">
            <div class="btn pull-right">
                 <asp:Button runat="server" ID="save" OnClick="Save_Click" CssClass ="btn btn-default" Text="Save" />
            </div>
        </div>
    </div>

<%--    <script type="text/javascript">
            $(document).ready(function() {
                var nextId = 1;

                $('#add').on("click", function () {
                    nextId++;
                    var content = '<div class="panel-group"><div class="panel panel-default"><div class="panel-heading"><a href="#colap' + nextId + '" class="panel-title pull-left" data-toggle="collapse" data-target="#colap' + nextId + '">Process ' + nextId + ' </a><button type="button" id="specAdd" value = "'+nextId+'" class="btn btn-info pull-right">Add specification &raquo;</button><div class="clearfix"></div></div><div id="colap' + nextId + '" class="panel-collapse collapse"><div class="panel-body"><div class = "form-group"><asp:Label CssClass="col-md-2 control-label" Text="Process name: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Process number: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Process description: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div></div></div></div></div>';

                    $('#group').append(content);

                });

                //THIS IS THE MOST IMPORTANT PART. each process being identified
                $('#group').on("click", "#specAdd", function () {
                    //set variable "identify" to value of "add specification" button clicked. Ex: process 3, add specification value = 3
                    var identify = this.value;

                    //assign add specification value to hidden field so that it can be accessed in c#
                    document.getElementById('<%= Hidden1.ClientID%>').value = identify;

                    //trigger asp:button onClick event
                    var invi = document.getElementById("<%= invisible.ClientID%>");
                    invi.click();
                   
                    //testing only
                    //window.alert(identify);
                });
            });
     </script>--%>

    
</asp:Content>