<%@ Page Title="Searching" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searching.aspx.cs" Inherits="FLEX_INTI.Inspection.searching" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>

        .labelCustom{
            float:left;
            min-width:200px;
            padding:0px;
            text-align:left;
            line-height: 30px;
            padding-left: 15px;
        }

        .textboxCustom{
            min-width:70%;
        }

        .checkboxCustom{
            width:30px;
        }

    </style>

    <h1><%: Title %></h1>
    <p class="lead jumbotron">Search the database.</p>

    <div class="form-horizontal">
        <div class ="body">

            <label class="labelCustom">Part Number : </label><asp:TextBox runat="server" ID="txtPartNumber" CssClass="form-control"></asp:TextBox><br />
            <label class="labelCustom">Part Revision : </label><asp:TextBox runat="server" ID="txtRevision" CssClass="form-control"></asp:TextBox><br />
            <label class="labelCustom">Work Order : </label><asp:TextBox runat="server" ID="txtWorkOrder" CssClass="form-control"></asp:TextBox><br />
            <label class="labelCustom">Process Number : </label><asp:TextBox runat="server" ID="txtProcessNumber" CssClass="form-control"></asp:TextBox><br />
            <label class="labelCustom">Inspection Date : </label><input type="date" runat="server" ID="inspectionDateFrom" class="form-control" style="width:auto;float:left;"> <p style="float:left; margin:5px;"> TO </p> <input type="date" runat="server" ID="inspectionDateTo" class="form-control" style="width:auto;float:left;">

            <br style="clear:both;"/><br style="clear:both;"/>
            <label class="labelCustom">Inspection Number : </label><asp:TextBox runat="server" ID="txtInspectionNumber" CssClass="form-control"></asp:TextBox><br />
            <label class="labelCustom">Process Status : </label><asp:DropDownList runat="server" ID="dropProcessStatus" CssClass="form-control" style="width:auto;">
                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                <asp:ListItem Value="progress">Draft Saved</asp:ListItem>
                                                                <asp:ListItem Value="progress">In Progress</asp:ListItem>
                                                                <asp:ListItem Value="completed">Completed</asp:ListItem>
                                                              </asp:DropDownList><br />

            <label class="labelCustom">Batch Status : </label><asp:DropDownList runat="server" ID="dropBatchStatus" CssClass="form-control" style="width:auto;">
                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                <asp:ListItem Value="progress">In Progress</asp:ListItem>
                                                                <asp:ListItem Value="completed">Completed</asp:ListItem>
                                                              </asp:DropDownList>
            <br />
            <asp:Button runat="server" ID="btnSearch" onclick="search" CssClass ="btn btn-default" Text="Search" style="margin-left:10px;"/>
            <br /><br />

            <asp:Panel ID="GridView" runat="server" Visible="false" Width="100%">
                <asp:GridView Width="100%" ID="GridView1" runat="server"
                    EmptyDataText="--- Empty Grid ---" Caption="Search Result" CaptionAlign="Top" >
                </asp:GridView>
            </asp:Panel>

             <div class="form-group">
                <div class="btn pull-right">
                    <br />
                    <asp:Button runat="server" ID="Back" onclick="goBack" CssClass ="btn btn-default" Text="Back" />
                
                </div>
            </div>
        </div>
    </div>
</asp:Content>
