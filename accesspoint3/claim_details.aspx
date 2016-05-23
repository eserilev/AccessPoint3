<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="claim_details.aspx.vb" Inherits="AccessPoint3.claim_details" %>

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
           
           <div style="width:100%">
           <div style="position:absolute">
                
              
               <table class="siteFont" style="margin-left:300px; margin-top:55px; width:420px; ">
                   
                    <tr class="headerDetails">
                       <td>Claim/Encounter Details</td>
                       <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>IPA Name:</td>
                       <td><asp:Label ID="lblIPA" runat="server" Text=""></asp:Label></td>
                    </tr>                  
                    <tr class="rowDetails">
                        <td>Claim #:</td>
                        <td><asp:Label ID="lblClaimNo" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Authorization #:</td>
                       <td><asp:Label ID="lblAuthNo" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Date Received:</td>
                       <td><asp:Label ID="lblDateRec" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Vendor:</td>
                       <td><asp:Label ID="lblVendor" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails"">
                       <td>Status:</td>
                       <td><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
                    </tr>                                                            
                     <tr class="rowDetails">
                       <td>Check:</td>
                       <td><asp:Label ID="lblCheck" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Date Paid:</td>
                       <td><asp:Label ID="lblDatePaid" runat="server" Text=""></asp:Label></td>
                    </tr>                                          
                   <tr style="height:30px;">                                                      
                   </tr>  
                    <tr class="headerDetails">
                       <td>Member Information</td> 
                       <td></td> 
                    </tr>
                    <tr class="rowDetails">
                       <td>Member Name:</td>
                       <td><asp:Label ID="lblMemberName" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>DOB:</td>
                       <td><asp:Label ID="lblDob" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Health Plan:</td>
                       <td><asp:Label ID="lblHealthPlan" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Diagnosis:</td>
                       <td><asp:Label ID="lblDiagnosis" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Sex:</td>
                       <td><asp:Label ID="lblSex" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Age:</td>
                       <td><asp:Label ID="lblAge" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="height:30px;">                                                      
                   </tr>  
                </table>    
               </div>
           <div style="position:absolute; width:1000px">
               <table class="siteFont" style="margin-left:750px; margin-top:55px; width:420px ">           
                    

                    <tr class="headerDetails">
                       <td>Provider Information</td> 
                       <td></td> 
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider Name:</td>
                       <td><asp:Label ID="lblProviderName" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider ID:</td>
                       <td><asp:Label ID="lblProviderId" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Patient Acct. #:</td>
                       <td><asp:Label ID="lblPatientAccntNo" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Place of Service:</td>
                       <td><asp:Label ID="lblPlaceOfService" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Process Status:</td>
                       <td><asp:Label ID="lblProcStatus" runat="server"></asp:Label></td>
                    </tr>
                   
                     <tr class="rowDetails">
                       <td>Specialty:</td>
                       <td><asp:Label ID="lblSpecialty" runat="server"></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Cross Ref ID:</td>
                       <td><asp:Label ID="lblCrossRefId" runat="server"></asp:Label></td>
                    </tr>
                      <tr class="rowDetails">
                       <td>Fax:</td>
                       <td><asp:Label ID="lblFax" runat="server"></asp:Label></td>
                    </tr>
                    </table>
                    </div>
               </div>
           
           <div class="siteFont"  style="position: absolute;  font-size:20px !important;  margin-left: 300px; margin-top: 600px; font:bold;">
                       Services                 
           </div>
            <div style="position:absolute; margin-left:300px; margin-right:25px; margin-top: 630px; overflow: hidden; z-index:2">
            <ig:WebDataGrid ID="gridServices" runat="server" Height="120px" Width="990px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
            <ig:BoundDataField Key="FROMDATESVC" DataFieldName="FROMDATESVC" Header-Text="Date" Width="90px">
                    <Header Text="Date"></Header>
                    </ig:BoundDataField>       
            
                   <ig:BoundDataField Key="PROCCODE" DataFieldName="PROCCODE" Header-Text="Code" Width="90px">
                    <Header Text="Code"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="PROCDESC" DataFieldName="PROCDESC" Header-Text="Description" Width="90px">
                    <Header Text="Description"></Header>
                    </ig:BoundDataField>

                   <ig:BoundDataField Key="MODIF" DataFieldName="MODIF" Header-Text="Modif" Width="90px">
<Header Text="To Date"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="QTY" DataFieldName="QTY" Header-Text="Qty" Width="90px">
<Header Text="Qty"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="CONTRVAL" DataFieldName="CONTRVAL" Header-Text="Contract" Width="90px">
<Header Text="Contract"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="COPAY" DataFieldName="COPAY" Header-Text="Co-pay" Width="90px">
<Header Text="Co-pay"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="BILLED" DataFieldName="BILLED" Header-Text="Billed" Width="90px">
<Header Text="Billed"></Header>
                  </ig:BoundDataField>
                <ig:BoundDataField Key="WITHHOLD" DataFieldName="WITHHOLD" Header-Text="Withold" Width="90px">
<Header Text="Withhold"></Header>
                    </ig:BoundDataField>
             <ig:BoundDataField Key="ADJUST" DataFieldName="ADJUST" Header-Text="Adjust" Width="90px">
<Header Text="Adjust"></Header>
                    </ig:BoundDataField>
             <ig:BoundDataField Key="NET" DataFieldName="NET" Header-Text="Net" Width="90px">
<Header Text="Net"></Header>
                    </ig:BoundDataField>
                  
                                          
                </Columns>
              
      
                <Behaviors>
 
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
                </div>




                      
            <div style="position:absolute; margin-left:730px; margin-right:25px; margin-top: 750px; overflow: hidden; z-index:2">
            <ig:WebDataGrid ID="gridServicesTotal" runat="server" Height="80px" Width="630px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
            <ig:UnboundField Key="blank" Width="90px"> 
                <Header Text="Totals:"></Header>
            </ig:UnboundField>
          
            <ig:BoundDataField Key="CONTRVAL" DataFieldName="CONTRVAL" Header-Text="Contract" Width="90px">
<Header Text=""></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="COPAY" DataFieldName="COPAY" Header-Text="Co-pay" Width="90px">
<Header Text=""></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="BILLED" DataFieldName="BILLED" Header-Text="Billed" Width="90px">
<Header Text=""></Header>
                  </ig:BoundDataField>
                <ig:BoundDataField Key="WITHHOLD" DataFieldName="WITHHOLD" Header-Text="Withold" Width="90px">
<Header Text=""></Header>
                    </ig:BoundDataField>
             <ig:BoundDataField Key="ADJUST" DataFieldName="ADJUST" Header-Text="Adjust" Width="90px">
<Header Text=""></Header>
                    </ig:BoundDataField>
             <ig:BoundDataField Key="NET" DataFieldName="NET" Header-Text="Net" Width="90px">
<Header Text=""></Header>
                    </ig:BoundDataField>
                  
                                          
                </Columns>
              
      
                <Behaviors>
 
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
                </div>

           
     </ContentTemplate>
</asp:UpdatePanel>
 
       
</asp:Content>

