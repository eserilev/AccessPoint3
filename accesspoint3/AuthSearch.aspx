 <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="AuthSearch.aspx.vb" Inherits="AccessPoint3.AuthSearch" %>

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

  <div class ="pageContainer">         
    <div  style="position: relative;">         
        <ig:WebTab ID="WebTab1" runat="server"  Width="650px" EnableValidation="False" SelectedIndex="0">
            <tabs>
                
                <ig:ContentTabItem runat="server" Text="Basic Search">
                    <Template>
                    <asp:Panel ID="panel" runat="server" DefaultButton="btnSearch1">
                         <table>
                            <tr class="tabRows">
                                <td class="firstTabInputTitle">Auth #: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtAuthNo1" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Patient First Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtFirstName1" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Last Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtLastName1" Width="100px" runat="server"></ig:WebTextEditor></td>
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
                        
                     <div style="position:relative;">                                               
                           <table>
                            <tr class="tabRows">
                                <td class="firstTabInputTitle">Auth #: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtAuthno2" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Patient First Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtFirstName2" Width="100px" runat="server"></ig:WebTextEditor></td>
                                <td class="tabInputTitle">Last Name: </td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtLastName2" Width="100px" runat="server"></ig:WebTextEditor></td>
                            </tr>
                       
                            <tr class="tabRows">
                                <td class="firstTabInputTitle">ID #:</td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtIdNo2" Width="100px" runat="server"></ig:WebTextEditor></td>
                                
                                <td class="tabInputTitle">Ref Provider:</td>
                                <td class="tabInput" colspan="3"><ig:WebDropDown ID="cmbRefProv" input="text" runat="server" Width="303px" EnableDropDownAsChild="False"></ig:WebDropDown></td> 
                                                             
                            </tr>
                            <tr class="tabRows">
                                <td class="firstTabInputTitle">Status:</td>
                                <td class="tabInput"> <ig:WebDropDown ID="cmbStatus2" runat="server" Width="105px" EnableDropDownAsChild="False"></ig:WebDropDown></td>
                                <td class="tabInputTitle"> Req Prov First Name:</td>
                                <td class="tabInput"><ig:WebTextEditor ID="txtReqProvFirst" Width="100px" runat="server"> </ig:WebTextEditor></td>
                                <td class="tabInputTitle">Last Name:</td>
                                <td class="TabInput"><ig:WebTextEditor ID="txtReqProvLast" Width="100px" runat="server"> </ig:WebTextEditor></td>

                            </tr>
                            <tr  >
                                <td class="firstTabInputTitle">Search By:</td>
                                <td class="tabInput"><ig:WebDropDown ID="cmbSearchBy" runat="server" Width="105px" EnableDropDownAsChild="False"></ig:WebDropDown> </td>
                                <td class="tabInputTitle">From:</td>
                                <td class="tabInput"><asp:textbox id="datepicker1" runat="server"  type="text" style="width: 100px; height:20px; border:solid 1px #CCCCCC; "/></td>
                                <td class="tabInputTitle">To:</td>
                                <td class="tabInput"><asp:textbox id="datepicker2" runat="server" type="text" style="width: 100px; height: 20px; border:solid 1px #CCCCCC; "/></td>
                            </tr>
                               <tr>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td class="tabInput"><asp:ImageButton ID="btnHelp2" runat="server" title="Help" Height="30px" ImageUrl="~/question.png" />
                            <asp:ImageButton ID="btnRefresh2" runat="server" Height="30px" ImageUrl="~/refresh.png" />
                             <asp:ImageButton ID="btnSearch2" runat="server" Height="30px" ImageUrl="~/search.png" /></td>
                               </tr>                                                  
                        </table>                           
                       </div>                                                                                      
                    </asp:Panel>
                    </Template>
                </ig:ContentTabItem>
            </tabs>
            <CssClasses HeaderHolderCssClass="tabHeader" />
        </ig:WebTab>
    </div>

    `
    <div style="position: relative; padding-top: 10px;">
           <ig:WebTextEditor ID="lblNoResults" runat="server" style="position:center; margin-left: 95px" ReadOnly="True" Width="400px" BorderWidth="0px" Text="No results found" Font-Size="18px" ForeColor="red" ></ig:WebTextEditor>
           <ig:WebTextEditor ID="lblFillSearch" runat="server" ReadOnly="True" Width="400px" BorderWidth="0px" Text="Please fill out at least one search option" Font-Size="18px" ForeColor="red" ></ig:WebTextEditor>
           <ig:WebDialogWindow ID="helpWindow" runat="server" Height="300px" Width="400px" Moveable="False">
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

                 

    <div style="position:relative; margin-top: 10px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="700px" Width="100%" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
      
                <Columns>
                   <ig:TemplateDataField Key="AUTHNO" Header-Text="Auth #" Width="185px" >
                      <ItemTemplate>
                            <asp:HyperLink ID="AUTHNO" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.AUTHNO")  %>' NavigateUrl='<%# "auth_details.aspx?aID=" + DataBinder.Eval(Container.DataItem, "AUTHNO") + "&pDBKEY=" + DataBinder.Eval(Container.DataItem, "DBKEY")%>' ></asp:HyperLink>
                      </ItemTemplate>
                      <Header Text="Auth #"></Header>
                   </ig:TemplateDataField>
                   <ig:BoundDataField Key="DESCR" DataFieldName="DESCR" Header-Text="Status" Width="125px">
                    <Header Text="Status"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="MEMBID" DataFieldName="MEMBID" Header-Text="Member ID" Width="140px">
                    <Header Text="Member ID"></Header>
                    </ig:BoundDataField>
                   <ig:TemplateDataField Key="member_name" Header-Text="Member Name" Width="230px">
                      <ItemTemplate>
                      <asp:HyperLink ID="member_name" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.member_name")  %>' NavigateUrl='<%# "member_details.aspx?mID=" & (DataBinder.Eval(Container.DataItem, "MEMB_KEYID"))%>' ></asp:HyperLink>
                      </ItemTemplate>

<Header Text="Member Name"></Header>
                   </ig:TemplateDataField>
                   <ig:BoundDataField Key="member_sex" DataFieldName="member_sex" Header-Text="Sex" Width="75px">
<Header Text="Sex"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="member_birth" DataFieldName="member_birth" Header-Text="DOB" Width="120px">
<Header Text="DOB"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="member_healthplan" DataFieldName="member_healthplan" Header-Text="Health Plan" Width="260px">
<Header Text="Health Plan"></Header>
                    </ig:BoundDataField> 
                   <ig:BoundDataField Key="provider_name" DataFieldName="provider_name" Header-Text="Referring Prov" Width="100%">
<Header Text="Referring Prov"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="IPA" DataFieldName="IPA" Header-Text="IPA" Width="100%">
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

