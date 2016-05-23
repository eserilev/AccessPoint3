Imports System.Data.SqlClient
Imports System.Windows.Forms

Public Class ClaimSearch
    Inherits System.Web.UI.Page

    Dim claim As String
    Dim idNum As String
    Dim memLast As String
    Dim memFirst As String
    Dim status As String
    Dim reqStartDate As String
    Dim reqEndDate As String
    Dim reqProcedure As String
    Dim authStartDate As String
    Dim authEndDate As String
    Dim authProcedure As String
    Dim expStartDate As String
    Dim expEndDate As String
    Dim expProcedure As String
    Dim refProv As String
    Dim reqProvFirst As String
    Dim reqProvLast As String
    Dim clsData As New clsDatabase
    Dim access As String
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objDefault As New clsUser
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        If Not objDefault.Confirm(objSession.USER_GUID) Then
            Session("LoginMessage") = "Your previous session expired.  Please login again."
            Response.Redirect(ConfigurationManager.AppSettings.Get("TimeoutRedirect"))
            Exit Sub
        End If


        Try
            ''Auth status dropdown
            Dim helpDialog
            WebDialogWindow1.Visible = False
            helpDialog = ConfigurationManager.AppSettings("HelpDialog")
            WebTextEditor11.Visible = False
            WebTextEditor12.Visible = False
            clsDropDown.Combo_FillFromConfig(cmbStatus1, "ClaimStatusValues")
            clsDropDown.Combo_FillFromConfig(cmbStatus2, "ClaimStatusValues")
            ''clsDropDown.Combo_FillFromConfig(WebDropDown4, "SearchByValues")
            clsDropDown.Combo_FillFromStoredProcedure(cmbProvider, "SP_USER_PROVIDERS", objSession.USER_GUID)
            ''    clsDropDown.Combo_FillFromStoredProcedure(WebDropDown2, "SP_PROV_HP_AFFIL")

            If IsPostBack Then
                LoadDataGrid()
                cmbProvider.SelectedValue = HttpUtility.UrlDecode(cmbProvider.SelectedValue)
            End If
                ''provider dropdown        
                ProvDropDown()
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try

    End Sub

    Private Sub ProvDropDown()
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        Try
            Dim reader As SqlDataReader
            Dim cmd As New SqlCommand
            cmd.CommandText = "SP_PROV_HP_AFFIL"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@GUID", objSession.USER_GUID)
            con.Open()
            reader = cmd.ExecuteReader()
            While reader.Read()
                btnHealthPlan.Items.Add(New Infragistics.Web.UI.ListControls.DropDownItem(reader(1), reader(0)))
            End While
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try
    End Sub

    Private Sub LoadDataGrid()
        Dim objAuth As New clsClaim
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        objAuth.USER_GUID = objSession.USER_GUID
        WebDataGrid1.ClearDataSource()
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
        WebDialogWindow1.Visible = False
        Try
            If WebTab1.SelectedIndex = 0 Then
                objAuth.ClaimNo = Me.txtClaimNo1.Value
                objAuth.MemberFirst = Me.txtMemFirst1.Value
                objAuth.MemberLast = Me.txtMemLast1.Value
                objAuth.MemberID = Me.txtIdNo1.Value
                objAuth.ClaimStatus = Me.cmbStatus1.SelectedValue

            ElseIf WebTab1.SelectedIndex = 1 Then
                objAuth.ClaimNo = Me.txtClaimNo2.Value
                objAuth.MemberFirst = Me.txtMemFirst2.Value
                objAuth.MemberLast = Me.txtMemLast2.Value
                objAuth.MemberID = Me.txtIdNo2.Value
                objAuth.RefProvider = Me.cmbProvider.SelectedValue
                objAuth.ClaimStatus = Me.cmbStatus2.SelectedValue



            End If
            If objAuth.ClaimNo = "" And objAuth.MemberFirst = "" And objAuth.MemberLast = "" And objAuth.MemberID = "" Then
                'no input message
                WebTextEditor12.Visible = True
                WebDataGrid1.Visible = False
            Else

                Dim adapter = objAuth.LoadData()
                With adapter
                    Dim dt As New DataTable
                    .Fill(dt)
                    Me.WebDataGrid1.DataSource = dt
                End With
            End If
            If WebDataGrid1.Rows.Count = 0 Then
                ''throw no results message
                WebTextEditor11.Visible = True
                WebDataGrid1.Visible = True
            Else
                WebDataGrid1.Visible = True
            End If
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try

    End Sub

    Protected Sub Refresh(sender As Object, e As ImageClickEventArgs) Handles btnRefresh1.Click, btnRefresh2.Click
        claim = " "
        memFirst = " "
        memLast = " "
        idNum = " "
        status = " "
        refProv = " "
        reqProvFirst = " "
        reqProvLast = " "
        reqStartDate = " "
        reqEndDate = " "
        reqProcedure = " "
        authStartDate = " "
        authEndDate = " "
        authProcedure = " "
        expStartDate = " "
        expEndDate = " "
        expProcedure = " "
        txtClaimNo1.Text = ""
        txtMemFirst1.Text = ""
        txtMemLast1.Text = ""
        txtIdNo1.Text = ""
        txtClaimNo2.Text = ""
        txtClaimNo2.Text = ""
        txtMemFirst2.Text = ""
        txtMemLast2.Text = ""
        datepicker1.Text = " "
        datepicker2.Text = " "
        ''  WebDropDown1.ClearSelection()
        ''WebDropDown3.ClearSelection()
        ''WebDropDown4.ClearSelection()
        ''WebDropDown5.ClearSelection()
        WebDataGrid1.Visible = False
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
        WebDialogWindow1.Visible = False


    End Sub

    Protected Sub Help(sender As Object, e As ImageClickEventArgs) Handles btnHelp1.Click, btnHelp2.Click


        WebDialogWindow1.Visible = True
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
    End Sub

    Protected Sub Search(sender As Object, e As ImageClickEventArgs) Handles btnSearch1.Click, btnSearch2.Click
        WebDialogWindow1.Visible = False
    End Sub


End Class
