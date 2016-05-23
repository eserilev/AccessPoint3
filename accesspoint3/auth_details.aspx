<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="auth_details.aspx.vb" Inherits="AccessPoint3.auth_details" %>

<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.ListControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.EditorControls" TagPrefix="ig" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script src="Scripts/jquery-1.10.2.js"></script>
   <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
   <script src="Scripts/jquery-ui-1.11.4.js"></script>
   <link href="Content/AccessPointStyle.css" rel="stylesheet" />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           
           <div style="width:100%">
           <div style="position:absolute">
                
              
               <table class="siteFont" style="margin-left:300px; margin-top:75px; width:420px; ">
                   
                    <tr class="headerDetails">
                       <td>Authorization/Referral Details</td>
                       <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td><asp:Label ID="lblIpa" runat="server" Text=""></asp:Label></td>
                        <td></td>
                    </tr>                  
                    <tr class="rowDetails">                        
                        <td><asp:Label ID="lblIpaAddress1" runat="server" Text=""></asp:Label></td>
                        <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td><asp:Label ID="lblIpaAddress2" runat="server" Text=""></asp:Label></td>
                        <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Phone: <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label> Fax: <asp:Label ID="lblFax" runat="server" Text=""></asp:Label></td>
                       <td></td>
                    </tr>
                   <tr style="height:30px"></tr>
                    <tr class="headerDetails">
                        <td>Status Information</td>
                        <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Authorization #:</td>
                       <td><asp:Label ID="lblAuthNo" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails"">
                       <td>Status:</td>
                       <td><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
                    </tr>                                                            
                     <tr class="rowDetails">
                       <td>Units:</td>
                       <td><asp:Label ID="lblUnits" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Place of Service:</td>
                       <td><asp:Label ID="lblPos" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Memo:</td>
                       <td><asp:Label ID="lblMemo" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Request Date:</td>
                       <td><asp:Label ID="lblReqDate" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Auth/Action Date:</td>
                       <td><asp:Label ID="lblAuthDate" runat="server" Text=""></asp:Label></td>
                    </tr>  
                    <tr class="rowDetails">
                       <td>Expiration Date:</td>
                       <td><asp:Label ID="lblExpDate" runat="server" Text=""></asp:Label></td>
                    </tr>                                      
                   
                   <tr style="height:30px;">                                                   
                   </tr>                   
                   <tr class="headerDetails">
                        <td>Member Information</td>
                        <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Member Name:</td>
                       <td><asp:Label ID="lblMembName" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails"">
                       <td>DOB:</td>
                       <td><asp:Label ID="lblMembDob" runat="server" Text=""></asp:Label></td>
                    </tr>                                                            
                     <tr class="rowDetails">
                       <td>Health Plan:</td>
                       <td><asp:Label ID="lblHealthPlan" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Diagnosis:</td>
                       <td><asp:Label ID="lblDiag" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Sex:</td>
                       <td><asp:Label ID="lblMembSex" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Age:</td>
                       <td><asp:Label ID="lblAge" runat="server" Text=""></asp:Label></td>
                    </tr>                                    
                        
                  
                 
                 
                </table> 
               
                
               </div>


           <div style="position:absolute; width:1000px">
               <table class="siteFont" style="margin-left:750px; margin-top:75px; width:420px ">           
                   <tr class="headerDetails">
                       <td>Referring Physician</td> 
                       <td></td> 
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider Name:</td>
                       <td><asp:Label ID="lblRefProvName" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider ID:</td>
                       <td><asp:Label ID="lblRefProvId" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Phone #:</td>
                       <td><asp:Label ID="lblRefProvPhone" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Specialty:</td>
                       <td><asp:Label ID="lblRefProvSpecialty" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Fax:</td>
                       <td><asp:Label ID="lblRefProvFax" runat="server"></asp:Label></td>
                    </tr> 
                   <tr style="height:30px;">                                                      
                   </tr>
                    <tr class="headerDetails">
                       <td>Requested Physician</td> 
                       <td></td> 
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider Name:</td>
                       <td><asp:Label ID="lblReqProvName" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Provider ID:</td>
                       <td><asp:Label ID="lblReqProvId" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Phone #:</td>
                       <td><asp:Label ID="lblReqProvPhone" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Specialty:</td>
                       <td><asp:Label ID="lblReqProvSpecialty" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Fax:</td>
                       <td><asp:Label ID="lblReqProvFax" runat="server"></asp:Label></td>
                    </tr>

                   <tr style="height:30px;">                                                   
                   </tr>    
                 
                   <tr class="headerDetails">
                       <td>Billing Directions</td>
                       <td></td>
                   </tr>
                   <tr>
                       <td>
                             <ol style="position:relative">
                       <li>All of the following items must be provided
                           <ol type="a">
                               <li>An itemized bill</li>
                               <li>A copy of this referal/authorization</li>
                               <li>A medical summary or report of evalutation</li>
                               <li>If other insurance see #2</li>
                           </ol>
                       </li>
                       <li>For other insurance:
                           <ol type="a">
                               <li>Obtan an assignment of benefits from pt</li>
                               <li>Send initial billing to other insuror, the balance will be paid by Medical Group/IPA according to contracted rates</li>
                               <li>Send copy of EOB statement (which comes with reimbursement from other insuror) with bill</li>
                           </ol>
                       </li>
                       <li>Send Bill to:</li>
                       </td>
                   </tr>
                   
                   
                  
        
                   
                    </table>

                     

                       
                   </ol>
                    </div>

              
            
             

               <div class="container" style="position: absolute; margin-left:1170px; margin-top:105px;">
               <button type="button" class="btn btn-info" style="background-color:#3E7ACC!important; border:none!important" data-toggle="collapse" data-target="#demo">See Attachments <span class="caret"></span></button>
                <div id="demo" class="collapse">
                   <ig:WebDataGrid ID="gridAttachments" runat="server" Height="200px" Width="400px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
                    <Columns>                        
                      <ig:TemplateDataField Key="FILE_DESCR" Header-Text="File Description" Width="400px" >
                      <ItemTemplate>
                          
                          <asp:Button runat="server" id="OpenAttachment" Text='<%#DataBinder.Eval(Container, "DataItem.FILE_DESCR") %>'/>

                     </ItemTemplate>
                      <Header Text="File Description"></Header>
                   </ig:TemplateDataField>
                   
                                          
                </Columns>
              
      
                <Behaviors>
 
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
                </div>
               </div>

        

          <div style="position:absolute; margin-left:300px; margin-top:790px;  ">
               <table class="siteFont" style="width:870px">           
                    <tr class="headerDetails">
                        <td>Web Auth Request Notes</td>
                        <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td><asp:Label ID="lblWebAuthRequest" runat="server" Text=""></asp:Label></td>
                       <td></td>
                   </table>
              </div>
           
           
           <div class="siteFont"  style="position: absolute;  font-size:20px !important;  margin-left: 300px; margin-top: 860px; font:bold;">
                       Services Requested                
           </div>

           <div style="position:absolute; margin-left:300px; margin-top: 890px; overflow: hidden;">
            <ig:WebDataGrid ID="gridService" runat="server" Height="200px" Width="990px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
      
                <Columns>
                <ig:BoundDataField Key="PROCCODE" DataFieldName="PROCCODE" Header-Text="Service" Width="125px">
                    <Header Text="Service"></Header>
                    </ig:BoundDataField>
                    <ig:BoundDataField Key="PHCODE" DataFieldName="PHCODE" Header-Text="Type" Width="125px">
                    <Header Text="Type"></Header>
                    </ig:BoundDataField>
                    <ig:BoundDataField Key="DESCR" DataFieldName="DESCR" Header-Text="Description" Width="300px">
                    <Header Text="Description"></Header>
                    </ig:BoundDataField>
                    <ig:BoundDataField Key="MODIF" DataFieldName="MODIF" Header-Text="Modify" Width="125px">
                    <Header Text="Modify"></Header>
                    </ig:BoundDataField>
                    <ig:BoundDataField Key="QTY" DataFieldName="QTY" Header-Text="Qty" Width="100px">
                    <Header Text="Qty"></Header>
                    </ig:BoundDataField>
                    <ig:BoundDataField Key="FINANCIAL RESP" DataFieldName="FINANCIAL RESP" Header-Text="Status" Width="100px">
                    <Header Text="Status"></Header>
                    </ig:BoundDataField>
                    
													                    
                </Columns>
      
                <Behaviors>
               
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>

          
         
        
  

     </ContentTemplate>
</asp:UpdatePanel>

   
           
 
       
</asp:Content>

