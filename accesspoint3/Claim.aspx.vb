Imports Infragistics.Web.UI.LayoutControls

Public Class Claim
    Inherits System.Web.UI.Page
    Dim x



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ''        LoadDropDowns()
        If IsPostBack() Then
            'if session("currentsearch")="Member"
            ''    LoadMemberGrid()
            'else
            'load diagnosis search
            'load provider search
        End If
        If Not IsPostBack Then
            panel2.Visible = False
        End If
    End Sub

    'session("currentsearch")="Member"


    Private Sub LoadMemberGrid()
        Dim objMember As New clsMember
        Dim objSession = CType(Session("userSession"), clsSession)
        If windowMemberSearch.Visible = True Then

            Try
                With objMember
                    .USER_GUID = objSession.USER_GUID
                    .LastName = txtMembLastName.Text
                    .FirstName = txtMembFirstName.Text
                    .MEMBER_ID = txtMembId.Text
                    .YOB = txtMembDOB.Text
                End With
                Dim adapter = objMember.GetMemberResults()
                With adapter
                    Dim dt As New DataTable
                    .Fill(dt)
                    Me.gridMemb.DataSource = dt
                    gridMemb.Visible = True
                End With

            Catch ex As Exception
                Throw ex
                ''clsError.CatchError(ex)
            End Try
        End If

    End Sub

    Protected Sub LoadDropDowns()
        Dim objSession = CType(Session("userSession"), clsSession)
        Combo_FillFromStoredProcedure(cmbProvider, "SP_USER_PROVIDERS", objSession.USER_GUID)
        Combo_FillFromStoredProcedure(cmbPOS, "sp_Auth_Place_Of_Service", objSession.USER_GUID)
        Combo_FillFromStoredProcedure(cmbOutcomeCode, "sp_Claim_Outcome_Codes", objSession.USER_GUID)
        ''Dim clsClaim As New clsClaimRequest
        ''clsClaim.MemberAuths_Get(cmbOutcomeCode, "SP_MEMBER_AUTH_HISTORY", objSession.USER_GUID)
    End Sub


    Protected Sub gridMemb_Test(sender As Object, e As EventArgs)

    End Sub






    Protected Sub btnMembSelect_ServerClick(sender As Object, e As EventArgs)
        ''    Dim membId = gridMemb.DataKeyFields.k

        '' windowMemberSearch.Visible = False
        ''     Dim test = membId
    End Sub

    Protected Sub gridMemb_InitializeRow(sender As Object, e As Infragistics.Web.UI.GridControls.RowEventArgs)
    End Sub

    Protected Sub gridMemb_ItemCommand(sender As Object, e As Infragistics.Web.UI.GridControls.HandleCommandEventArgs)

        Dim CommandArgument As Object = e.CommandArgument
        windowMemberSearch.Visible = False
        panelMemberPre.Visible = False
        panelMemberPost.Visible = True
        lblMembId.Text = CommandArgument.ToString()

    End Sub









    ''Claim Buttons
    Protected Sub btnMembSearchCancel_ServerClick(sender As Object, e As EventArgs)
        windowMemberSearch.WindowState = DialogWindowState.Hidden
        gridMemb.ClearDataSource()
        panel2.Visible = False
    End Sub

    Protected Sub btnMembSearchGrid_ServerClick(sender As Object, e As EventArgs)
        panel2.Visible = True
        windowMemberSearch.Width = Unit.Pixel(950)
        LoadMemberGrid()
    End Sub

    Protected Sub btnMembSearchDialog_ServerClick(sender As Object, e As EventArgs)
        windowMemberSearch.Width = Unit.Pixel(400)
        windowMemberSearch.WindowState = DialogWindowState.Normal
    End Sub

    Protected Sub btnCheckClaim_ServerClick(sender As Object, e As EventArgs)

        progressBarClaim.Attributes.Add("Style", "width:33%")
        txtProgressClaim.Visible = True
    End Sub

    ''Diagnosis Buttons
    Protected Sub btnDiagSearchGrid_ServerClick(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnDiagSearchCancel_ServerClick(sender As Object, e As EventArgs)
        windowDiagCodeSearch.WindowState = DialogWindowState.Hidden
    End Sub

    Protected Sub btnDiagSearchDialog_ServerClick(sender As Object, e As EventArgs)
        windowDiagCodeSearch.Width = Unit.Pixel(400)
        windowDiagCodeSearch.WindowState = DialogWindowState.Normal
        tabDiagnosisCodeSearch.SelectedIndex = 0
    End Sub

    Protected Sub btnDiagCodeAdd_ServerClick(sender As Object, e As EventArgs)
        Dim DiagCode = txtDiagCode.Text
        gridDiag.Visible = True
    End Sub

    Protected Sub btnCheckDiag_ServerClick(sender As Object, e As EventArgs)
        progressBarDiagCode.Attributes.Add("style", "width:33%")
        txtProgressDiagCode.Visible = True
    End Sub

    ''Procedure Buttons
    Protected Sub btnSearchProcDialog_ServerClick(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnCheckProc_ServerClick(sender As Object, e As EventArgs)
        progressBarProcedures.Attributes.Add("style", "width:34%;")
        txtProgressProc.Visible = True
    End Sub

    Protected Sub btnSearchICD9_ServerClick(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnMembSearchRefresh_ServerClick(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnDiagSearchRefresh_ServerClick(sender As Object, e As EventArgs)

    End Sub
End Class