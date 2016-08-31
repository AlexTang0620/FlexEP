<%@ Page Title="Edit Inspection" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editInspection.aspx.cs" Inherits="FLEX_INTI.Inspection.editInspection" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="~/Scripts/jquery-1.10.2.min.js"></script>

    <style>
        .entryLabel{
            font-weight:normal;
            float:left;
            min-width:150px;
            padding:0px;
            text-align:left;
        }

        .workorder{
            padding:0px 16px;
            height:auto;
        }

        image{
            width:100%;
            height:auto;
        }

        .imageDiv{
            border:solid;
            padding:5px;
            border-radius:5px;
        }

    </style>

    <h1><%: Title %></h1>
    <p class="lead jumbotron">Edit the inspection of selected process.</p>

    <div class="form-horizontal">
        <asp:Panel ID="inspectionDetail" runat="server">
            <%-- CS codes generate process n part details here --%>
        </asp:Panel>

        <div class="imageDiv">
            <a href="#" id="imageToggle" class="MenuLink">Click here to Show/Hide Image.</a>
            <br />

            <asp:Panel runat="server" ID="imagePanel">

            <a class="ImageLink" onclick="plusDivs(-1)">Previous Image</a>
            <a class="ImageLink" style="float:right;" onclick="plusDivs(1)">Next Image</a>
            </asp:Panel>
        </div>

        <br />
        <asp:Panel id="group" runat="server">
            <%-- cs codes add textbox and colap part here --%>

        </asp:Panel>

         <div class="form-group">
            <div class="btn pull-right">
                <%--<asp:Button runat="server" ID="save" OnClick="Save_Click" CssClass ="btn btn-default" Text="Save" />--%>
                <br />
                <asp:Button runat="server" ID="Back" onclick="goBack" CssClass ="btn btn-default" Text="Back" />
                <%--show current nextID value--%> 
<%--                <asp:Button runat="server" ID="inspection1" onclick="enableEdit" CssClass="btn btn-default" Text="Edit Inspection &raquo;" />";--%>

            </div>
        </div>
    </div>

<script>
    $("#MainContent_imagePanel").hide();


    var image = document.getElementById('imageToggle');
    image.onclick = toggleImage;

    function toggleImage() {
        $("#MainContent_imagePanel").toggle(1000);
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