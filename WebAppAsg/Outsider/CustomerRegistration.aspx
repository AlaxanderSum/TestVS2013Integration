<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="WebAppAsg.CustomerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 134px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Customer Registration Form</h1>
      
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Name</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is a required field." ControlToValidate="txtName" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">IC Number</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtIc1" runat="server" Width="76px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtIc2" runat="server" Width="25px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtIc3" runat="server" Width="73px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIc1" ErrorMessage="IC Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtIc2" ErrorMessage="IC Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtIc3" ErrorMessage="IC Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIc1" ErrorMessage="Must be excatly 6 number for the first column of Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{6}">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtIc2" ErrorMessage="Must be excatly 2 number for the second column of Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{2}">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtIc3" ErrorMessage="Must be excatly 6 number for the first column of Ic Number." ForeColor="Red" Text="*" ValidationExpression="^[\d+$]{4}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact No(Home)</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPhone1" runat="server" Width="39px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtPhone2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Contact No(Home) is a required field." ControlToValidate="txtPhone1" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Contact No(Home) is a required field." ControlToValidate="txtPhone2" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Must be exactly 3 characters for Contact No(Home) column 1" ControlToValidate="txtPhone1" ForeColor="Red" ValidationExpression="^[\d+$]{2}">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Must be excalty 7 characters for Contact Number(Home) column 2" ControlToValidate="txtPhone2" ForeColor="Red" ValidationExpression="^[\d+$]{7}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                <td class="auto-style1">Contact No(Phone)</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPhone11" runat="server" Width="39px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtPhone22" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Contact No(Phone) is a required field." ControlToValidate="txtPhone11" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Contact No(Phone) is a required field." ControlToValidate="txtPhone22" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Must be exactly 3 characters for Contact No(Phone) column 1" ControlToValidate="txtPhone11" ForeColor="Red" ValidationExpression="^[\d+$]{3}">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Must be excalty 7 characters for Contact Number(Phone) column 2" ControlToValidate="txtPhone22" ForeColor="Red" ValidationExpression="^[\d+$]{7}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;Address</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="73px" Width="402px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Driver Address is a required field." ControlToValidate="txtAddress" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Post Code</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPostCode" runat="server" Height="22px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPostCode" ErrorMessage="Post Code is a required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtPostCode" ErrorMessage="Only number is allowed" ForeColor="Red" ValidationExpression="^[\d+$]{5}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">State</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server">
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
                <td class="auto-style1">Gender</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbGender_SelectedIndexChanged">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Gender is a required field." ControlToValidate="rbGender" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email Address</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="22px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Address is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format!" ForeColor="Red" ValidationExpression="^\S+@\S+$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Username</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Username is a required field." ControlToValidate="txtUsername" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Password is a required field." ForeColor="Red" Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Minimum 7 characters at least 1 Alphabet and 1 Number for password" ControlToValidate="txtPassword" Text="*" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Retype Password</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtRetype" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Retype password is a required field." ControlToValidate="txtRetype" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetype" ErrorMessage="Password does not match!" ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="lblCustomerID" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="txtSubmit" runat="server" Text="Submit" OnClick="txtSubmit_Click" style="width: 61px" />    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
                    <asp:Button ID="txtCancel" runat="server" Text="Cancel" OnClick="txtCancel_Click" CausesValidation="False" />
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encounterd" ShowMessageBox="True" />
                </td>
            </tr>
        </table>
    <br />
      

      
    </div>
    
    </form>
</body>
</html>
