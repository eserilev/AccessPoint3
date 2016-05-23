Imports System.Data.SqlClient

Public Class clsEligibility

    Friend USER_GUID As String


    Friend Gender As String
    Friend MemberFirst As String
    Friend MemberLast As String
    Friend MemberID As String
    Friend WEB_DBKEY As String
    Friend Authno As String
    Friend DOB As String
    Friend HealthPlan As String

    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)

    Friend ReqProcedure As String
    Friend ExpProcedure As String
    Friend AuthProcedure As String


    Dim test = Authno
    Public Function LoadData() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_Member_Search", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            Dim param As New SqlParameter
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@LAST_NAME", MemberLast)
            cmd.Parameters.AddWithValue("@FIRST_NAME", MemberFirst)
            cmd.Parameters.AddWithValue("@MEMBER_ID", MemberID)
            cmd.Parameters.AddWithValue("@HEALTH_PLAN", HealthPlan)
            cmd.Parameters.AddWithValue("@BIRTH", DOB)
            cmd.Parameters.AddWithValue("@SEX", Gender)
            cmd.Parameters.AddWithValue("@SORT_COLUMN", 1)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            clsError.CatchError(ex)

            Throw ex
        End Try
    End Function

End Class
