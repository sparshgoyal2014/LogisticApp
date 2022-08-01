<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TripQuery.aspx.cs" Inherits="LogisticApp.TripQuery" %>

<asp:Content ID="Trip_content" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>

        <asp:Label ID="lbl" runat="server" Text="Transportation done by Own Trucks to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="lbl_sDate" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate"  type="date" runat="server"/>
  

        <asp:Label ID="lbl_eDate" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate" type="date" runat="server"/>

        <asp:Button ID="btn_get" runat="server" Text="Get" OnClick="btn_getOnClick" />


        </br>
        </br>
        </br>


        <asp:Label ID="lbl3" runat="server" Text="Transportation done by Vendor Trucks to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="lbl_sDate3" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate3"  type="date" runat="server"/>
  

        <asp:Label ID="lbl_eDate3" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate3" type="date" runat="server"/>

        <asp:Button ID="btn_get3" runat="server" Text="Get" OnClick="btn_getOnClick3"/>

        
        </br>
        </br>
        </br>




        <asp:Label ID="lbl2" runat="server" Text="Truck wise Transportation done to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="Label1" runat="server" Text="Enter Truck ID"></asp:Label>
        <asp:TextBox ID="input_trkId"  runat="server"></asp:TextBox>

        </br>

        <asp:Label ID="lbl2_sDate" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate2"  type="date" runat="server"/>
  

        <asp:Label ID="lbl2_eDate" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate2" type="date" runat="server"/>

        <asp:Button ID="btn_get2" runat="server" Text="Get" OnClick="btn_getOnClick2" />


        </br>
        </br>
        </br>

        <asp:Label ID="lbl4" runat="server" Text="Vendor wise Transportation done to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="Label4" runat="server" Text="Enter Vendor ID"></asp:Label>
        <asp:TextBox ID="input_vendorId"  runat="server"></asp:TextBox>

        </br>

        <asp:Label ID="lbl4_sDate" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate4"  type="date" runat="server"/>
  

        <asp:Label ID="lbl4_eDate" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate4" type="date" runat="server"/>

        <asp:Button ID="btn_get4" runat="server" Text="Get" OnClick="btn_getOnClick4" />

        </br>
        </br>
        </br>

        <asp:Label ID="lbl5" runat="server" Text="Driver wise Transportation done to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="Label5" runat="server" Text="Enter Driver ID"></asp:Label>
        <asp:TextBox ID="input_driverId"  runat="server"></asp:TextBox>

        </br>

        <asp:Label ID="lbl5_sDate" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate5"  type="date" runat="server"/>
  

        <asp:Label ID="lbl5_eDate" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate5" type="date" runat="server"/>

        <asp:Button ID="btn_get5" runat="server" Text="Get" OnClick="btn_getOnClick5" />

        </br>
        </br>
        </br>

        <asp:Label ID="lbl6" runat="server" Text="Destination wise Transportation done to Various Destination"></asp:Label>
        </br>
        
        <asp:Label ID="Label6" runat="server" Text="Enter State Name"></asp:Label>
        <asp:TextBox ID="input_stateName"  runat="server"></asp:TextBox>

         <asp:Label ID="Label7" runat="server" Text="Enter City Name"></asp:Label>
        <asp:TextBox ID="input_CityName"  runat="server"></asp:TextBox>

        </br>

        <asp:Label ID="lbl6_sDate" runat="server" Text="Enter Start Date"></asp:Label>
        <input id="sDate6"  type="date" runat="server"/>
  

        <asp:Label ID="lbl6_eDate" runat="server" Text="Enter End Date"></asp:Label>
        <input id="eDate6" type="date" runat="server"/>

        <asp:Button ID="btn_get6" runat="server" Text="Get" OnClick="btn_getOnClick6" />

        </br>
        </br>
        </br>





         <asp:GridView ID="gvTripQuery" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"  EmptyDataText="There are no data records to display.">  

        </asp:GridView>

    </div>


</asp:Content>
