<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="EligSearch.aspx.vb" Inherits="AccessPoint3.EligSearch" %>

<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.ListControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.EditorControls" TagPrefix="ig" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server" >
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

                     

 <div class="pageContainer">
       <div  style="position: relative;">        
             <ig:WebTab ID="WebTab1" runat="server"  Width="650px" EnableValidation="False" SelectedIndex="0">
            
            <tabs>
            <ig:ContentTabItem runat="server" Text="Search">
                    
                <Template>
                <asp:Panel ID="panel" runat="server" DefaultButton="btnSearch">
                       <div class="siteFont" style="position: absolute; padding-left: 25px; margin-top: 10px;">
                            Member ID:
                            <ig:WebTextEditor ID="txtMembId" Width="100px" runat="server"></ig:WebTextEditor>
                       </div>
                       <div class="siteFont" style="position: absolute; margin-left: 240px; margin-top: 10px;" >
                            First Name:
                            <ig:WebTextEditor ID="txtFirstName" Width="100px" runat="server"></ig:WebTextEditor>
                        </div>
                        <div class="siteFont" style="position: absolute; margin-left: 455px; margin-top: 10px;">
                            Last Name:
                            <ig:WebTextEditor ID="txtLastName" Width="100px" runat="server"></ig:WebTextEditor>
                        </div> 
                       
                       
                        <div class="siteFont" style="position: absolute; margin-left: 44px; margin-top: 50px;">
                           Gender:
                       </div>
                       <div class="siteFont" style="position: absolute; margin-top: 45px; margin-left: 88px">
                              <ig:WebDropDown ID="cmbGender" runat="server" Width="105px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                       </div>
                       <div class="siteFont" runat="server" style="position: absolute; margin-top: 85px; margin-left: 17px;">
                           Date of Birth: 
                           <asp:textbox id="datepicker1" runat="server" type="text" style="width: 100px; height: 20px; border:solid 1px #CCCCCC; "/>
                        </div> 
                      
                        <div class="siteFont" style="position: absolute; margin-top: 50px; margin-left: 237px ">
                            Health Plan:
                           </div>
                        <div style="position: absolute; margin-top: 45px; margin-left: 304px">
                           <ig:WebDropDown ID="cmbHealthPlan" input="text" runat="server" Width="315px" EnableDropDownAsChild="False"></ig:WebDropDown> 
                        </div>
                        <a>
                        <div style="position:absolute; margin-left: 595px; margin-top: 85px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnHelp" runat="server" title="Help" Height="30px" ImageUrl="~/question.png" />
                        </div>
                        </a>
                        <a>
                        <div style="position: absolute; margin-left:555px; margin-top: 85px; margin-bottom: 0px;">
                            <asp:ImageButton ID="btnRefresh" runat="server" title="Refresh" Height="30px" ImageUrl="~/refresh.png" />
                        </div>
                        </a>
                        <a>
                        <div style="position: absolute; margin-left: 515px; margin-top: 85px; margin-bottom: 0px">
                            <asp:ImageButton ID="btnSearch" runat="server" title="Search" Height="30px"  ImageUrl="~/search.png" />
                        </div>  
                        </a>  
                     </asp:Panel>                                                              
                    </Template>
                </ig:ContentTabItem>
            </tabs>
            <CssClasses HeaderHolderCssClass="tabHeader" />
        </ig:WebTab>

    
    <div style="position: relative; padding-top: 10px;">
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



                
                       

    <div style="position: relative; padding-top: 10px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="100%" Width="100%" BorderStyle="None" BorderWidth="0px" Font-Size="Smaller" AutoGenerateColumns="False">
      
                <Columns>
                <ig:TemplateDataField Key="MATCH" Header-Text="Claim #" Width="125px" >
                      <ItemTemplate>
                            <asp:Image id="Image4" Runat="server" ImageUrl='<%# "IMAGES\" & DataBinder.Eval(Container.DataItem, "MATCH") & ".gif" %>' ></asp:Image>                      
                      </ItemTemplate>
                      <Header Text="Match"></Header>
                   </ig:TemplateDataField>
                   <ig:TemplateDataField Key="MEMBID" Header-Text="Member ID" Width="200px" >
                      <ItemTemplate>
                            <asp:HyperLink ID="MEMBID" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.MEMBID")  %>' NavigateUrl='<% #Eval("MEMBID", "member_hedis.aspx?MEMBID={0}") %>' ></asp:HyperLink>
                    
                      </ItemTemplate>
                      <Header Text="Member ID"></Header>
                   </ig:TemplateDataField>
          
                   <ig:TemplateDataField Key="MEMBER_NAME" Header-Text="Member Name" Width="300px">
                      <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton4" runat="server" title="Copy to Auth Search" ImageUrl="IMAGES\copy.png" />

                          <asp:HyperLink ID="MEMBER_NAME" runat="server" Text='<% #DataBinder.Eval(Container, "DataItem.MEMBER_NAME")  %>' NavigateUrl='<% #Eval("MEMBER_NAME", "member_hedis.aspx?MEMBER_NAME={0}") %>' ></asp:HyperLink>
                      </ItemTemplate>

<Header Text="Member Name"></Header>
                   </ig:TemplateDataField>
               
                   
                       <ig:BoundDataField Key="SEX" DataFieldName="SEX" Header-Text="Sex" Width="125px">
<Header Text="Sex"></Header>
                    </ig:BoundDataField>
                       <ig:BoundDataField Key="BIRTH" DataFieldName="BIRTH" Header-Text="Date of Birth" Width="200px">
<Header Text="Birth"></Header>
                    </ig:BoundDataField>
                   <ig:BoundDataField Key="HPNAME" DataFieldName="HPNAME" Header-Text="Health Plan Name" Width="335px">
<Header Text="Health Plan Name"></Header>

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
<div style="position: absolute; padding-top: 10px;">
    <ul>
        <li> <asp:Image id="image1" runat="server" ImageUrl="IMAGES/D.gif" /> Eligible </li>
        <li><asp:Image id="image2" runat="server" ImageUrl="IMAGES/P.gif" /> Possible</li>
        <li><asp:Image id="image" runat="server" ImageUrl="IMAGES/X.gif" /> Ineligible</li>
        <li> <asp:Image id="image3" runat="server" ImageUrl="IMAGES/copy.png" /> Copy to Auth Search</li>
    </ul>
          
        
        
       
           </div>
          </div>            
</ContentTemplate>
</asp:UpdatePanel>
  
  
       
</asp:Content>

