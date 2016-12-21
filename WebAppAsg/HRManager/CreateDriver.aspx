<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateDriver.aspx.cs" Inherits="WebAppAsg.CreateDriver" %>

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
        $(document).ready(function () {
            $('#txtDate').datepicker({
                appendText: 'dd/mm/yyyy',
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2016, 12, 1),
                maxDate: new Date(2030,12,31)
            });
        });
       </script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
        .auto-style2 {
            width: 2px;
        }
        .auto-style4 {
            width: 3px;
        }
        #TextArea1 {
            height: 100px;
            width: 403px;
        }
        .auto-style5 {
            width: 202px;
            height: 23px;
        }
        .auto-style6 {
            width: 3px;
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
        }
        #txtAddress {
            height: 59px;
            width: 223px;
        }
        .auto-style8 {
            width: 202px;
        }
        .auto-style9 {
            width: 202px;
            height: 26px;
        }
        .auto-style10 {
            width: 3px;
            height: 26px;
        }
        .auto-style11 {
            height: 26px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <h1>Create New Driver</h1>
      
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Driver ID</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:Label ID="lblDriver" runat="server"></asp:Label>
                </td>
            </tr>
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
                    <asp:TextBox ID="txtIc1" runat="server" Width="61px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtIc2" runat="server" Height="17px" Width="21px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtIc3" runat="server" Width="43px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="IC Number is a required field." ControlToValidate="txtIc1" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="IC Number is a required field." ControlToValidate="txtIc2" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="IC Number is a required field." ControlToValidate="txtIc3" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIc1" ErrorMessage="Must be excatly 6 number for the first column of Ic Number." ValidationExpression="^[\d+$]{6}" Text="*" ForeColor="Red">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Must be excatly 2 number for the second column of Ic Number." ValidationExpression="^[\d+$]{2}" Text="*" ForeColor="Red" ControlToValidate="txtIc2">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must be excatly 6 number for the first column of Ic Number." ValidationExpression="^[\d+$]{4}" Text="*" ForeColor="Red" ControlToValidate="txtIc3">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Taxi Company</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server" Height="22px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Taxi Company is a required field." ControlToValidate="txtCompany" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Driving License Expiry Date</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Driving License Expiry Date is a required field." ControlToValidate="txtDate" ForeColor="Red" Text="*" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="The date format should be DD/MM/YYYY" ControlToValidate="txtDate" Text="*" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact No</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPhone1" runat="server" Width="39px"></asp:TextBox>
                    -
                    <asp:TextBox ID="txtPhone2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Contact No is a required field." ControlToValidate="txtPhone1" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Contact No is a required field." ControlToValidate="txtPhone2" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Must be exactly 3 characters for contact no column 1" ControlToValidate="txtPhone1" ForeColor="Red" ValidationExpression="^[\d+$]{3}">*</asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Must be excalty 7 characters for contact number column 2" ControlToValidate="txtPhone2" ForeColor="Red" ValidationExpression="^[\d+$]{7}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Driver Address</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="73px" Width="402px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Driver Address is a required field." ControlToValidate="txtAddress" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Driver Gender</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbGender_SelectedIndexChanged">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Gender is a required field." ControlToValidate="rbGender" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Username</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Username is a required field." ControlToValidate="txtUsername" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Password is a required field." ForeColor="Red" Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Minimum 7 characters at least 1 Alphabet and 1 Number for password" ControlToValidate="txtPassword" Text="*" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Retype-Password</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="txtRetype" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Retype password is a required field." ControlToValidate="txtRetype" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetype" ErrorMessage="Password does not match!" ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
        </table>
    <br />
        <h1>Please Enter The Driver's Taxi Information</h1>

        <asp:UpdatePanel runat="server">
                        <ContentTemplate>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style9">Taxi Plate Number</td>
                <td class="auto-style10">:</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtPlate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtPlate" ErrorMessage="Taxi Plate Number is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Vehicle Type</td>
                <td class="auto-style4">:</td>
                <td>
                  
                    <asp:RadioButtonList ID="rbType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbType_SelectedIndexChanged">
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                    </asp:RadioButtonList>
                            
                        
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="rbType" ErrorMessage="Vehicle Type is a required field." ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                            
                        
                </td>
            </tr>
            <tr>

                <td class="auto-style5">Fare</td>
                <td class="auto-style6">:</td>
                
                <td class="auto-style7">
                    <asp:Label ID="lblFare" runat="server"></asp:Label>
                     
                </td>
                
            </tr>
            <tr>
                <td class="auto-style8">Vehicle Manufacturer</td>
                <td class="auto-style4">:</td>
                <td>
                    <asp:TextBox ID="txtManufacturer" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtManufacturer" ForeColor="Red" Text="*" ErrorMessage="Vehicle Manufacturer is a required field."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Vehicle Model</td>
                <td class="auto-style4">:</td>
                <td>
                    <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtModel" ForeColor="Red" Text="*" ErrorMessage="Vehicle Model is a required field."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Vehicle Colour</td>
                <td class="auto-style4">:</td>
                <td>
                    <asp:TextBox ID="txtColour" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtColour" ForeColor="Red" Text="*" ErrorMessage="Vehicle Colour is a required field."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td style="margin-left: 200px">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encounterd" ShowMessageBox="True" />
                </td>
            </tr>
        </table>
                            </ContentTemplate>
                       </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
