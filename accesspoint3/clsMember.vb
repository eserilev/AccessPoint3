Imports System.Data.SqlClient

Public Class clsMember

    Friend USER_GUID As String

    Friend LastName As String
    Friend FirstName As String
    Friend HealthPlan As String
    Friend YOB As String
    Friend Gender As String

    Friend MEMBER_ID As String
    Friend IPA_Name As String
    Friend MEMBER_NAME As String
    Friend HEALTH_PLAN As String
    Friend ADDRESS As String
    Friend CSZ As String
    Friend RELATION As String
    Friend BENEFIT_PLAN As String
    Friend BENEFIT_EFFECTIVE As String
    Friend COPAY As String
    Friend BENEFIT_TERM As String
    Friend PCP_NAME As String
    Friend PCP_SPECIALTY As String
    Friend PCP_PHONE As String
    Friend PCP_EFFECTIVE As String
    Friend PCP_ID As String
    Friend PCP_FAX As String
    Friend PCP_TERM As String
    Friend SEX As String
    Friend BIRTH As String
    Friend AGE As String
    Friend HP_MEMBER_ID As String
    Friend HP_NAME As String
    Friend MEMB_KEYID As String
    Friend PROV_KEYID As String
    Friend DBKEY As String
    Friend MEMB_OTHNAME As String
    Friend MEMB_OTHCOV As String


    Dim clsData As New clsDatabase
    Friend connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)

    Public Function GetMemberResults(ByRef rs As SqlDataReader) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_MEMBER_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@MEMBER_ID", MEMBER_ID)
            rs = cmd.ExecuteReader
            If rs.Read() Then
                MEMBER_NAME = rs("MEMBER_NAME").ToString
                MEMBER_ID = rs("MEMBID").ToString
                HEALTH_PLAN = rs("HEALTH_PLAN").ToString
                ADDRESS = rs("ADDRESS").ToString
                CSZ = rs("CSZ").ToString
                RELATION = rs("RELATION").ToString
                BENEFIT_PLAN = rs("BENEFIT_PLAN").ToString
                BENEFIT_EFFECTIVE = rs("BENEFIT_EFFECTIVE").ToString
                COPAY = rs("COPAY").ToString
                BENEFIT_TERM = rs("BENEFIT_TERM").ToString
                PCP_NAME = "" ''rs("PCP_NAME").ToString
                PCP_SPECIALTY = rs("PCP_SPECIALTY").ToString
                PCP_PHONE = rs("PCP_PHONE").ToString
                PCP_EFFECTIVE = rs("PCP_EFFECTIVE").ToString
                PCP_ID = rs("PCP_ID").ToString
                PCP_FAX = rs("PCP_FAX").ToString
                PCP_TERM = rs("PCP_TERM").ToString
                SEX = rs("SEX").ToString
                BIRTH = rs("BIRTH").ToString
                AGE = rs("AGE").ToString
                HP_MEMBER_ID = rs("HP MEMBER ID").ToString
                MEMB_KEYID = rs("MEMB_KEYID").ToString
                PROV_KEYID = rs("PROV_KEYID").ToString
                DBKEY = rs("DBKEY").ToString
                IPA_Name = rs("IPA").ToString
                MEMB_OTHCOV = rs("MEMB_OTHCOV").ToString
                MEMB_OTHNAME = rs("MEMB_OTHNAME").ToString
                Return True
            End If
        Catch ex As Exception
            Throw ex
        End Try
        Return False
    End Function

    Public Function GetMemberResults() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_MEMBER_SEARCH", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@LAST_NAME", LastName)
            cmd.Parameters.AddWithValue("@FIRST_NAME", FirstName)
            cmd.Parameters.AddWithValue("@MEMBER_ID", MEMBER_ID)
            cmd.Parameters.AddWithValue("@BIRTH", YOB)
            cmd.Parameters.AddWithValue("@SEX", "")
            cmd.Parameters.AddWithValue("@HEALTH_PLAN", "")
            cmd.Parameters.AddWithValue("@SORT_COLUMN", 1)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function GetEligHistory() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_MEMBER_ELIG_HISTORY_2008", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@MEMBER_ID", MEMBER_ID)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try

    End Function


    Public Function GetAuthHistory() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_MEMBER_AUTH_HISTORY", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@MEMBER_ID", MEMBER_ID)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try

    End Function


End Class
