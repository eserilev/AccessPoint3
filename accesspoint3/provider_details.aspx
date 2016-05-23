<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="provider_details.aspx.vb" Inherits="AccessPoint3.provider_details" %>

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
   <link href="AccessPointStyle.css" rel="stylesheet" />W
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           <div style="position:center">
                
              
               <table class="siteFont" style="margin-left:300px; margin-top:55px; ">
                   
                    <tr class="headerDetails">
                       <td>Provider Details</td>
                       <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Provider Id:</td>
                       <td><asp:Label ID="lblProviderID" runat="server" Text="Label"></asp:Label></td>
                    </tr>                  
                    <tr class="rowDetails">
                        <td>Class:</td>
                        <td><asp:Label ID="lblClass" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Provider Name:</td>
                       <td><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Group ID:</td>
                       <td><asp:Label ID="lblGroupID" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Practice:</td>
                       <td><asp:Label ID="lblPractice" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails"">
                       <td>Specialty:</td>
                       <td><asp:Label ID="lblSpecialty" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                
                     <tr class="rowDetails">
                       <td>Contract Effective:</td>
                       <td><asp:Label ID="lblContractEff" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Contract Term:</td>
                       <td><asp:Label ID="lblTerm" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr style="height:30px;">

                   </tr>               
                     <tr class="headerDetails">
                       <td>Address</td> 
                       <td></td> 
                    </tr>
                    <tr class="rowDetails">
                       <td>Address Type:</td>
                       <td><asp:Label ID="lblAddressType" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Street:</td>
                       <td><asp:Label ID="lblStreet" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Street 2:</td>
                       <td><asp:Label ID="lblStreet2" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>City:</td>
                       <td><asp:Label ID="lblCity" runat="server"></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Phone:</td>
                       <td><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Fax:</td>
                       <td><asp:Label ID="lblFax" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Contact:</td>
                       <td><asp:Label ID="lblContact" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Email:</td>
                       <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                    </tr>
  
  
     </ContentTemplate>
</asp:UpdatePanel>
 
       
</asp:Content>

