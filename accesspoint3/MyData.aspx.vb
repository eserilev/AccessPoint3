Imports System.Data.SqlClient

Public Class MyData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsData As New clsDatabase
        Dim connectionString As String = clsData.GetConString()
        Dim con As New SqlConnection(connectionString)
        Dim objDefault As New clsUser
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        If Not objDefault.Confirm(objSession.USER_GUID) Then
            ''user is not logged in
            Session("LoginMessage") = "Your previous session expired.  Please login again."
            Response.Redirect(ConfigurationManager.AppSettings.Get("TimeoutRedirect"))
            Exit Sub
        End If
        Try
            Dim cmd As New SqlCommand("SP_MYDATA_HOSPITAL_MEMBERS", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", objSession.USER_GUID)
            Dim Adapter As New SqlDataAdapter(cmd)
            With Adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.WebDataGrid1.DataSource = dt
            End With

        Catch ex As Exception
            clsError.CatchError(ex)
        End Try

    End Sub

End Class