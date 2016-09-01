<%@ Page Title="Add Process" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prod_process.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Prod_process" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <p class="lead jumbotron">Create process for part.</p>

    <div class="form-horizontal">
        <p>Part Number: </p>
        <p>Revision: </p>
        <br />

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
          <%-- dynamic textboxes and HTML added inside here --%>
       </div>

         <div class="form-group">
            <div class="btn pull-right">
                 <asp:Button runat="server" ID="Back" OnClick="Back_Click" CssClass ="btn btn-default" Text="Back" />
                 <asp:Button runat="server" ID="save" OnClick="Save_Click" CssClass ="btn btn-default" Text="Save" />
            </div>
        </div>
    </div>

<%--     <script type="text/javascript">
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
            });--%>

<%--       $("#Image").hide();


       var image = document.getElementById('imageToggle');
       image.onclick = toggleImage;


       function toggleImage() {
           $("#Image").toggle(1000);
           return false;
       }

       var slideIndex = 1;
       showDivs(slideIndex);

       function plusDivs(n) {
           showDivs(slideIndex += n);
       }

       function showDivs(n) {
           var i;
           var x = document.getElementsByClassName("imageSlides");
           if (n > x.length) { slideIndex = 1 }
           if (n < 1) { slideIndex = x.length }
           for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";
           }
           x[slideIndex - 1].style.display = "block";
       }

     </script>--%>

    
</asp:Content>