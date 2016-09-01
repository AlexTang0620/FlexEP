<%@ Page Title="Delete Material" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete_Material.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Delete_Material" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%:Title %></h1>
    <p class="lead jumbotron">Delete Material.</p>

    <div class="form-horizontal">
        <ul class="nav nav-pills">
             <li>
                <a href="Part.aspx">Add New Part/Revision</a>
             </li>
             <li>
                <a href="Process_Edit.aspx">Edit & Delete Part/Process/Specification</a>
             </li>
            <li>
                <a href="#">Delete Material</a>
             </li>
        </ul>
        <hr />  
             
                <asp:Panel ID="pnlMaterial" runat="server">
                <asp:GridView ID="GridView4" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="ObjectDataSource4" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
<%--                        <asp:BoundField DataField="materialID" HeaderText="materialID" SortExpression="materialID" />--%>
                        <asp:BoundField DataField="materialName" HeaderText="Material Name" SortExpression="materialName" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="deleteMaterial" runat="server" Text="Delete Material" OnClick="deleteMaterial_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetAllMaterial" TypeName="Flex.Part_maintenance.MaterialDataAccessLayer"></asp:ObjectDataSource>
            </asp:Panel>
        </div>
</asp:Content>
