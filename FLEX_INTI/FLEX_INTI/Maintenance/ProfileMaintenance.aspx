<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileMaintenance.aspx.cs" Inherits="FLEX_INTI.Maintenance.ProfileMaintenance" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
  
</asp:Content>


            

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p class="lead jumbotron">Profile Maintenance</p>

<%--                    <asp:GridView ID="gv_ProfileMaintenance" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.UserName, C.Name FROM  aspnetUsers A  
LEFT JOIN AspNetUserRoles B
ON A.Id = B.UserId LEFT JOIN ASPNETROLES C
ON B.ROLEID = C.Id
"></asp:SqlDataSource>--%>
        
         
  <%--  horizontal align="center" moves the grid view to the center--%>
    <asp:GridView ID="gv_ProfileMaintenance" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ItemStyle-Width="200px">
                  <HeaderTemplate>
                     <div style="text-align:center;">Username</div>
                 </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Eval("Username") %>' />
                </ItemTemplate>


<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width="200px">
                    <HeaderTemplate>
                     <div style="text-align:center;">Role</div>
                 </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="name" runat="server" Text='<%# Eval("Name") %>' />
                </ItemTemplate>

<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>

             <asp:TemplateField ItemStyle-Width="200px">
                     <HeaderTemplate>
                     <div style="text-align:center;">Controls</div>
                 </HeaderTemplate>
                <ItemTemplate>
                  <asp:LinkButton ID="Edit" runat="server">Edit</asp:LinkButton>
                </ItemTemplate>

<ItemStyle Width="200px"></ItemStyle>
            </asp:TemplateField>
        </Columns>

        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
   

   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.UserName, C.Name FROM  aspnetUsers A  
LEFT JOIN AspNetUserRoles B
ON A.Id = B.UserId LEFT JOIN ASPNETROLES C
ON B.ROLEID = C.Id
"></asp:SqlDataSource>
   

   
</asp:Content>
