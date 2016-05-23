<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="member_details.aspx.vb" Inherits="AccessPoint3.member_details" %>

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
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           
           <div style="width:100%">
           <div style="position:absolute">
                
              
               <table class="siteFont" style="margin-left:300px; margin-top:75px; width:420px; ">
                   
                    <tr class="headerDetails">
                       <td>Member Information</td>
                       <td></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>IPA Name:</td>
                       <td><asp:Label ID="lblIPA" runat="server" Text=""></asp:Label></td>
                    </tr>                  
                    <tr class="rowDetails">
                        <td>Member Name:</td>
                        <td><asp:Label ID="lblMemName" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Member ID:</td>
                       <td><asp:Label ID="lblMemId" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Health Plan:</td>
                       <td><asp:Label ID="lblHealthPlan" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Practice:</td>
                       <td><asp:Label ID="lblPractice" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails"">
                       <td>Other Cover:</td>
                       <td><asp:Label ID="lblCoverage" runat="server" Text=""></asp:Label></td>
                    </tr>                                                            
                     <tr class="rowDetails">
                       <td>Address:</td>
                       <td><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>City/State/Zip:</td>
                       <td><asp:Label ID="lblCityStateZip" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>DOB:</td>
                       <td><asp:Label ID="lblDOB" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="rowDetails">
                       <td>Relation to Sub:</td>
                       <td><asp:Label ID="lblRelToSubs" runat="server" Text=""></asp:Label></td>
                    </tr>                                    
                   <tr style="height:30px;">                                                      
                   </tr>    
                </table>    
               </div>
           <div style="position:absolute; width:1000px">
               <table class="siteFont" style="margin-left:750px; margin-top:75px; width:420px ">           
                     <tr class="headerDetails">
                       <td>Member Benefit Information</td> 
                       <td></td> 
                    </tr>
                    <tr class="rowDetails">
                       <td>Benefit Plan:</td>
                       <td><asp:Label ID="lblBenefitPlan" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Benefit Effective:</td>
                       <td><asp:Label ID="lblBenefitEffective" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Phys OV Co-Pay</td>
                       <td><asp:Label ID="lblCoPay" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Benefits Termed:</td>
                       <td><asp:Label ID="lblBenefitTermed" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="height:30px;">                                                      
                   </tr>

                    <tr class="headerDetails">
                       <td>Primary Care Provider Information</td> 
                       <td></td> 
                    </tr>
                   <tr class="rowDetails">
                       <td>PCP Name:</td>
                       <td><asp:Label ID="lblPcpName" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Specialty:</td>
                       <td><asp:Label ID="lblSpecialty" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>Phone #:</td>
                       <td><asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label></td>
                    </tr>
                   <tr class="rowDetails">
                       <td>PCP Effective:</td>
                       <td><asp:Label ID="lblPcpEffective" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Provider ID:</td>
                       <td><asp:Label ID="lblProvId" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>Fax:</td>
                       <td><asp:Label ID="lblFax" runat="server"></asp:Label></td>
                    </tr>
                     <tr class="rowDetails">
                       <td>PCP Termination:</td>
                       <td><asp:Label ID="lblPcpTerm" runat="server"></asp:Label></td>
                    </tr>
                    </table>
                    </div>
               </div>
           
           <div  style="position: absolute;  font-size:20px;  margin-left: 300px; margin-top: 490px; font:bold;">
                       Eligibility History                 
           </div>
            <div style="position:absolute; margin-left:300px; margin-right:25px; margin-top: 520px; overflow: hidden; z-index:2">
            <ig:WebDataGrid ID="gridEligHistory" runat="server" Height="100px" Width="940px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
            <ig:BoundDataField Key="HPNAME" DataFieldName="HPNAME" Header-Text="Health Plan" Width="300px">
                    <Header Text="Health Plan"></Header>
                    </ig:BoundDataField>       
            
                   <ig:BoundDataField Key="OPT" DataFieldName="OPT" Header-Text="Plan Option" Width="240px">
                    <Header Text="Plan Option"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="OPFROMDT" DataFieldName="OPFROMDT" Header-Text="From Date" Width="200px">
                    <Header Text="From Date"></Header>
                    </ig:BoundDataField>

                   <ig:BoundDataField Key="OPTHRUDT" DataFieldName="OPTHRUDT" Header-Text="To Date" Width="200px">
<Header Text="To Date"></Header>
                    </ig:BoundDataField>
                                          
                </Columns>
              
      
                <Behaviors>
 
                    <ig:Sorting>
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
                </div>

             <div style="position: absolute; font-size:20px; margin-left: 300px; margin-top: 630px; font:bold">
                       Authorization History                 
           </div>
           <div style="position:absolute; margin-left:300px; margin-right:25px; margin-top: 660px; overflow: hidden; z-index:2">
            <ig:WebDataGrid ID="gridAuthHistory" runat="server" Height="120px" Width="1040px" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
              <ig:TemplateDataField Key="AUTHNO" Header-Text="Auth #" Width="200px" >
                      <ItemTemplate>
                            <asp:HyperLink ID="AUTHNO" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.AUTHNO")  %>' NavigateUrl='<% #Eval("AUTHNO", "member_hedis.aspx?AUTHNO={0}") %>' ></asp:HyperLink>
                      </ItemTemplate>
                      <Header Text="Auth #"></Header>
                   </ig:TemplateDataField>
                   <ig:BoundDataField Key="AUTHDATE" DataFieldName="AUTHDATE" Header-Text="Action Date" Width="100px">
                    <Header Text="Action Date"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="PROVIDER NAME" DataFieldName="PROVIDER NAME" Header-Text="Perf Prov Name" Width="240px">
                    <Header Text="Pref Prov Name"></Header>
                    </ig:BoundDataField>
             <ig:BoundDataField Key="DIAGNOSIS" DataFieldName="DIAGNOSIS" Header-Text="Diagnosis" Width="200px">
                    <Header Text="Diagnosis"></Header>
                    </ig:BoundDataField>
            <ig:BoundDataField Key="PROCEDURE" DataFieldName="PROCEDURE" Header-Text="Procedure" Width="200px">
                    <Header Text="Procedue"></Header>
                    </ig:BoundDataField>

                   <ig:BoundDataField Key="DESCR" DataFieldName="DESCR" Header-Text="Status" Width="100px">
<Header Text="Status"></Header>
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

