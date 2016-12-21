<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDriverTaxi.aspx.cs" Inherits="WebAppAsg.ManageDriverTaxi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
            width: 153px;
        }
        .auto-style3 {
            width: 153px;
        }
        .auto-style4 {
            height: 23px;
            width: 5px;
        }
        .auto-style5 {
            width: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Update Driver's Taxi Information</h1>   
    <asp:Label ID="lblDriverID" runat="server" Visible="False"></asp:Label>
              
          
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebAppAsg.LINQDataContext" EnableUpdate="True" EntityTypeName="" TableName="Taxis" Where="DriverID == @DriverID">
            <WhereParameters>
                <asp:ControlParameter ControlID="lblDriverID" Name="DriverID" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
          
                          
        <br />
        
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="TaxiPlateNo" DataSourceID="LinqDataSource1" ForeColor="Black" Width="386px" OnModeChanged="FormView1_ModeChanged" OnPreRender="FormView1_PreRender">
            <EditItemTemplate>
                <table border="0" style="width:100%;">
                    <tr>
                        <td class="auto-style2">Driver ID</td>
                        <td class="auto-style4">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="DriverIDLabel" runat="server" Text='<%# Bind("DriverID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">TaxiPlate No</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="TaxiPlateNoLabel" runat="server" Text='<%# Eval("TaxiPlateNo") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Vehicle Type</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" SelectedValue='<%# Bind("VehicleType") %>' AutoPostBack="True">
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>Large</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Vehicle Manufacturer</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:TextBox ID="VehicleManufacturerTextBox" runat="server" Text='<%# Bind("VehicleManufacturer") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Vehicle Model</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:TextBox ID="VehicleModelTextBox" runat="server" Text='<%# Bind("VehicleModel") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Vehicle Colour</td>
                        <td class="auto-style4">:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="VehicleColourTextBox" runat="server" Text='<%# Bind("VehicleColour") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Fare(RM)</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:TextBox ID="FareTextBox" runat="server" OnTextChanged="FareTextBox_TextChanged" Text='<%# Bind("Fare", "{0:F2}") %>' ReadOnly="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Availability</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Availability") %>'>
                                <asp:ListItem>Available</asp:ListItem>
                                <asp:ListItem>Not Available</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="SeaShell" ForeColor="Black" />
            <FooterStyle BackColor="Black" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <HeaderTemplate>
                Update Driver&#39;s Taxi Information
            </HeaderTemplate>
            <InsertItemTemplate>
                TaxiPlateNo:
                <asp:TextBox ID="TaxiPlateNoTextBox" runat="server" Text='<%# Bind("TaxiPlateNo") %>' />
                <br />
                VehicleType:
                <asp:TextBox ID="VehicleTypeTextBox" runat="server" Text='<%# Bind("VehicleType") %>' />
                <br />
                Fare:
                <asp:TextBox ID="FareTextBox" runat="server" Text='<%# Bind("Fare") %>' />
                <br />
                Availability:
                <asp:TextBox ID="AvailabilityTextBox" runat="server" Text='<%# Bind("Availability") %>' />
                <br />
                VehicleManufacturer:
                <asp:TextBox ID="VehicleManufacturerTextBox" runat="server" Text='<%# Bind("VehicleManufacturer") %>' />
                <br />
                VehicleModel:
                <asp:TextBox ID="VehicleModelTextBox" runat="server" Text='<%# Bind("VehicleModel") %>' />
                <br />
                VehicleColour:
                <asp:TextBox ID="VehicleColourTextBox" runat="server" Text='<%# Bind("VehicleColour") %>' />
                <br />
                DriverID:
                <asp:TextBox ID="DriverIDTextBox" runat="server" Text='<%# Bind("DriverID") %>' />
                <br />
                Driver:
                <asp:TextBox ID="DriverTextBox" runat="server" Text='<%# Bind("Driver") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table border="0" style="width:100%;">
                    <tr>
                        <td class="auto-style2">Driver ID</td>
                        <td class="auto-style4">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="DriverIDLabel" runat="server" Text='<%# Bind("DriverID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">TaxiPlate No</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="TaxiPlateNoLabel" runat="server" Text='<%# Eval("TaxiPlateNo") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Vehicle Type</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="VehicleTypeLabel" runat="server" Text='<%# Bind("VehicleType") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Vehicle Manufacturer</td>
                        <td class="auto-style4">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="VehicleManufacturerLabel" runat="server" Text='<%# Bind("VehicleManufacturer") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Vehicle Model</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="VehicleModelLabel" runat="server" Text='<%# Bind("VehicleModel") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Vehicle Colour</td>
                        <td class="auto-style4">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="VehicleColourLabel" runat="server" Text='<%# Bind("VehicleColour") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Fare(RM)</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="FareLabel" runat="server" Text='<%# Bind("Fare", "{0:F2}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Availability</td>
                        <td class="auto-style5">:</td>
                        <td>
                            <asp:Label ID="AvailabilityLabel" runat="server" Text='<%# Bind("Availability") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:FormView>
            
        <br />
        <asp:Button ID="btnBack" runat="server" OnClick="btnCreate_Click" Text="Back" />
            
    </div>
    </form>
</body>
</html>
