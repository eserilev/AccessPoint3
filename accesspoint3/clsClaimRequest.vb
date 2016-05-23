Imports System.Data.SqlClient
Public Class clsClaimRequest
    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)


    Public Function MemberAuths_Get(ByVal dropDown As Infragistics.Web.UI.ListControls.WebDropDown, ByVal storedProc As String, ByVal pGUID As String) As Boolean

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
    End Function

End Class
