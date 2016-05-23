<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="MyData.aspx.vb" Inherits="AccessPoint3.MyData" %>

<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.ListControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.EditorControls" TagPrefix="ig" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script src="Scripts/jquery-1.10.2.js"></script>
   <link href="Content/jquery-ui-1.11.4.smoothness.css" rel="stylesheet" />
   <link href="Content/bootstrap.css" rel="stylesheet" />
   <script src="Scripts/jquery-ui-1.11.4.js"></script>
   <link href="AccessPointStyle.css" rel="stylesheet" />

                 

    <div style="position:absolute; margin-left:200px; margin-right:25px; margin-top: 260px; overflow: hidden; z-index:2">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="700px" Width="100%" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
             <ig:BoundDataField Key="COMPANY ID" DataFieldName="COMPANY ID" Header-Text="COMPANY ID" Width="150px">
                    <Header Text="Company ID"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="Authno" HtmlEncode="False" DataFieldName="Authno" Header-Text="Auth #" Width="250px">
                    <Header Text="Auth #"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="Request Date" DataFieldName="Request Date" Header-Text="Request Date" Width="200px">
                    <Header Text="Request Date"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="Diag #1" DataFieldName="Diag #1" Header-Text="Diag #1" Width="400px">
                    <Header Text="Diag #1"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="Procedure #1" DataFieldName="Procedure #1" Header-Text="Procedure #1" Width="350px">
                    <Header Text="Procedure #1"></Header>
                    </ig:BoundDataField>
                                                
                </Columns>
              
      
                <Behaviors>
                    <ig:Paging PageSize="25">
                    </ig:Paging>
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
        </div>

       
</asp:Content>

