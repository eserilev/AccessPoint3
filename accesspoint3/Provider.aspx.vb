Imports System.Data.SqlClient
Imports System.Windows.Forms

Public Class Provider
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

            clsDropDown.Combo_FillFromStoredProcedure(cmbSpecialty, "SP_PROV_SPECIALTY", objSession.USER_GUID)
            clsDropDown.Combo_FillFromStoredProcedure(cmbHospital, "SP_PROV_HOSP", objSession.USER_GUID)
            clsDropDown.Combo_FillFromStoredProcedure(cmbHealthPlan, "SP_PROV_HP_AFFIL", objSession.USER_GUID)

            If IsPostBack Then
                LoadDataGrid()
            End If
            ''provider dropdown        
        Catch ex As Exception
            clsError.CatchError(ex)
        End Try

    End Sub


    Private Sub LoadDataGrid()

        Dim objProv As New clsProvider
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        objProv.USER_GUID = objSession.USER_GUID
        WebDataGrid1.ClearDataSource()
        lblNoResults.Visible = False
        lblFillSearch.Visible = False
        helpWindow.Visible = False
        objProv.FIRST_NAME = txtFirstName.Value
        objProv.LAST_NAME = txtLastName.Value
        objProv.HOSPITAL = cmbHospital.SelectedValue
        objProv.CITY = txtCity.Value
        objProv.ZIP = txtZipcode.Value
        objProv.SPECIALTY = cmbSpecialty.SelectedValue
        objProv.HEALTH_PLAN = cmbHealthPlan.SelectedValue
        Try

            If objProv.FIRST_NAME = "" And objProv.LAST_NAME = "" And objProv.PREFERRED = "" And objProv.SPECIALTY = "" Then
                'no input message
                lblFillSearch.Visible = True
                WebDataGrid1.Visible = False
            Else

                Dim adapter = objProv.LoadData()
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
            clsError.CatchError(ex)

            Throw ex
        End Try

    End Sub

    Protected Sub Refresh(sender As Object, e As ImageClickEventArgs) Handles btnRefresh.Click
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
            txtCity.Text = ""
            txtFirstName.Text = ""
            txtLastName.Text = ""
            txtZipcode.Text = ""

            ''  WebDropDown1.ClearSelection()
            ''WebDropDown3.ClearSelection()
            ''WebDropDown4.ClearSelection()
            ''WebDropDown5.ClearSelection()
            WebDataGrid1.Visible = False
            lblNoResults.Visible = False
            lblFillSearch.Visible = False
            helpWindow.Visible = False

        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try
    End Sub

    Protected Sub Help(sender As Object, e As ImageClickEventArgs) Handles btnHelp.Click
        Try

            helpWindow.Visible = True
            lblNoResults.Visible = False
            lblFillSearch.Visible = False
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try
    End Sub

    Protected Sub Search(sender As Object, e As ImageClickEventArgs) Handles btnSearch.Click

        helpWindow.Visible = False
    End Sub


End Class
