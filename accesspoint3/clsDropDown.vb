Imports System.Data.SqlClient
Imports System.Web.UI.Page

Module clsDropDown

    Private FileTypes() As String

    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)
    Dim access As String

    Public Sub Combo_FillFromConfig(ByVal pCBO As Infragistics.Web.UI.ListControls.WebDropDown, ByVal pSettingName As String)
        Try
            Dim i As Integer
            Dim li As Infragistics.Web.UI.ListControls.DropDownItem

            pCBO.Items.Clear()
            FileTypes = Split(ConfigurationManager.AppSettings.Get(pSettingName), ",")
            For i = 0 To UBound(FileTypes) Step 2
                li = New Infragistics.Web.UI.ListControls.DropDownItem
                li.Text = FileTypes(i)
                li.Value = FileTypes(i + 1)
                pCBO.Items.Add(li)
            Next
            pCBO.SelectedItemIndex = 0
        Catch ex As Exception
            clsError.CatchError(ex)
            Throw ex
        End Try
    End Sub

    Public Sub Combo_FillFromStoredProcedure(ByVal dropDown As Infragistics.Web.UI.ListControls.WebDropDown, ByVal storedProc As String, ByVal pGUID As String)


        Try
            Dim providerCmd As New SqlCommand(storedProc, con) ''SP_USER_PROVIDERS
            providerCmd.CommandType = CommandType.StoredProcedure
            providerCmd.Parameters.AddWithValue("@GUID", pGUID)
            Dim providerAdapter As New SqlDataAdapter(providerCmd)
            With providerAdapter
                Dim dt As New DataTable
                .Fill(dt)
                dropDown.DataSource = dt
                dropDown.ValueField = dt.Columns(1).ToString
                dropDown.TextField = dt.Columns(1).ToString
            End With
        Catch ex As Exception
            clsError.CatchError(ex)
            Throw ex
        End Try
    End Sub



End Module
