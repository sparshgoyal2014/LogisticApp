<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Trips.aspx.cs" Inherits="LogisticApp.Trips" %>


<asp:Content ID="Trip_content" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lbl" runat="server" Text="Label"></asp:Label>
        
    <hr />
<%--    <asp:GridView ID="gvTrip" runat="server" BackColor="White"
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>--%>

    <asp:GridView ID="gvTrip" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"  EmptyDataText="There are no data records to display.">  
                                        <%--<Columns>  
                                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  
                                            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                            <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />  
                                            <asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" SortExpression="ContactTitle" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />  
                                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />  
                                            <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                            <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                        </Columns>  --%>
                                    </asp:GridView>


</asp:Content>
