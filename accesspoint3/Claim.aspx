<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Claim.aspx.vb" Inherits="AccessPoint3.Claim" %>

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
             <div class="modalContainer">
               <ig:WebDialogWindow ID="windowMemberSearch" runat="server"  WindowState="Hidden" Modal="True" >
                    <ContentPane>
                        <Template>
                            <asp:UpdatePanel ID="panelMembSearch" runat="server">
                                <ContentTemplate>
                                     <link href="Content/AccessPointStyle.css" rel="stylesheet" />
                                    <div class="dialogClaim">
                                        Member Search 
                                    </div>

                                    <div class="spanTopRight">
                                        <button type="button" runat="server" onserverclick="btnMembSearchCancel_ServerClick" id="btnMembSearchCancel" class="btn btn-default btn-group-sm" style="border: none;">
                                            <span class="glyphicon glyphicon-remove-circle"></span>
                                        </button>
                                    </div>
                                    <div style="padding-top:10px; width:340px;">
                                     
                                        
                                        <table>
                                        <tr>
                                            <td class="rowWebTab">Member ID:
                                                <ig:WebTextEditor ID="txtMembId" Width="100px" runat="server"></ig:WebTextEditor>
                                            </td>
                                            <td class="rowWebTab">DOB:
                                                <ig:WebTextEditor ID="txtMembDOB" Width="100px" runat="server"></ig:WebTextEditor>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="rowWebTab">Last Name: 
                                                <ig:WebTextEditor ID="txtMembLastName" Width="100px" runat="server"></ig:WebTextEditor>
                                            </td>
                                            <td class="rowWebTab">First Name:
                                                <ig:WebTextEditor ID="txtMembFirstName" Width="100px" runat="server"></ig:WebTextEditor>
                                            </td>
                                        </tr>
                                    </table>
                                        <div style="float:right;">
                                            <button type="button" runat="server" onserverclick="btnMembSearchRefresh_ServerClick" id="btnMembSearchRefresh" class="btn btn-default btn-group-sm" style="border: none;">
                                                <span class="glyphicon glyphicon-refresh"></span>
                                            </button>
                                            <button type="button" runat="server" onserverclick="btnMembSearchGrid_ServerClick" id="btnMembSearchGrid" class="btn btn-default btn-group-sm" style="border: none;">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                            
                                        </div>
                                    </div>

                         
                       
                        <asp:Panel ID="panel2" style="position: relative; margin-top:30px;" runat="server">           
                        <ig:WebDataGrid ID="gridMemb" runat="server" Height="400px" OnItemCommand="gridMemb_ItemCommand" OnInitializeRow="gridMemb_InitializeRow" Width="925px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
                            <Columns>    
                                                
                            <ig:TemplateDataField Key="membSelect"   Width="100px" >
                                <ItemTemplate><asp:Button ID="btnMembSelect" runat="server" Text="Select"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MEMB_KEYID") %>' CommandName="btnMembSelectClick" /></ItemTemplate>
                            </ig:TemplateDataField>
                            <ig:BoundDataField Key="MEMBID" DataFieldName="MEMBID" Header-Text="Member ID" Width="200px"><Header Text="Member ID"></Header></ig:BoundDataField>
                            <ig:BoundDataField Key="MEMBER_NAME" DataFieldName="MEMBER_NAME" Header-Text="Name" Width="200px"><Header Text="Name"></Header></ig:BoundDataField>
                            <ig:BoundDataField Key="SEX" DataFieldName="SEX" Header-Text="Sex" Width="100px"><Header Text="Sex"></Header></ig:BoundDataField>
                            <ig:BoundDataField Key="BIRTH" DataFieldName="BIRTH" Header-Text="Birth" Width="125px"><Header Text="Birth"></Header></ig:BoundDataField>
                            <ig:BoundDataField Key="HPNAME" DataFieldName="HPNAME" Header-Text="Health Plan" Width="200px"><Header Text="Health Plan"></Header> </ig:BoundDataField>
                            </Columns>
                            <Behaviors><ig:Sorting></ig:Sorting>
                             
                            </Behaviors>
                        </ig:WebDataGrid>
                        </asp:Panel>

                        </ContentTemplate></asp:UpdatePanel>
                        </Template>
                    </ContentPane>
       
            </ig:WebDialogWindow>  

            <ig:WebDialogWindow ID="windowDiagCodeSearch" runat="server" Enabled="true" Modal="True" WindowState="Hidden" >
                    <ContentPane>
                        <Template>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                 <div class="dialogClaim">
                                        Diagnosis Code Search 
                                    </div>

                                    <div class="spanTopRight">
                                        <button type="button" runat="server" onserverclick="btnDiagSearchCancel_ServerClick" id="btnDiagSearchCancel" class="btn btn-default btn-group-sm" style="border: none;">
                                        <span class="glyphicon glyphicon-remove-circle"></span>
                                    </button>
                                        </button>
                                    </div>
                                    <div style="padding-top:10px"></div>
                       <ig:WebTab ID="tabDiagnosisCodeSearch" runat="server" Height="120px" Width="380px" CssClasses-HeaderHolderCssClass="tabHeader" EnableValidation="False" SelectedIndex="0">
                        <tabs>
                        <ig:ContentTabItem runat="server" Text="Search by ICD10"><Template><asp:Panel ID="panel3" runat="server"><!-- DefaultButton="btnSearch">-->
                            <div style="padding-top: 10px; width: 340px;">
                                <table>
                                    <tr>
                                        <td  class="rowWebTab" style="padding-left:10px;">Code:<ig:WebTextEditor ID="txtCode" Width="100px" runat="server"></ig:WebTextEditor>
                                        </td>
                                        <td  class="rowWebTab">Description:<ig:WebTextEditor ID="txtDescription" Width="100px" runat="server"></ig:WebTextEditor>
                                        </td>
                                    </tr>
                                </table>
                                <div style="position:absolute; bottom:0; right:0">
                                     <button type="button" runat="server" onserverclick="btnDiagSearchRefresh_ServerClick" id="btnDiagSearchRefresh1" class="btn btn-default btn-group-sm" style="border: none;">
                                                <span class="glyphicon glyphicon-refresh"></span>
                                            </button>
                                    <button type="button" runat="server" onserverclick="btnDiagSearchGrid_ServerClick" id="btnDiagSearchGrid" class="btn btn-default btn-group-sm" style="border: none;">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                   
                                </div>
                           </div>
                            
                           
                      
                         
                           </asp:Panel></Template>
                        </ig:ContentTabItem>
                            <ig:ContentTabItem runat="server" Text="Search by ICD9">
                                <Template>
                                    <asp:Panel ID="panel4" runat="server">
                                        <div style="padding-top: 10px; padding-left:10px;">
                                            ICD9 Code:<ig:WebTextEditor ID="txtICD9" Width="100px" runat="server"></ig:WebTextEditor>

                                            <div style="position: absolute; bottom: 0; right:0;">
                                                <button type="button" runat="server" onserverclick="btnDiagSearchRefresh_ServerClick" id="btnDiagSearchRefresh2" class="btn btn-default btn-group-sm" style="border: none;">
                                                <span class="glyphicon glyphicon-refresh"></span>
                                            </button>
                                                
                                                <button type="button" runat="server" onserverclick="btnSearchICD9_ServerClick" id="btnSearchICD9" class="btn btn-default btn-group-sm" style="border: none;">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                        </div>
                                        </table>
                                    </asp:Panel>
                                </Template>

                            </ig:ContentTabItem> 
                        
                        
                                                                     </tabs><CssClasses HeaderHolderCssClass="tabHeader" />
                     </ig:WebTab>
                        <div id="diagSearchGrid">
                                <ig:WebDataGrid ID="gridDiagCode" runat="server" Height="200px" Width="400px" BorderStyle="None" Visible="false" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
                                    <Columns>
                                        <ig:BoundDataField Key="CODE" DataFieldName="CODE" Header-Text="Code" Width="125px">
                                            <Header Text="Code"></Header>
                                        </ig:BoundDataField>
                                        <ig:BoundDataField Key="DESCRIPTION" DataFieldName="DESCRIPTION" Header-Text="Description" Width="125px">
                                            <Header Text="Description"></Header>
                                        </ig:BoundDataField>
                                    </Columns>
                                    <Behaviors>
                                        <ig:Sorting>
                                        </ig:Sorting>
                                    </Behaviors>
                                </ig:WebDataGrid>
                            </div>

                        </ContentTemplate></asp:UpdatePanel>
                        </Template>
                    </ContentPane>
       
            </ig:WebDialogWindow> 
                  </div> 
           </ContentTemplate>
           </asp:UpdatePanel>
       

           <asp:UpdatePanel runat="server" ID="updatePanelTest">
               <ContentTemplate>
           <div class="pageContainer">                         
               <div class="progress" style="width:1000px;">
                 
                   <div id="progressBarClaim" runat="server" class="progress-bar" role="progressbar" aria-valuenow="25"
                           aria-valuemin="0" aria-valuemax="100" style="width: 0%; background-color:#3E7ACC">
                        <div runat="server" id="txtProgressClaim" visible="false">
                        <span class="glyphicon glyphicon-ok" style="font-size:10px !important; color:white !important;" aria-hidden="true"></span> Claim Request </div>  
                       </div>
               
                   <div id="progressBarDiagCode" runat="server" class="progress-bar" role="progressbar" aria-valuenow="25"
                           aria-valuemin="0" aria-valuemax="100" style="width: 0%; background-color:#3E7ACC">
                       <div runat="server" id="txtProgressDiagCode" visible="false">   
                       <span class="glyphicon glyphicon-ok" style="font-size:10px !important; color:white !important;" aria-hidden="true"></span> Diagnosis Code</div> 
                       </div>
                     <div id="progressBarProcedures" runat="server" class="progress-bar" role="progressbar" aria-valuenow="25"
                           aria-valuemin="0" aria-valuemax="100" style="width: 0%; background-color:#3E7ACC">
                         <div id="txtProgressProc" runat="server" visible="false">
                        <span class="glyphicon glyphicon-ok" style="font-size:10px !important; color:white !important;" aria-hidden="true"></span> Procedures</div>
                       </div>
                       </div>  
               
               <div class="siteFont" style="position: relative; margin-top:30px; width:1000px;">  
                   
               <div class="headerClaim" style="width:100% !important;">
                   Claim Request
                            <span class="spanTopRight">
                               
                                <button type="button" runat="server" onserverclick="btnCheckClaim_ServerClick" id="btnCheckClaim" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-check"></span>
                                </button>
                            </span>
               </div>                 
               <table id="table1" class="siteFont"  style="width:1000px; ">
                   
                   
                    <tr class="rowClaim">
                       <td>IPA Name:</td>
                        <td><asp:Label ID="lblIpa" runat="server" Text=""></asp:Label></td>
                    </tr>  
                   <tr class="rowClaim">
                       <td>Claim Type:</td>
                       <td><asp:RadioButton runat="server" GroupName="ClaimType" ID="radiobtnClaim"/>Claim  <asp:RadioButton runat="server" ID="radiobtnEncounter" GroupName="ClaimType"/>Encounter</td>
                   </tr>                
                    <tr class="rowClaim">                        
                        <td>Request Date:</td>
                        <td><asp:Label ID="lblRequestDate" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowClaim">
                       <td>Member: </td>
                       <td>
                              <asp:Panel runat="server" ID="panelMemberPre" Visible="true">
                                    Member ID: <ig:WebTextEditor ID="txtTableMembId" AutoPostBackFlags-ValueChanged="On" Width="100px" runat="server"></ig:WebTextEditor>
                                     <button type="button" runat="server" onserverclick="btnMembSearchDialog_ServerClick" id="btnMembSearchDialog" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                                  
                               </asp:Panel>
                               <asp:Panel runat="server" ID="panelMemberPost" Visible="false">
                                   <asp:Label ID="lblMembId" runat="server" Text=""></asp:Label>
                               </asp:Panel>
                        </td>
                    </tr>
                    <tr class="rowClaim">
                       <td>Provider: </td>
                       <td><ig:WebDropDown ID="cmbProvider" runat="server" Width="300px" EnableDropDownAsChild="False"></ig:WebDropDown></td>
                    </tr>            
                    <tr class="rowClaim">
                       <td>Place of Service:</td>
                       <td><ig:WebDropDown ID="cmbPOS" runat="server" Width="300px" EnableDropDownAsChild="False"></ig:WebDropDown></td>
                    </tr>
                     <tr class="rowClaim"">
                       <td>Outcome Code:</td>
                       <td><ig:WebDropDown ID="cmbOutcomeCode" runat="server" Width="300px" EnableDropDownAsChild="False"></ig:WebDropDown></td>
                    </tr>                                                            
                     <tr class="rowClaim">
                       <td>Authorization #:</td>
                       <td><ig:WebDropDown ID="cmbAuthNo" runat="server" Width="300px" EnableDropDownAsChild="False"></ig:WebDropDown></td>
                    </tr>
                     <tr class="rowClaim">
                       <td>Prov. Claim #:</td>
                       <td> <ig:WebTextEditor ID="txtPovClaimNo" Width="100px" runat="server"></ig:WebTextEditor></td>
                    </tr>
                    <tr class="rowClaim">
                       <td>Facility:</td>
                       <td> <ig:WebTextEditor ID="txtFacility" Width="100px" runat="server"></ig:WebTextEditor></td>
                    </tr>                                                                       
                </table>  
               </div>
               
               
                              
               <div class="siteFont" style="position: relative; margin-top: 30px; width: 1000px;">
                   <div class="headerClaim">
                       Diagnosis Code
                            <span class="spanTopRight">
                                <button type="button" runat="server" onserverclick="btnDiagSearchDialog_ServerClick" id="btnDiagSearchDialog" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                                <button type="button" runat="server" onserverclick="btnCheckDiag_ServerClick" id="btnCheckDiag" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-check"></span>
                                </button>
                            </span>
                   </div>
                   <div>
                       Add Diagnosis Code:
                       <ig:WebTextEditor ID="txtDiagCode" Width="100px" runat="server"></ig:WebTextEditor>
                       <button type="button" runat="server" onserverclick="btnDiagCodeAdd_ServerClick" id="btnDiagCodeAdd" class="btn btn-default btn-group-sm" style="border: none;">
                           <span class="glyphicon glyphicon-plus-sign"></span>
                       </button>
                   </div>
                   <div id="diagGrid">
                                <ig:WebDataGrid ID="gridDiag" runat="server" Height="200px" Width="400px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" Visible="false" AutoGenerateColumns="False">
                                    <Columns>
                                        <ig:BoundDataField Key="CODE" DataFieldName="CODE" Header-Text="Code" Width="125px">
                                            <Header Text="Code"></Header>
                                        </ig:BoundDataField>
                                        <ig:BoundDataField Key="DESCRIPTION" DataFieldName="DESCRIPTION" Header-Text="Description" Width="125px">
                                            <Header Text="Description"></Header>
                                        </ig:BoundDataField>
                                        <ig:TemplateDataField Key="REMOVE" Header-Text="" Width="125px">
                                            <ItemTemplate>
                                                <button type="button" runat="server" onserverclick="btnDiagCodeAdd_ServerClick" id="btnDiagCodeAdd" class="btn btn-default btn-group-sm" style="border: none;">
                                                    <span class="glyphicon glyphicon-remove-circle"></span>
                                                </button>
                                            </ItemTemplate>
                                        </ig:TemplateDataField>
                                    </Columns>
                                    <Behaviors>
                                        <ig:Sorting>
                                        </ig:Sorting>
                                    </Behaviors>
                                </ig:WebDataGrid>
                            </div>

               </div>
                       
                                  
               <div class="siteFont" style="position: relative; margin-top: 30px; width: 1000px;">
                   <div class="headerClaim">
                       Procedures
                       <div class="spanTopRight" style="border:none;">
                                <button type="button" runat="server" onserverclick="btnSearchProcDialog_ServerClick" id="btnSearchProcDialog" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                                <button type="button" runat="server" onserverclick="btnCheckProc_ServerClick" id="btnCheckProc" class="btn btn-default btn-group-sm" style="border: none;">
                                    <span class="glyphicon glyphicon-check"></span>
                                </button>
                            </div>
                   </div>

                   <table style="margin-top: 30px; width: 1000px;">
                       <tr id="tableProcedureRow1">
                           <td>Procedure</td>
                           <td>Qty</td>
                           <td>$Billed</td>
                           <td>Diag Ref</td>
                           <td>From Date</td>
                           <td>From Time</td>
                           <td>To Date</td>
                           <td>To Time</td>
                           <td>Mod 1</td>
                           <td>2</td>
                           <td>3</td>
                           <td>4</td>
                       </tr>
                       <tr class="tableProcedureRow2">
                           <td>
                               <ig:WebTextEditor ID="txtProcedure1" Width="100px" runat="server" CssClass="noBorder"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtQty1" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtBilled1" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtDiagRef1" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtFromDate1" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtFromTime1" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtToDate1" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtToTime1" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtMod11" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtMod12" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtMod13" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="txtMod14" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                       </tr>
                       <tr class="tableProcedureRow2">
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor1" Width="100px" runat="server" CssClass="noBorder"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor2" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor3" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor4" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor5" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor6" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor7" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor8" Width="100px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor9" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor10" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor11" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                           <td>
                               <ig:WebTextEditor ID="WebTextEditor12" Width="50px" CssClass="noBorder" runat="server"></ig:WebTextEditor>
                           </td>
                       </tr>
                   </table>
               </div>
               
      
                        <div class="siteFont" style=" position:relative; margin-top:30px; width:1000px; ">                        
                           <div class="headerClaim" style="width:100%">
                               Additional Notes
                           </div>
                          Additional Notes:
                           </div>                             
            
               </div>

               

        

       
           
           
         

          
         


     </ContentTemplate>
</asp:UpdatePanel>

   
           
 
       
</asp:Content>

