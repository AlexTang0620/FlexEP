<%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Process_Edit.aspx.cs" Inherits="FLEX_INTI.Part_maintenance.Process_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">
        function toggleExpandCollapse(name) {
            var div = document.getElementById(name);
            var img = document.getElementById('img'+name);

            if (div.style.display == 'none') {
                div.style.display = "inline";
                img.src = "../Image/collapse-v2.png";
            }
            else {
                div.style.display = "none";
                img.src = "../Image/expand.png";
            }
        }

        function toggleExpandCollapse2(name) {
            var div = document.getElementById(name);
            var img = document.getElementById('img' + name);

            if (div.style.display == 'none') {
                div.style.display = "inline";
                img.src = "../Image/collapse-v2.png";
            }
            else {
                div.style.display = "none";
                img.src = "../Image/expand.png";
            }
        }
    </script>

    <h1><%:Title %></h1>
    <p class="lead jumbotron">Edit Material/Part/Process/Specification.</p>

    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Edit: </asp:Label>

            <div class="dropdown">
                <asp:DropDownList AutoPostBack="true" runat="server" CssClass="btn btn-default" ID="editWhat" OnSelectedIndexChanged="editWhat_SelectedIndexChanged">
                    <asp:ListItem Text="Select" Value="null"></asp:ListItem>
                    <asp:ListItem Text="Material" Value="material"></asp:ListItem>
                    <asp:ListItem Text="Part" Value="part"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Panel runat="server" ID ="pnlPart">
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="partID" CssClass="table table-bordered" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                     <a href="JavaScript:toggleExpandCollapse('<%# Eval("partID") %>');">
                    <img id="img<%# Eval("partID") %>" border="0" src="../Image/expand.png"/></a> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="partID" HeaderText="partID" SortExpression="partID" />
                    <asp:BoundField DataField="partNumber" HeaderText="partNumber" SortExpression="partNumber" />
                    <asp:BoundField DataField="revision" HeaderText="revision" SortExpression="revision" />
                    <asp:BoundField DataField="materialID" HeaderText="materialID" SortExpression="materialID" />
                    <asp:BoundField DataField="partName" HeaderText="partName" SortExpression="partName" />
                    <asp:BoundField DataField="partDescription" HeaderText="partDescription" SortExpression="partDescription" />
                    <asp:CheckBoxField DataField="isReleased" HeaderText="isReleased" SortExpression="isReleased" />
                    <asp:BoundField DataField="createdBy" HeaderText="createdBy" SortExpression="createdBy" />
                    <asp:BoundField DataField="createdDate" HeaderText="createdDate" SortExpression="createdDate" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="editPart" runat="server" Text="Edit Part" OnClick="editPart_Click" />
                            <%# MyNewRow(Eval("partID")) %>
                            <div id='<%# Eval("partID") %>' style="display:none" />
                            <asp:GridView ID="GridView2" CssClass="table table-bordered" runat="server" DataKeyNames="partID"   CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                    <a href="JavaScript:toggleExpandCollapse2('<%# Eval("processID") %>');">
                                    <img id="img<%# Eval("processID") %>" border="0" src="../Image/expand.png"/></a> 
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="processID">
                                        <ItemTemplate>
                                              <asp:Label ID="procID_lbl" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "processID") %>'></asp:Label>
                                         </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="partID" HeaderText="partID" SortExpression="partID" />
                                    <asp:BoundField DataField="processName" HeaderText="processName" SortExpression="processName" />
                                    <asp:BoundField DataField="processNumber" HeaderText="processNumber" SortExpression="processNumber" />
                                    <asp:BoundField DataField="processDescription" HeaderText="processDescription" SortExpression="processDescription" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                             <asp:Button ID="editProcess" runat="server" Text="Edit Process" OnClick="editProcess_Click" />
                                             <%# MyNewRow(Eval("processID")) %>
                                             <div id='<%# Eval("processID") %>' style="display:none" />
                                             <asp:GridView ID="GridView3" CssClass="table table-bordered" runat="server" DataKeyNames="specificationID" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="specificationID" HeaderText="specificationID" SortExpression="specificationID" />
                                                    <asp:BoundField DataField="processID" HeaderText="processID" SortExpression="processID" />
                                                    <asp:BoundField DataField="specificationNumber" HeaderText="specificationNumber" SortExpression="specificationNumber" />
                                                    <asp:BoundField DataField="specificationName" HeaderText="specificationName" SortExpression="specificationName" />
                                                    <asp:BoundField DataField="specificationRange" HeaderText="specificationRange" SortExpression="specificationRange" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="editSpec" runat="server" Text="Edit Specification" OnClick="editSpec_Click" />
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

            <asp:Panel ID="pnlMaterial" runat="server">
                <asp:GridView ID="GridView4" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="ObjectDataSource4" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="materialID" HeaderText="materialID" SortExpression="materialID" />
                        <asp:BoundField DataField="materialName" HeaderText="materialName" SortExpression="materialName" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="editMaterial" runat="server" Text="Edit Material" OnClick="editMaterial_Click" />
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

            <asp:Panel runat="server" ID="pnlEditMaterial">
                <div class="form-group">
                     <asp:Label ID="lblMatID" CssClass="col-md-2 control-label" Text ="Material ID: " runat="server"></asp:Label>
                     <asp:TextBox ID="txtMaterialID" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblMatName" CssClass="col-md-2 control-label" Text ="Material Name: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtMaterialName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>

             <asp:Panel runat="server" ID="pnlEditPart">
                <div class="form-group">
                     <asp:Label ID="lblpartID" CssClass="col-md-2 control-label" Text ="Part ID: " runat="server"></asp:Label>
                     <asp:TextBox ID="txtpartID" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblpartNum" CssClass="col-md-2 control-label" Text ="Part Number: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtpartNum" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="LblRevision" CssClass="col-md-2 control-label" Text ="Revision: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtRevision" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblmaterial" CssClass="col-md-2 control-label" Text ="Material ID: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtMaterial" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblpartName" CssClass="col-md-2 control-label" Text ="Part Name: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtPartName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblpartDesc" CssClass="col-md-2 control-label" Text ="Part Description: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtPartDesc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblReleased" CssClass="col-md-2 control-label" Text ="Released: " runat="server"></asp:Label>
                    <asp:CheckBox ID="checkReleased" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblcreatedBy" CssClass="col-md-2 control-label" Text ="Created By: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtcreatedBy" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblcreatedDate" CssClass="col-md-2 control-label" Text ="Created Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtcreatedDate" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlEditProcess">
                <div class="form-group">
                    <asp:Label ID="lblprocessID" CssClass="col-md-2 control-label" Text ="Process ID: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtprocessID" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblpartID2" CssClass="col-md-2 control-label" Text ="Part ID: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtPartID2" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblprocessName" CssClass="col-md-2 control-label" Text ="Process Name: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtProcessName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblprocessNum" CssClass="col-md-2 control-label" Text ="Process Number: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtProcessNum" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblprocessDesc" CssClass="col-md-2 control-label" Text ="Process Description: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtprocessDesc" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlEditSpec" runat="server">
                <div class="form-group">
                    <asp:Label ID="lblSpecID" CssClass="col-md-2 control-label" Enabled="false" Text ="Specification ID: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSpecID" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblProcessID2" CssClass="col-md-2 control-label" Text ="Process ID: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtProcessID2" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblSpecName" CssClass="col-md-2 control-label" Text ="Specification Name: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSpecName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblSpecNum" CssClass="col-md-2 control-label" Text ="Specification Number: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSpecNum" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblSpecRange" CssClass="col-md-2 control-label" Text ="Specification Range: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSpecRange" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>

         <div class="form-group">
            <div class="btn pull-right">
                 <asp:Button runat="server" ID="save" OnClick="save_Click" CssClass ="btn btn-default" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
