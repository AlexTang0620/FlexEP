<%@ Page Title="Reporting" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reporting.aspx.cs" Inherits="FLEX_INTI.Reporting.reporting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PartNo" CssClass="col-md-2 control-label">Part No.</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PartNo" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PartNo" CssClass="text-danger" ErrorMessage="The Part No. field is required." />
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="WorkOrder" CssClass="col-md-2 control-label">Work Order</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="WorkOrder" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="WorkOrder" CssClass="text-danger" ErrorMessage="The Work Order field is required." />
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="SubmitDate" CssClass="col-md-2 control-label">Submit Date</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="SubmitDate" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SubmitDate" CssClass="text-danger" ErrorMessage="The Submit Date field is required." />
            </div>
        </div>
    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="search_DatabaseRecord" Text="Search" CssClass="btn btn-default" />
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PartNo" CssClass="col-md-2 control-label">Report</asp:Label>
        </div>
    <table style="width:100%" id="tableContent" border="1" runat="server">
    <tr>
        <td>CP</td>
        <td>FP</td>
        <td>II</td>
        <td>PC</td>
        <td>OC</td>
        <td>Characteristic</td>
        <td>Specification</td>
        <td>Equipment</td>
        <td>Tool ID</td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
    <tr>
        <td>1</td>
        <td>*</td>
        <td> </td>
        <td>*</td>
        <td> </td>
        <td>Radius</td>
        <td>R3.5~R4.5</td>
        <td>CMM/R.Gauge</td>
        <td></td>
        <td>4.13</td>
        <td>4.18</td>
        <td>4.14</td>
    </tr>
    <tr>
        <td>2</td>
        <td>*</td>
        <td> </td>
        <td>*</td>
        <td> </td>
        <td>Angle</td>
        <td>89~91</td>
        <td>CMM/Protractor</td>
        <td></td>
        <td>90</td>
        <td>90</td>
        <td>90</td>
    </tr>
</table>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="export_Data" Text="Export" CssClass="btn btn-default" />
            </div>
        </div>
</asp:Content>
