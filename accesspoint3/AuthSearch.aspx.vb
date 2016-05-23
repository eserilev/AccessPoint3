Imports System.Data.SqlClient
Imports System.Windows.Forms

Public Class AuthSearch
    Inherits System.Web.UI.Page

    Dim auth As String
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

    'AMG use DB class
    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'AMG for ALL pages, add AJAX controls, etc... so entire page doesn't refresh.

        Dim objDefault As New clsUser
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        'AMG Dim MySession As New clsSession
        'AMG MySession = CType(Session("MySession"), clsSession)
        'AMG access = MySession.USER_GUID
        'AMG use Session object to pull GUID value

        If Not objDefault.Confirm(objSession.USER_GUID) Then
            ''user is not logged in
            Session("LoginMessage") = "Your previous session expired.  Please login again."
            Response.Redirect(ConfigurationManager.AppSettings.Get("TimeoutRedirect"))
            Exit Sub
        End If

        Try
            ''Auth status dropdown
            Dim helpDialog
            helpWindow.Visible = False
            helpDialog = ConfigurationManager.AppSettings("HelpDialog")

            'AMG for ALL pages.  Name the controls so we know what they are.

            lblNoResults.Visible = False
            lblFillSearch.Visible = False
            clsDropDown.Combo_FillFromConfig(cmbStatus1, "AuthStatusValues")
            clsDropDown.Combo_FillFromConfig(cmbStatus2, "AuthStatusValues")
            clsDropDown.Combo_FillFromConfig(cmbSearchBy, "SearchByValues")
            clsDropDown.Combo_FillFromStoredProcedure(cmbRefProv, "SP_USER_PROVIDERS", objSession.USER_GUID)
            If IsPostBack Then
                LoadDataGrid()
            End If
            ''provider dropdown        
        Catch ex As Exception
            Throw ex
            ''clsError.CatchError(ex)
        End Try

    End Sub


    Private Sub LoadDataGrid()

        Dim objAuth As New clsAuthorization
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        objAuth.USER_GUID = objSession.USER_GUID
        WebDataGrid1.ClearDataSource()
        lblNoResults.Visible = False
        lblFillSearch.Visible = False
        helpWindow.Visible = False
        Try
            If WebTab1.SelectedIndex = 0 Then
                objAuth.Authno = Me.txtAuthNo1.Value
                objAuth.MemberFirst = Me.txtFirstName1.Value
                objAuth.MemberLast = Me.txtLastName1.Value
                objAuth.MemberID = Me.txtIdNo1.Value
                objAuth.AuthStatus = Me.cmbStatus1.SelectedValue

            ElseIf WebTab1.SelectedIndex = 1 Then
                objAuth.Authno = Me.txtAuthNo2.Value
                objAuth.MemberFirst = Me.txtFirstName2.Value
                objAuth.MemberLast = Me.txtLastName2.Value
                objAuth.MemberID = Me.txtIdNo2.Value
                objAuth.RefProvider = Me.cmbRefProv.SelectedValue
                objAuth.AuthStatus = Me.cmbStatus2.SelectedValue
                objAuth.ReqProvFirst = Me.txtReqProvFirst.Value
                objAuth.ReqProvLast = Me.txtReqProvLast.Value
                If cmbSearchBy.SelectedValue.CompareTo("1") = 0 Then
                    objAuth.ReqBegin = datepicker1.Text.ToString
                    objAuth.ReqEnd = datepicker2.Text.ToString
                    objAuth.ReqProcedure = "B"
                ElseIf cmbSearchBy.SelectedValue.CompareTo("2") = 0 Then
                    objAuth.AuthBegin = datepicker1.Text.ToString
                    objAuth.AuthEnd = datepicker2.Text.ToString
                    objAuth.AuthProcedure = "B"
                ElseIf cmbSearchBy.SelectedValue.CompareTo("3") = 0 Then
                    objAuth.ExpBegin = datepicker1.Text.ToString
                    objAuth.ExpEnd = datepicker2.Text.ToString
                    objAuth.ExpProcedure = "B"
                ElseIf cmbSearchBy.SelectedValue.CompareTo("0") = 0 Then
                    objAuth.ReqBegin = datepicker1.Text.ToString
                    objAuth.ReqEnd = datepicker2.Text.ToString
                    objAuth.ReqProcedure = "B"
                    objAuth.AuthBegin = datepicker1.Text.ToString
                    objAuth.AuthEnd = datepicker2.Text.ToString
                    objAuth.AuthProcedure = "B"
                    objAuth.ExpBegin = datepicker1.Text.ToString
                    objAuth.ExpEnd = datepicker2.Text.ToString
                    objAuth.ExpProcedure = "B"
                End If
            End If
            If objAuth.Authno = "" And objAuth.MemberFirst = "" And objAuth.MemberLast = "" And objAuth.MemberID = "" And objAuth.ReqProvFirst = "" And objAuth.ReqProvLast = "" Then
                'no input message
                lblFillSearch.Visible = True
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
                lblNoResults.Visible = True
                WebDataGrid1.Visible = True
            Else
                WebDataGrid1.Visible = True
            End If
        Catch ex As Exception
            ''clsError.CatchError(ex)

            Throw ex
        End Try

    End Sub

    Protected Sub Refresh(sender As Object, e As ImageClickEventArgs) Handles btnRefresh1.Click, btnRefresh2.Click
        Try
            auth = " "
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
            txtAuthNo1.Text = ""
            txtFirstName1.Text = ""
            txtLastName1.Text = ""
            txtIdNo1.Text = ""
            txtAuthNo2.Text = ""
            txtFirstName2.Text = ""
            txtLastName2.Text = ""
            txtIdNo2.Text = ""
            txtReqProvFirst.Text = ""
            txtReqProvLast.Text = ""
            datepicker1.Text = " "
            datepicker2.Text = " "
            ''  WebDropDown1.ClearSelection()
            ''WebDropDown3.ClearSelection()
            ''WebDropDown4.ClearSelection()
            ''WebDropDown5.ClearSelection()
            WebDataGrid1.Visible = False
            lblNoResults.Visible = False
            lblFillSearch.Visible = False
            helpWindow.Visible = False

        Catch ex As Exception
            '' clsError.CatchError(ex)

            Throw ex
        End Try
    End Sub

    Protected Sub Help(sender As Object, e As ImageClickEventArgs) Handles btnHelp1.Click, btnHelp2.Click
        Try

            helpWindow.Visible = True
            lblNoResults.Visible = False
            lblFillSearch.Visible = False
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try
    End Sub

    Protected Sub Search(sender As Object, e As ImageClickEventArgs) Handles btnSearch1.Click, btnSearch2.Click

        helpWindow.Visible = False
    End Sub


End Class
