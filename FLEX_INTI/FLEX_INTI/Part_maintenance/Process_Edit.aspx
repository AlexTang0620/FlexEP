<%@ Page Title="Edit & Delete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Process_Edit.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Process_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <h1><%:Title %></h1>
    <p class="lead jumbotron">Edit Material/Part/Process/Specification.</p>

    <div class="form-horizontal">
        <ul class="nav nav-pills">
             <li>
                <a href="Part.aspx">Add New Part/Revision</a>
             </li>
             <li>
                <a href="#">Edit & Delete Part/Process/Specification</a>
             </li>
            <li>
                <a href="Delete_Material.aspx">Delete Material</a>
             </li>
        </ul>
        <hr />       

    <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Filter by: </asp:Label>

            <div class="dropdown col-md-2">
                <asp:DropDownList runat="server" EnableViewState="true" CssClass="btn btn-default" ID="filterBy">
                    <asp:ListItem Text="Select" Value=""></asp:ListItem>
                    <asp:ListItem Text="Part Number" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Material" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Released" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Created Date" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-2">
                <asp:TextBox ID="txtboxFilter" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtboxFilter" CssClass="text-danger" ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
            </div>

            <div class="col-md-2">
                <asp:Button runat="server" ID="btnRetrieve" CssClass="btn btn-info" Text="Retrieve Data" OnClick="btnRetrieve_Click" />
            </div>

        </div>

        <div class="form-group">
            <asp:Panel runat="server" ID ="pnlPart">
                <asp:GridView ID="GridView1" AllowPaging="true" runat="server" DataKeyNames="partID" CssClass="table table-bordered" CellPadding="3" 
                    GridLines="Vertical" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                    BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" 
                    OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                     OnRowUpdating="GridView1_RowUpdating">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                     <button id="imgA<%# Eval("partID")%>" class="btn btn-default glyphicon glyphicon-plus" onclick="return toggleExpandCollapse('<%# Eval("partID") %>')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Part ID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblpartID" runat="server" Text='<%# Bind("partID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Part Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="editPartNum" runat="server" CssClass="form-control" Text='<%# Bind("partNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPartNum" runat="server" Text='<%# Bind("partNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="revision" ReadOnly="true" HeaderText="Revision" SortExpression="revision" />
                    
                    <asp:TemplateField HeaderText="Material">
                        <EditItemTemplate>
                            <asp:TextBox ID="editMaterial" CssClass="form-control" runat="server" Text='<%# getMaterial(DataBinder.Eval(Container.DataItem, "materialID")) %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:Label ID="material_lbl" runat="server" Text='<%# getMaterial(DataBinder.Eval(Container.DataItem, "materialID")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Part Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="editPartName" runat="server" CssClass="form-control" Text='<%# Bind("partName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPartName" runat="server" Text='<%# Bind("partName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CheckBoxField DataField="isReleased" ReadOnly="true" HeaderText="isReleased" SortExpression="isReleased" />

                    <asp:BoundField DataField="createdBy" ReadOnly="true" HeaderText="Created By" SortExpression="createdBy" />
                    <asp:BoundField DataField="createdDate" ReadOnly="true" HeaderText="Created Date" SortExpression="createdDate" />
                    
                    <asp:TemplateField HeaderText="Action">
                        <EditItemTemplate>
                            <asp:LinkButton ID="partUpdate" runat="server" Text="Update" CommandName="Update"></asp:LinkButton>
                            <asp:LinkButton ID="partCancelUpdate" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                        </EditItemTemplate>

                        <ItemTemplate>
                            <asp:LinkButton ID="editPart" runat="server" Text="Edit" CommandName="Edit" />
                            <asp:LinkButton ID="deletePart" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                            <%# MyNewRow(Eval("partID")) %>
                            <div id="divA<%# Eval("partID") %>" style="display:none" />
                            <asp:GridView ID="GridView2" CssClass="table table-bordered" runat="server" DataKeyNames="partID"   CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                    <button id="imgB<%# Eval("processID")%>" class="btn btn-default glyphicon glyphicon-plus" onclick="return toggleExpandCollapse2('<%# Eval("processID") %>')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="processID" Visible="false">
                                        <ItemTemplate>
                                              <asp:Label ID="procID_lbl" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "processID") %>'></asp:Label>
                                         </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="processName" HeaderText="Process Name" SortExpression="processName" />
                                    <asp:BoundField DataField="processNumber" HeaderText="Process Number" SortExpression="processNumber" />

                                    <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:HyperLink Text="http://www.w3schools.com/w3css/img_lights.jpg" NavigateUrl="http://www.w3schools.com/w3css/img_lights.jpg" runat="server" Target="_blank"></asp:HyperLink><br />
                                        <asp:HyperLink Text="http://www.w3schools.com/w3css/img_fjords.jpg" NavigateUrl="http://www.w3schools.com/w3css/img_fjords.jpg" runat="server" Target="_blank"></asp:HyperLink>
                                    </ItemTemplate>
                    </asp:TemplateField>



                                    <asp:TemplateField>
                                        <ItemTemplate>
                                             <asp:LinkButton ID="editProcess" runat="server" Text="Edit" CommandName="Edit" />
                                             <asp:LinkButton ID="deleteProcess" runat="server" Text="Delete" CommandName="Delete" /> 
                                            <%# MyNewRow(Eval("processID")) %>
                                             <div id="divB<%# Eval("processID") %>" style="display:none" />
                                             <asp:GridView ID="GridView3" CssClass="table table-bordered" runat="server" DataKeyNames="specificationID" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="specificationNumber" HeaderText="Checkpoint Number" SortExpression="specificationNumber" />
                                                    <asp:BoundField DataField="specificationName" HeaderText="Checkpoint Name" SortExpression="specificationName" />
                                                    <asp:BoundField DataField="specificationRange" HeaderText="Checkpoint Range" SortExpression="specificationRange" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="editSpec" runat="server" Text="Edit" CommandName="Edit" />
                                                            <asp:LinkButton ID="deleteSpec" runat="server" Text="Delete" CommandName="Delete"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCC99" />
                                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                <RowStyle BackColor="#F7F7DE" />
                                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                <SortedDescendingHeaderStyle BackColor="#575357" />
                                            </asp:GridView>

                                        </ItemTemplate>
                                    </asp:TemplateField>
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

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle Height="29px" Width="32px" />
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

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllParts" TypeName="Flex.Part_maintenance.PartDataAccessLayer"></asp:ObjectDataSource>
            </asp:Panel>

    </div>
 </div>

        <script type="text/javascript">
        function toggleExpandCollapse(name) {
            var div = document.getElementById('divA' + name);
            var img = document.getElementById('imgA'+name);

            if (div.style.display == 'none') {
                div.style.display = "inline";
                img.classList.remove('glyphicon-plus');
                img.classList.add('glyphicon-minus');
            }
            else {
                div.style.display = "none";
                img.classList.add('glyphicon-plus');
                img.classList.remove('glyphicon-minus');
            }

            return false;
        }

        function toggleExpandCollapse2(name) {
            var div = document.getElementById('divB' + name);
            var img = document.getElementById('imgB' + name);

            if (div.style.display == 'none') {
                div.style.display = "inline";
                img.classList.remove('glyphicon-plus');
                img.classList.add('glyphicon-minus');
            }
            else {
                div.style.display = "none";
                img.classList.add('glyphicon-plus');
                img.classList.remove('glyphicon-minus');
            }

            return false;
        }

        $("#Image").hide();
        $("#delLink").hide();

        var image = document.getElementById('imageToggle');
        image.onclick = toggleImage;


        function toggleImage() {
            $("#Image").toggle(1000);
            $("#delLink").show();

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
