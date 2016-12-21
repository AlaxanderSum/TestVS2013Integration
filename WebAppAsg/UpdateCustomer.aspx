<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCustomer.aspx.cs" Inherits="WebAppAsg.UpdateCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 6px;
        }
        .auto-style3 {
            width: 167px;
        }
        .auto-style5 {
            width: 5px;
        }
        .auto-style6 {
            width: 420px;
        }
        .auto-style9 {
            width: 135px;
        }
        .auto-style10 {
            width: 135px;
            height: 35px;
        }
        .auto-style11 {
            width: 5px;
            height: 35px;
        }
        .auto-style12 {
            width: 420px;
            height: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="CustomerID" DataSourceID="LinqDataSource1" ForeColor="Black" Height="239px" Width="60%" OnPreRender="FormView1_PreRender">
            <EditItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style9">Name</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Name is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">IC Number</td>
                        <td class="auto-style11">:</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="IcNumberTextBox" runat="server" Text='<%# Bind("IcNumber") %>' placeholder="999999999999"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="IcNumberTextBox" ErrorMessage="IC Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="IcNumberTextBox" ErrorMessage="Must be excatly 12 digits for the Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{12}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Contact No(Home)</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="HomePhoneNoTextBox" runat="server" Text='<%# Bind("HomePhoneNo") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="HomePhoneNoTextBox" ErrorMessage="Contact No(Home) is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="HomePhoneNoTextBox" ErrorMessage="Must be excatly 12 digits for the Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Contact No(Phone)</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="MobilePhoneNoTextBox" runat="server" Text='<%# Bind("MobilePhoneNo") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="MobilePhoneNoTextBox" ErrorMessage="Contact No(Phone) is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="MobilePhoneNoTextBox" ErrorMessage="Must be excatly 12 digits for the Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Address</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="AddressTextBox" runat="server" Height="110px" Text='<%# Bind("Address") %>' TextMode="MultiLine" Width="316px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Driver Address is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Post Code</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="PostCodeTextBox" runat="server" Text='<%# Bind("PostCode") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="PostCodeTextBox" ErrorMessage="Post Code is a required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="PostCodeTextBox" ErrorMessage="Only number is allowed" ForeColor="Red" ValidationExpression="^[\d+$]{5}">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">State</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("State") %>'>
                                <asp:ListItem>Selangor</asp:ListItem>
                                <asp:ListItem>Kuala Lumpur</asp:ListItem>
                                <asp:ListItem>Sarawak</asp:ListItem>
                                <asp:ListItem>Pulau Pinang</asp:ListItem>
                                <asp:ListItem>Johor</asp:ListItem>
                                <asp:ListItem>Negeri Sembilan</asp:ListItem>
                                <asp:ListItem>Kedah</asp:ListItem>
                                <asp:ListItem>Ipoh</asp:ListItem>
                                <asp:ListItem>Melaka</asp:ListItem>
                                <asp:ListItem>Sabah</asp:ListItem>
                                <asp:ListItem>Perak</asp:ListItem>
                                <asp:ListItem>Pahang</asp:ListItem>
                                <asp:ListItem>Terengganu</asp:ListItem>
                                <asp:ListItem>Kelantan</asp:ListItem>
                                <asp:ListItem>Perlis</asp:ListItem>
                                <asp:ListItem>Labuan</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlState" ErrorMessage="State is a required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Gender</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Gender is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Email Address</td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="EmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="EmailAddressTextBox" ErrorMessage="Email Address is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="EmailAddressTextBox" ErrorMessage="Invalid Email Format!" ForeColor="Red" ValidationExpression="^\S+@\S+$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encounterd" ShowMessageBox="True" />
            </EditItemTemplate>
             <EditRowStyle BackColor="SeaShell" ForeColor="Black" />
            <FooterStyle BackColor="Black" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <HeaderTemplate>
                Your Personal Information
            </HeaderTemplate>
            <InsertItemTemplate>
                CustomerID:
                <asp:TextBox ID="CustomerIDTextBox" runat="server" Text='<%# Bind("CustomerID") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                PostCode:
                <asp:TextBox ID="PostCodeTextBox" runat="server" Text='<%# Bind("PostCode") %>' />
                <br />
                State:
                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                <br />
                Gender:
                <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                <br />
                HomePhoneNo:
                <asp:TextBox ID="HomePhoneNoTextBox" runat="server" Text='<%# Bind("HomePhoneNo") %>' />
                <br />
                MobilePhoneNo:
                <asp:TextBox ID="MobilePhoneNoTextBox" runat="server" Text='<%# Bind("MobilePhoneNo") %>' />
                <br />
                EmailAddress:
                <asp:TextBox ID="EmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' />
                <br />
                IcNumber:
                <asp:TextBox ID="IcNumberTextBox" runat="server" Text='<%# Bind("IcNumber") %>' />
                <br />
                username:
                <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style3">Name</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">IC Number</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="IcNumberLabel" runat="server" Text='<%# Bind("IcNumber") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Contact Number (Home)</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="lblPhone1" runat="server"></asp:Label>
                            -<asp:Label ID="lblPhone2" runat="server"></asp:Label>
                            <asp:Label ID="HomePhoneNoLabel" runat="server" Text='<%# Bind("HomePhoneNo") %>' Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Contact Number (Phone)</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="lblPhone3" runat="server"></asp:Label>
                            -<asp:Label ID="lblPhone4" runat="server"></asp:Label>
                            <asp:Label ID="MobilePhoneNoLabel" runat="server" Text='<%# Bind("MobilePhoneNo") %>' Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Address</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Post Code</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="PostCodeLabel" runat="server" Text='<%# Bind("PostCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">State</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Gender</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Email Address</td>
                        <td class="auto-style2">:</td>
                        <td>
                            <asp:Label ID="EmailAddressLabel" runat="server" Text='<%# Bind("EmailAddress") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:FormView> 
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebAppAsg.LINQDataContext" EnableUpdate="True" EntityTypeName="" TableName="Customers" Where="CustomerID == @CustomerID">
            <WhereParameters>
                <asp:ControlParameter ControlID="lblCustomerID" Name="CustomerID" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:Button ID="btnBack" runat="server" OnClick="btnCreate_Click" Text="Back" />
        <br />
        <asp:Label ID="lblCustomerID" runat="server" Visible="False"></asp:Label>
    </div>
    </form>
</body>
</html>
