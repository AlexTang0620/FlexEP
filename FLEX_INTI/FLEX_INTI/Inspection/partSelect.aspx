<%@ Page Title="Part Select" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="partSelect.aspx.cs" Inherits="FLEX_INTI.Inspection.partSelect" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="~/Scripts/jquery-1.10.2.min.js"></script>

    <style>

        select{
            width:65%;
        }

        .processLabel{
            float:left;
            text-align:center;
            width:10%;
        }

        .statusLabel{
            margin-left:15px;
            text-align:center;
            float:left;
            width:10%;
        }

        .workorderLabel{
            text-align:center;
            margin-left:15px;
            float:left;
            width:10%;
        }

        .actionLabel{
            margin-left:15px;
            float:left;
            width:60%;
        }


    </style>

    <h1>QC Inspection</h1>
    <p class="lead jumbotron">Please select the correct part and process to continue.</p>
    <div class="Body">
        <p>Legends : <img src="../Image/inspection/done.png" />Completed Process&emsp;&emsp;<img src="../Image/inspection/available.png" />Available&emsp;&emsp;<img src="../Image/inspection/progress.gif" />In progress&emsp;&emsp;<img src="../Image/inspection/lock.png" />Locked</p>
        <br />
        <%--<div ID="SuccessAlert" class="alert alert-success fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> This alert box could indicate a successful or positive action.
        </div>--%>
        <div style="height:auto;">
            <asp:Panel runat="server" CssClass="C1" ID="partSelectPanel">
                    <p>Please select the part:</p>
                    <asp:DropDownList runat="server" ID="partSelectDrop" AutoPostBack="false">
                        <asp:ListItem Value="0" Enabled="false" Selected="True">-- Please Select Part --</asp:ListItem>


                    </asp:DropDownList>
                </asp:Panel>


                <asp:Panel runat="server" CssClass="C2" ID="processDetailPanel">
                    <p class="processLabel">Process</p><p class="statusLabel">Status</p><p class="workorderLabel">Workorder</p><p class="actionLabel">Action</p>
                    <p class="processLabel" style="text-align:center;">1</p>
                    <p class="statusLabel"><img src="../Image/inspection/done.png"/></p>
                    <p class="workorderLabel">WO0001</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="completeProcess1" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel">2</p>
                    <p class="statusLabel"><img src="../Image/inspection/progress.gif"/></p>
                    <p class="workorderLabel">WO0003</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A1" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel" style="text-align:center;">3</p>
                    <p class="statusLabel"><img src="../Image/inspection/available.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A2" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel" style="text-align:center;">4</p>
                    <p class="statusLabel"><img src="../Image/inspection/lock.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A3" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p style="float:left;"><a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Complete Production</a></p>
                    <br style="clear:both;" />
                    <hr />

                    <p class="processLabel">Process</p><p class="statusLabel">Status</p><p class="workorderLabel">Workorder</p><p class="actionLabel">Action</p>
                    <p class="processLabel" style="text-align:center;">1</p>
                    <p class="statusLabel"><img src="../Image/inspection/available.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A5" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel">2</p>
                    <p class="statusLabel"><img src="../Image/inspection/lock.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A6" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel" style="text-align:center;">3</p>
                    <p class="statusLabel"><img src="../Image/inspection/lock.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A7" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p class="processLabel" style="text-align:center;">4</p>
                    <p class="statusLabel"><img src="../Image/inspection/lock.png"/></p>
                    <p class="workorderLabel">-</p>
                    <p class="actionLabel">
                        <a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Inspection</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="#" id="A8" onclick="Confirm()" onserverclick="completeProcess">Complete</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/viewInspection">View</a>
                        &emsp;&emsp;<a class="MenuLink" runat="server" href="~/Inspection/editInspection">Edit</a>
                    </p><br style="clear:both;" />

                    <p style="float:left;"><a class="MenuLink" runat="server" href="~/Inspection/inspectionEntry">Complete Production</a></p>
                    <br style="clear:both;" />
                    <hr />
                    <a class="MenuLink" runat="server" href="#" id="A4" onclick="Confirm()" onserverclick="completeProcess">Create new batch</a>

                </asp:Panel>
            </div>
        </div>
    <br style="clear:both;"/>


    <script>
        $("#MainContent_processDetailPanel").hide();

        $(document).ready(function(){
        $('#MainContent_partSelectDrop').on('change', function() {
                if (this.value != '0')
                {
                    $("#MainContent_processDetailPanel").show(1000);
                }
                else
                {
                    $("#MainContent_processDetailPanel").hide(1000);
                }
        });



        });

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
