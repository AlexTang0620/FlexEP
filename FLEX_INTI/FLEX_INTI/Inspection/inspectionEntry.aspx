<%@ Page Title="Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inspectionEntry.aspx.cs" Inherits="FLEX_INTI.Inspection.DataEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="~/Scripts/jquery-1.10.2.min.js"></script>

    <style>

        image{
            width:100%;
            height:auto;
        }

        .imageDiv{
            border:solid;
            padding:5px;
            border-radius:5px;
        }

        .entryLabel{
            font-weight:normal;
            float:left;
            min-width:150px;
        }

        .workorder{
            padding:0px 16px;
            height:auto;
        }

    </style>

    <h1>QC Inspection</h1>
    <p class="load jumbotron">Enter the inspected value from every checkpoint.</p>

    <div class="Body">
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

            <div class="form-group">
                <asp:Panel runat="server" id="dataEntry">
                    <label class="entryLabel control-label">Checkpoint</label><label class="entryLabel control-label">Characteristics</label><label class="entryLabel control-label">Specification</label><label class="entryLabel control-label">Result</label>
                    <br /><br />

                </asp:Panel>

                    <asp:Label CssClass="control-label entryLabel" runat="server">Result: </asp:Label>
                        <select id="resultStatus">
                            <option value="0">OK</option>
                            <option value="1">NG</option>
                        </select>

                    <br />
                <br />
                    <asp:Button runat="server" onclick="goBack" Text="Cancel" CssClass="btn btn-default floatRight" />
                    <asp:Button runat="server" onclientclick="Confirm()" onclick="saveDraft" Text="Save Draft" CssClass="btn btn-default" />
                    <asp:Button runat="server" onclientclick="Confirm()" onclick="saveEntry" Text="Save" CssClass="btn btn-default" />
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

    function Confirm() {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Do you want to save data?")) {
            confirm_value.value = "Yes";
        } else {
            confirm_value.value = "No";
        }
        document.forms[0].appendChild(confirm_value);
    }

</script>


</asp:Content>
