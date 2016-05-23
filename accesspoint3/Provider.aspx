<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Provider.aspx.vb" Inherits="AccessPoint3.Provider" %>

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



           
    <div  class="pageContainer">  
        <div style="position:relative;">
            <ig:WebTab ID="WebTab1" runat="server"  Width="650px" EnableValidation="False" SelectedIndex="0">
            <tabs>                              
                <ig:ContentTabItem runat="server" Text="Provider Search">
                    <Template>
                    <asp:Panel ID="panel" runat="server" DefaultButton="btnSearch">

                       <div class="siteFont" style="position: absolute; padding-left: 30px; margin-top: 10px;">
                            Last Name:
                            <ig:WebTextEditor ID="txtLastName" Width="100px" runat="server"></ig:WebTextEditor>
                       </div>
                       <div class="siteFont" style="position: absolute; margin-left: 220px; margin-top: 10px;" >
                            First Name:
                            <ig:WebTextEditor ID="txtFirstName" Width="100px" runat="server"></ig:WebTextEditor>
                        </div>
                        <div class="siteFont" style="position: absolute; margin-left: 460px; margin-top: 10px;">
                            City:
                            <ig:WebTextEditor ID="txtCity" Width="100px" runat="server"></ig:WebTextEditor>
                        </div> 
                        <div class="siteFont" style="position: absolute; margin-left: 438px; margin-top: 40px;">
                            Zipcode:
                            <ig:WebTextEditor ID="txtZipcode" Width="100px" runat="server"></ig:WebTextEditor>
                        </div>
                        <div class="siteFont" style="position:absolute; margin-top: 45px; margin-left: 35px">
                           Speciality:
                       </div>
                       <div class="siteFont" style="position:absolute; margin-top: 40px; margin-left: 91px;">
                           <ig:WebDropDown ID="cmbSpecialty" input="text" runat="server" Width="291px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div>
                       <div class="siteFont" style="position: absolute; margin-top: 82px; margin-left:20px">
                           Health Plan:
                       </div>
                       <div class="siteFont" style="position: absolute; margin-top: 77px; margin-left: 91px">
                              <ig:WebDropDown ID="cmbHealthPlan" runat="server" Width="291px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div>
                          <div class="siteFont" style="position:absolute; margin-top: 82px; margin-left: 437px">
                           Hospital:
                       </div>
                        <div class="siteFont" style="position:absolute; margin-top: 77px; margin-left: 485px;">
                              <ig:WebDropDown ID="cmbHospital" runat="server" Width="101px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div> 
                      
                        
                        <div style="position:absolute; margin-left: 595px; margin-top: 115px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnHelp" runat="server" title="Help" Height="30px" ImageUrl="~/question.png" />
                        </div>
                        
                        
                        <div style="position: absolute; margin-left:555px; margin-top: 115px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnRefresh" runat="server" Height="30px" ImageUrl="~/refresh.png" />
                        </div>
                        
                        
                        <div style="position: absolute; margin-left: 515px; margin-top: 115px; margin-bottom: 0px">
                            <asp:ImageButton ID="btnSearch" runat="server" Height="30px" ImageUrl="~/search.png" />
                        </div>  
                        
                    </asp:Panel>              
                    </Template>
                </ig:ContentTabItem>
            </tabs>
            <CssClasses HeaderHolderCssClass="tabHeader" />
        </ig:WebTab>
    </div>

    `
   

                 

    <div style="position:relative; padding-top: 30px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="700px" Width="100%" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
        <Columns>
                   <ig:TemplateDataField Key="provider_name" Header-Text="Provider Name" Width="400px" >
                      <ItemTemplate>
                            <asp:HyperLink ID="provider_name" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.provider_name")  %>' NavigateUrl='<%# "provider_details.aspx?pID=" & (DataBinder.Eval(Container.DataItem, "PROV_KEYID"))%>' ></asp:HyperLink>
                      </ItemTemplate>
                      <Header Text="Provider Name"></Header>
                   </ig:TemplateDataField>
                   <ig:BoundDataField Key="speciality" DataFieldName="specialty" Header-Text="Specialty" Width="240px">
                    <Header Text="Specialty"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="group" DataFieldName="group" Header-Text="Group" Width="300px">
                    <Header Text="Group"></Header>
                    </ig:BoundDataField>

                   <ig:BoundDataField Key="phone" DataFieldName="phone" Header-Text="Phone" Width="200px">
<Header Text="Phone"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="city" DataFieldName="city" Header-Text="City" Width="220px">
<Header Text="City"></Header>
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


         <div style="position: relative; padding-top: 60px; z-index:2;">
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
        </div>

     </ContentTemplate>
</asp:UpdatePanel>
 
       
</asp:Content>

