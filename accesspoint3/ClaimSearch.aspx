<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ClaimSearch.aspx.vb" Inherits="AccessPoint3.ClaimSearch" %>

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
    
   <script>   
    $(function() {
        $("input[id*=datepicker1]").datepicker()
    });
    $(function () {
        $("input[id*=datepicker2]").datepicker()
    });
    $(function () {
        $("input[id*=datepicker3]").datepicker()
    });
    $(function () {
        $("#ImageButton1").tooltip();
    });
    $(function () {
        $("#ImageButton2").tooltip();
    });
    $(function () {
        $("#ImageButton3").tooltip();
    });
    $(function () {
        $("#ImageButton4").tooltip();
    });
    $(function () {
        $("#ImageButton5").tooltip();
    });
    $(function () {
        $("#ImageButton6").tooltip();
    });
    </script>
   
    
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
     <div id="pageContainer" style="position:center; padding-left:300px; padding-top:100px; padding-bottom:0px; z-index:1;">
         <div  style="position: relative;">         
     
        <ig:WebTab ID="WebTab1" runat="server"  Width="650px" EnableValidation="False" SelectedIndex="0">
            <tabs>
                
                <ig:ContentTabItem runat="server" Text="Basic Search">
                    <Template>
                          <asp:Panel ID="panel" runat="server" DefaultButton="btnSearch1">
                          <table>
                            <tr class="tabRows">
                                <td class="firstTabInputTitle">Claim #: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtClaimNo1" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Member First Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtMemFirst1" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Last Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtMemLast1" Width="100px" runat="server"></ig:WebTextEditor></td>
                            </tr>
                       
                            <tr class="tabRows">
                                <td class="firstTabInputTitle" >ID #:</td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtIdNo1" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Status:</td>
                                <td class="tabInput"><ig:WebDropDown ID="cmbStatus1"  runat="server" Width="105px" EnableDropDownAsChild="False" ></ig:WebDropDown></td> 
                                <td class="tabInput"></td>
                                <td class="tabInput"><asp:ImageButton ID="btnHelp1" title="Help" runat="server" Height="30px" ImageUrl="~/question.png" />
                               <asp:ImageButton ID="btnRefresh1" runat="server" title="Clear Selection" Height="30px" ImageUrl="~/refresh.png" />
                                <asp:ImageButton ID="btnSearch1" title="Search" runat="server" Height="30px" ImageUrl="~/search.png" /></td>                              
                            </tr>

                         
                        </table> 
                    </asp:Panel>
                    </Template>
                </ig:ContentTabItem>
                <ig:ContentTabItem runat="server" Text="Advanced Search">
                    <Template>
                                            <asp:Panel ID="panel1" runat="server" DefaultButton="btnSearch2">

                       <div class="siteFont" style="position: absolute; padding-left: 25px; margin-top: 10px;">
                            Claim #:
                            <ig:WebTextEditor ID="txtClaimNo2" Width="100px" runat="server"></ig:WebTextEditor>
                       </div>
                       <div class="siteFont" style="position: absolute; margin-left: 215px; margin-top: 10px;" >
                            Member First Name:
                            <ig:WebTextEditor ID="txtMemFirst2" Width="100px" runat="server"></ig:WebTextEditor>
                        </div>
                        <div class="siteFont" style="position: absolute; margin-left: 455px; margin-top: 10px;">
                            Last Name:
                            <ig:WebTextEditor ID="txtMemLast2" Width="100px" runat="server"></ig:WebTextEditor>
                        </div> 
                        <div class="siteFont" style="position: absolute; margin-left: 44px; margin-top: 45px;">
                            ID #:
                            <ig:WebTextEditor ID="txtIdNo2" Width="100px" runat="server"></ig:WebTextEditor>
                        </div>
                        <div class="siteFont" style="position:absolute; margin-top: 50px; margin-left: 241px">
                           Provider Name:
                       </div>
                       <div class="siteFont" style="position:absolute; margin-top: 45px; margin-left: 323px;">
                           <ig:WebDropDown ID="cmbProvider" input="text" runat="server" Width="303px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div>
                       <div class="siteFont" style="position: absolute; margin-top: 82px; margin-left:32px">
                           Status:
                       </div>
                       <div class="siteFont" style="position: absolute; margin-top: 80px; margin-left: 71px">
                              <ig:WebDropDown ID="cmbStatus2" runat="server" Width="105px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div>
                       <div class="siteFont" runat="server" style="position: absolute; margin-top: 114px; margin-left: 42px;">
                           DOB: 
                           <asp:textbox id="datepicker3" runat="server" type="text" style="width: 100px; height: 20px; border:solid 1px #CCCCCC; "/>
                        </div> 
                       <div class="siteFont" style="position: absolute; margin-top: 114px; margin-left: 223px;">
                           Service Date From: 
                           <asp:textbox id="datepicker1" runat="server"  type="text" style="width: 100px; height:20px; border:solid 1px #CCCCCC; "/>
                        </div>
                        <div class="siteFont" runat="server" style="position: absolute; margin-top: 114px; margin-left: 505px;">
                           To: 
                           <asp:textbox id="datepicker2" runat="server" type="text" style="width: 100px; height: 20px; border:solid 1px #CCCCCC; "/>
                        </div>
                        <a>
                        <div style="position:absolute; margin-left: 595px; margin-top: 145px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnHelp2" runat="server" title="Help" Height="30px" ImageUrl="~/question.png" />
                        </div>
                        </a>
                        <a>
                        <div style="position: absolute; margin-left:555px; margin-top: 145px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnRefresh2" runat="server" Height="30px" ImageUrl="~/refresh.png" />
                        </div>
                        </a>
                        <a>
                        <div style="position: absolute; margin-left: 515px; margin-top: 145px; margin-bottom: 0px">
                            <asp:ImageButton ID="btnSearch2" runat="server" Height="30px" ImageUrl="~/search.png" />
                        </div>  
                        </a>
                        <div class="siteFont" style="position: absolute; margin-top: 85px; margin-left: 258px ">
                            Health Plan:
                           </div>
                        <div style="position: absolute; margin-top: 80px; margin-left: 323px">
                           <ig:WebDropDown ID="btnHealthPlan" input="text" runat="server" Width="303px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                        </div>
                       
                    </asp:Panel>
                    </Template>
                </ig:ContentTabItem>
            </tabs>
            <CssClasses HeaderHolderCssClass="tabHeader" />
        </ig:WebTab>
        <br />
             </div>
    
    <div style="position: relative; padding-top:10px;">
           <ig:WebTextEditor ID="WebTextEditor11" runat="server" style="position:center; margin-left: 95px" ReadOnly="True" Width="400px" BorderWidth="0px" Text="No results found" Font-Size="18px" ForeColor="red" ></ig:WebTextEditor>
           <ig:WebTextEditor ID="WebTextEditor12" runat="server" ReadOnly="True" Width="400px" BorderWidth="0px" Text="Please fill out at least one search option" Font-Size="18px" ForeColor="red" ></ig:WebTextEditor>
           <ig:WebDialogWindow ID="WebDialogWindow1" runat="server" Height="300px" Width="400px" Moveable="False">
               <ContentPane>
                   <Template>
                        <%=ConfigurationManager.AppSettings("HelpDialog")%>
                   </Template>
                </ContentPane>
               
               <Header>
                   <CloseBox Visible="False">
                   </CloseBox>
               </Header>
           </ig:WebDialogWindow>
    </div>
    <div style="position:relative; padding-top:10px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="700px" Width="100%" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
      
                <Columns>
                <ig:TemplateDataField Key="CLAIMNO" Header-Text="Claim #" Width="250px" >
                      <ItemTemplate>
                            <asp:HyperLink ID="AUTHNO" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.CLAIMNO")  %>' NavigateUrl='<%# "claim_details.aspx?cID=" + DataBinder.Eval(Container.DataItem, "CLAIMNO") + "&pDBKEY=" + DataBinder.Eval(Container.DataItem, "DBKEY") + "&pID" + DataBinder.Eval(Container.DataItem, "PROV_KEYID")%>' ></asp:HyperLink>
                      </ItemTemplate>
                      <Header Text="Claim #"></Header>
                   </ig:TemplateDataField>
          
                   <ig:TemplateDataField Key="member_name" Header-Text="Member Name" Width="250px">
                      <ItemTemplate>
                      <asp:HyperLink ID="member_name" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.member_name")  %>'  NavigateUrl='<%# "member_details.aspx?mID=" + DataBinder.Eval(Container.DataItem, "MEMB_KEYID")%>' ></asp:HyperLink>
                      </ItemTemplate>

<Header Text="Member Name"></Header>
                   </ig:TemplateDataField>
                    <ig:TemplateDataField Key="provider_name" Header-Text="Provider Name" Width="250px">
                      <ItemTemplate>
                      <asp:HyperLink ID="provider_name" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.provider_name")  %>' NavigateUrl='<%# "provider_details.aspx?pID=" & (DataBinder.Eval(Container.DataItem, "PROV_KEYID"))%>' ></asp:HyperLink>
                      </ItemTemplate>

<Header Text="Provider Name"></Header>
                   </ig:TemplateDataField>
                   
                       <ig:BoundDataField Key="service_date" DataFieldName="service_date" Header-Text="Date of Service" Width="350px">
<Header Text="Date of Service"></Header>
                    </ig:BoundDataField>
                       <ig:BoundDataField Key="status_descr" DataFieldName="status_descr" Header-Text="Status" Width="160px">
<Header Text="Status"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="IPA" DataFieldName="IPA" Header-Text="IPA" Width="200px">
<Header Text="IPA"></Header>
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
         </div>
    
    </ContentTemplate>
</asp:UpdatePanel>    
</asp:Content>

