<%@ Page Title="Process Specification" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Process_Spec.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Process_Spec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <p class="lead jumbotron">Create checkpoint for process.</p>

     <div class="form-horizontal">
        <p>Part Number: </p>
        <p>Process Number: </p>

        <br />

         <a href="#" id="imageToggle" class="MenuLink">Click here to Show/Hide Image.</a>
         <br />
         <div id="Image">
            <img class="imageSlides" src="http://www.w3schools.com/w3css/img_lights.jpg" style="width:100%; height:auto;">
            <img class="imageSlides" src="http://www.w3schools.com/w3css/img_fjords.jpg" style="width:100%; height:auto;">

            <a class="ImageLink" onclick="plusDivs(-1)">Previous Image</a>
            <a class="ImageLink" style="float:right;" onclick="plusDivs(1)">Next Image</a>
         </div>

         <br />
        <div class="form-group row">
               <div class="col-xs-4"><asp:Button runat="server" CssClass="btn btn-info" Text="Add Checkpoint" ID="addCheckpt" OnClick="addCheckpt_Click" /></div>
<%--               <div class="col-xs-4"><button type="button" class="btn btn-info" id="add">Add Checkpoint</button></div>--%>
        </div>

        <div id="group" runat="server">
            <%-- dynamic textboxes and HTML added inside here --%>
        </div>

         <div class="form-group">
            <div class="btn pull-right">
                <asp:Button runat="server" ID="Back" OnClick="Back_Click" Text="Back to Process" CssClass="btn btn-default" PostBackUrl="~/Part_maintenance/Prod_process.aspx" />
                <asp:Button runat="server" ID="Save" OnClick="Save_Click" Text="Save" CssClass="btn btn-default"/>
            </div>
         </div>
    </div>

    <script type="text/javascript">
            //$(document).ready(function() {
            //    var nextId = 1;
            //    $('#add').on("click", function () {
            //        nextId++;
            //        $('#group').append('<div class="panel-group"><div class="panel panel-default"><div class="panel-heading"><a href="#colap' + nextId + '" class="panel-title" data-toggle="collapse" data-target="#colap' + nextId + '">Specification ' + nextId + '</a></div><div id="colap' + nextId + '" class="panel-collapse collapse"><div class="panel-body"><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification name: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification number: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div><div class="form-group"><asp:Label CssClass="col-md-2 control-label" Text="Specification range: " runat="server"></asp:Label><asp:TextBox CssClass="form-control" runat="server"></asp:TextBox></div></div></div></div></div>');
            //    });
            //});

            $("#Image").hide();


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
     </script>


</asp:Content>
