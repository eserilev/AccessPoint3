<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="VerticalNavbar.ascx.vb" Inherits="AccessPoint3.VerticalNavbar" %>
<%@ Register Assembly="Infragistics45.Web.v15.2, Version=15.2.20152.1028, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<!DOCTYPE html>
<ig:WebScriptManager runat="server"></ig:WebScriptManager>
<header>
    <link href="Content/AccessPointStyle.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <script src="Scripts/bootstrap.js"> </script>
   
 
</header>

<html xmlns="http://www.w3.org/1999/xhtml">
     

<body>



<div style="z-index:0">
    

    <div id="horizNav" style="width:100%; position:relative;" >
        <ul style="list-style-type:none; margin:0; padding:0; overflow:hidden; background-color:#3E7ACC;">
            <li style="float:right"><a style="display:block; color: white; text-align:center; padding:14px 16px; text-decoration:none"><span class=navFont>Last Action: <asp:Label ID="lblLastAction" runat="server" Text=""></asp:Label></span></a></li>
            <li style="float:right"><a style="display:block; color: white; text-align:center; padding:14px 16px; text-decoration:none"><span class=navFont>Current IPA: <asp:Label ID="lblCurrentIPA" runat="server" Text=""></asp:Label></span></a></li>
            <li style="float:right"><a style="display:block; color: white; text-align:center; padding:14px 16px; text-decoration:none"><span class=navFont>Logged in as: <asp:Label ID="lblUser" runat="server" Text=""></asp:Label></span></a></li>
          


        </ul>
    </div>




 



  <div style="position:absolute">
  <nav class="navbar navbar-default"  role="navigation">
             
  <!--  <div style="position: absolute; width: 600px; padding-left:450px">
        Logged in as: <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label>
    </div>
    <div style="position: absolute; width: 800px; padding-left:600px">
        Last Action: 
    </div>
     <div style="position: absolute; padding-left:770px; "> 
        <i class="fa fa-bell fa-2x"></i>   
    </div>
    <div style="position: absolute; padding-left:800px; "> 
        <i class="fa fa-inbox fa-2x"></i>    
    </div>
       </div>
  <nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
  
  <div class="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/medpoint.jpg" /></a>
  </div>
      <!--   my documents, Forms and documents

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse" style="height:100% !important;">
    <ul class="nav navbar-nav">
        <li><a href="#">Home</a></li>
        <li><a href="Provider.aspx">Providers</a></li>
        <li><a href="#">Auth Request</a></li>
        <li><a href="AuthSearch.aspx">Auth Search</a></li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Auth <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="MyData.aspx">My Hospital Members</a></li>
            </ul>
        </li>
        <li><a href="Claim.aspx">Claim Request</a></li>
        <li><a href="ClaimSearch.aspx">Claim Search</a></li>
        <li><a href="#">Upload Claim File</a></li>
        <li><a href="EligSearch.aspx">Eligibility</a></li>
        <li><a href="#">My Members</a></li>
        <li><a href="#">Reference</a></li>
        <li><a href="#">My Documents</a></li>
        <li><a href="#">Forms & Documents</a></li>
        <li><asp:LinkButton id="myid" runat="server" OnClick="click_logout">Sign Out</asp:LinkButton></li>
          <li class="dropdown">        
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
            </div>
    </div>
</body>
</html>
