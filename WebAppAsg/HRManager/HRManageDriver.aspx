<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRManageDriver.aspx.cs" Inherits="WebAppAsg.DriverHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <script src="../jquery-ui-1.11.2/external/jquery/jquery.js"></script>
    <script src="../jquery-ui-1.11.2/jquery-ui.js"></script>
    <link href="../jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" />
    <link href="../jquery-ui-1.11.2/jquery-ui.min.css" rel="stylesheet" />
    <link href="../jquery-ui-1.11.2/jquery-ui.structure.min.css" rel="stylesheet" />
    <link href="../jquery-ui-1.11.2/jquery-ui.structure.css" rel="stylesheet" />
    <link href="../jquery-ui-1.11.2/jquery-ui.theme.css" rel="stylesheet" />
    <link href="../jquery-ui-1.11.2/jquery-ui.theme.min.css" rel="stylesheet" />
   
    <script type="text/javascript">
        $(function () {
            $(".youpi").datepicker({
               
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2016, 12, 1),
                maxDate: new Date(2030, 12, 31)
            });
        });
       </script>
  
    <title>Manage Driver</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Label ID="Label9" runat="server" Text="Search:"></asp:Label>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
        <br />
    <br />
        Click &quot;Select&quot; in order to update specific driver&#39;s taxi information.<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="LinqDataSource1" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" DataKeyNames="DriverID" Height="205px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-right: 0px" Width="97%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="DriverID" HeaderText="Driver ID" ReadOnly="True" SortExpression="DriverID" />
                
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                   
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Name") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="Name is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Gender" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="IC Number" SortExpression="ICNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ICNo") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="IC Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Must be excatly 12 digits for the Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{12}"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ICNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact Number" SortExpression="ContactNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ContactNo") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox3" ErrorMessage="Contact No(Phone) is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must be excatly 12 digits for the Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{10}"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox4" ErrorMessage="Driver Address is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Driving License Expiry Date" SortExpression="DrivingLicenseExpiryDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="youpi" Text='<%# Bind("DrivingLicenseExpiryDate", "{0:d/M/yyyy}") %>' Enabled="True" ReadOnly="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDate" ErrorMessage="Driving License Expiry Date is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDate" ErrorMessage="The date format should be DD/MM/YYYY" ForeColor="Red" Text="*" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DrivingLicenseExpiryDate", "{0:d/M/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Taxi Company" SortExpression="TaxiCompany">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7" ErrorMessage="Taxi Company is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Driver Status" SortExpression="DriverStatus">
                    <EditItemTemplate>
                      <asp:DropDownList ID="DriverStatus" runat="server" SelectedValue='<%# Bind("DriverStatus") %>'>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="DriverStatus" ErrorMessage="Driver Status is a required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DriverStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create New Driver" />
        <br />
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebAppAsg.LINQDataContext" EntityTypeName="" TableName="Drivers" EnableUpdate="True" OnSelecting="LinqDataSource1_Selecting">
        </asp:LinqDataSource>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encounterd" ShowMessageBox="True" />
        <br />
        </div>
    </form>
</body>
</html>
