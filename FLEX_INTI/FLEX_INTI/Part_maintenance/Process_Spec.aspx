<%@ Page Title="Process Specification" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Process_Spec.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Process_Spec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <p class="lead jumbotron">Create checkpoint for process.</p>

     <div class="form-horizontal">
        <div class="form-group row">
               <div class="col-xs-4"><button type="button" class="btn btn-info" id="add">Add Specification</button></div>
        </div>

        <div id="group">
            <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="#colap" class="panel-title" data-toggle="collapse" data-target="#colap">Specification 1</a>
                </div>
                <div id="colap" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Specification name: " runat="server"></asp:Label>
                            <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Specification number: " runat="server"></asp:Label>
                            <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                            
                        <div class="form-group">
                            <asp:Label CssClass="col-md-2 control-label" Text="Specification range: " runat="server"></asp:Label>
                            <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbl1" CssClass="col-md-2 control-label" runat="server"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        </div>

         <div class="form-group">
            <div class="btn pull-right">
                <asp:Button runat="server" ID="Back" OnClick="Back_Click" Text="Back to Process" CssClass="btn btn-default" PostBackUrl="~/Part_maintenance/Prod_process.aspx" />
                <asp:Button runat="server" ID="Save" OnClick="Save_Click" Text="Save" CssClass="btn btn-default"/>
            </div>
         </div>
    </div>

    <script type="text/javascript">
            $(document).ready(function() {
                var nextId = 1;
                $('#add').on("click", function () {
                    nextId++;
                    $('#group').append('<div class="panel-group"><div class="panel panel-default"><div class="panel-heading"><a href="#colap' + nextId + '" class="panel-title" data-toggle="collapse" data-target="#colap' + nextId + '">Specification ' + nextId + '</a></div><div id="colap' + nextId + '" class="panel-collapse collapse"><div class="panel-body"><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification name: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification number: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification range: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div></div></div></div></div>');
                });
            });
     </script>


</asp:Content>
