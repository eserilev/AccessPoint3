<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="default.aspx.vb" Inherits="AccessPoint3._default1" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.ListControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.EditorControls" TagPrefix="ig" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <br />
    <script src="Scripts/jquery-1.10.2.js"></script>
   <link href="Content/jquery-ui-1.11.4.smoothness.css" rel="stylesheet" />
   <link href="Content/bootstrap.css" rel="stylesheet" />
   <script src="Scripts/jquery-ui-1.11.4.js"></script>
   <link href="Content/AccessPointStyle.css" rel="stylesheet" />
       
          
    <div  style="position: absolute; margin-left: 38%; margin-top:70px;">         
        <div class="siteFront"style="position:absolute; padding-left: 13px; width: 400px; margin-top:380px">
                     <asp:Label ID="Label1" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>
        
   <ig:WebDialogWindow ID="LoginWindow" runat="server" Height="600px" Width="400px" Modal="True" >
       <ContentPane>
           <Template>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                   <ContentTemplate>
                     <div class="siteFont" style="position: absolute; padding-left:30px; margin-top: 25px; padding-right: 30px ">
                         <asp:CheckBox ID="chkLoginDisclaimer" runat="server" Visible="True" AutoPostBack="True"/>
                            The protected health information contained on this website is HIGHLY CONFIDENTIAL. The contents of the website are confidential and intended for the exclusive use of authorized providers of Hemet Community Medical Group. It is to be used only to aid in providing specific healthcare services. Any other use is a violation of Federal Law (HIPAA) and will be reported as such. If you are not the intended user, you are hereby notified that any dissemination, distribution or copying from this website is strictly prohibited.  
              
                      </div>
                   </ContentTemplate>
                </asp:UpdatePanel>
            <div class="siteFont" style="position: absolute; padding-left: 30px; margin-top: 250px; z-index:1">
                           
                            <ig:WebTextEditor ID="txtUsername" Width="330px" runat="server" placeholder="Your User Name"></ig:WebTextEditor>
                       </div>       
                   <div class="siteFont" style="position: absolute; padding-left: 30px;  margin-top: 290px; ">
                           
                            <ig:WebTextEditor ID="txtPassword" Width="330px" runat="server" TextMode="password" placeholder="Password"></ig:WebTextEditor>
                       </div>    
               <div class="siteFront"style="position:absolute; padding-left: 18px; width: 400px; margin-top:380px">
                     <asp:Label ID="loginMessage" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>
               <div class="siteFront"style="position:absolute; padding-left: 13px; width: 400px; margin-top:380px">
                     <asp:Label ID="checkboxMessage" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>
               

                <div style="position: absolute; margin-left: 85px ;margin-top: 500px; margin-bottom: 0px">
                            <asp:ImageButton ID="btnLogin" runat="server" title="Search" Width="218" Height="50" ImageUrl="~/Images/login.png" />
                        </div> 
           </Template>
       </ContentPane>
       
    </ig:WebDialogWindow>   
  </div>

      <div  style="position: absolute; margin-left: 38%; margin-top:70px;">         
        <div class="siteFront"style="position:absolute; padding-left: 13px; width: 400px; margin-top:380px">
                     <asp:Label ID="Label2" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>

   <ig:WebDialogWindow ID="ChangePassWindow" runat="server" Height="600px" Width="400px" Modal="True" >
       <ContentPane>
           <Template>
             
            <div class="siteFont" style="position: absolute; padding-left: 30px; margin-top: 150px; z-index:1">
                           
                            <ig:WebTextEditor ID="txtOldPass" Width="330px" runat="server" placeholder="Old Password"></ig:WebTextEditor>
                       </div>       
                   <div class="siteFont" style="position: absolute; padding-left: 30px;  margin-top: 290px; ">
                           
                            <ig:WebTextEditor ID="txtNewPass" Width="330px" runat="server" TextMode="password" placeholder="New Password"></ig:WebTextEditor>
                       </div>  
                 <div class="siteFont" style="position: absolute; padding-left: 30px;  margin-top: 340px; ">
                           
                            <ig:WebTextEditor ID="txtCheckNewPass" Width="330px" runat="server" TextMode="password" placeholder="Retype New Password"></ig:WebTextEditor>
                       </div>      
               <div class="siteFront"style="position:absolute; padding-left: 18px; width: 400px; margin-top:380px">
                     <asp:Label ID="Label3" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>
               <div class="siteFront"style="position:absolute; padding-left: 13px; width: 400px; margin-top:380px">
                     <asp:Label ID="Label4" style="position:absolute; color: red!important; font-size: 12px;"  runat="server" Text="Label" Visible ="false"></asp:Label>
               </div>
               

                <div style="position: absolute; margin-left: 85px ;margin-top: 500px; margin-bottom: 0px">
                            <asp:ImageButton ID="btnChangePass" runat="server" title="Search" Width="218" Height="50" ImageUrl="~/Images/login.png" />
                        </div> 
           </Template>
       </ContentPane>
       
    </ig:WebDialogWindow>   
  </div>

    
       
</asp:Content>

