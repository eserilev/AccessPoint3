Imports System.Data.SqlClient
Imports System.Windows.Forms

Public Class EligSearch
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
            cmbGender.Items.Clear()

            If IsPostBack Then
                LoadDataGrid()
            End If
            ''provider dropdown        
            ProvDropDown()

            cmbGender.Items.Add(New Infragistics.Web.UI.ListControls.DropDownItem("Male", "M"))
            cmbGender.Items.Add(New Infragistics.Web.UI.ListControls.DropDownItem("Female", "F"))
            cmbGender.DropDownContainerHeight = 70
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try

    End Sub

    Private Sub ProvDropDown()
        Try
            Dim reader As SqlDataReader
            Dim cmd As New SqlCommand
            Dim objSession As New clsSession
            objSession = CType(Session("userSession"), clsSession)
            cmd.CommandText = "SP_PROV_HP_AFFIL"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@GUID", objSession.USER_GUID)
            con.Open()
            reader = cmd.ExecuteReader()
            While reader.Read()
                cmbHealthPlan.Items.Add(New Infragistics.Web.UI.ListControls.DropDownItem(reader(1), reader(0)))
            End While
        Catch ex As Exception
            clsError.CatchError(ex)
            Throw ex
        End Try
    End Sub

    Private Sub LoadDataGrid()
        Dim objAuth As New clsEligibility
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)

        WebDataGrid1.ClearDataSource()
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
        WebDialogWindow1.Visible = False
        Try
            objAuth.MemberID = Me.txtMembId.Value
            objAuth.MemberFirst = Me.txtFirstName.Value
            objAuth.MemberLast = Me.txtLastName.Value
            objAuth.Gender = Me.cmbGender.SelectedValue
            objAuth.DOB = Me.datepicker1.Text.ToString
            objAuth.HealthPlan = Me.cmbHealthPlan.SelectedValue
            objAuth.USER_GUID = objSession.USER_GUID


            If objAuth.MemberFirst = "" And objAuth.MemberLast = "" And objAuth.MemberID = "" Then
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

    Protected Sub Search(sender As Object, e As ImageClickEventArgs) Handles btnSearch.Click
        WebDialogWindow1.Visible = False
        LoadDataGrid()

        cmbGender.ClearSelection()
        cmbHealthPlan.ClearSelection()
    End Sub

    Protected Sub Refresh(sender As Object, e As ImageClickEventArgs) Handles btnRefresh.Click
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
        txtMembId.Text = ""
        txtFirstName.Text = ""
        txtLastName.Text = ""

        datepicker1.Text = " "
        cmbGender.ClearSelection()
        cmbHealthPlan.ClearSelection()
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
        WebDialogWindow1.Visible = False


    End Sub

    Protected Sub Help(sender As Object, e As ImageClickEventArgs) Handles btnHelp.Click


        WebDialogWindow1.Visible = True
        WebTextEditor11.Visible = False
        WebTextEditor12.Visible = False
    End Sub




End Class
