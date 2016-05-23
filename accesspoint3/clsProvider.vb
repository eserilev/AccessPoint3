Imports System.Data.SqlClient

Public Class clsProvider

    Friend USER_GUID As String = ""
    Friend FIRST_NAME As String = ""
    Friend LAST_NAME As String = ""

    Friend CITY As String = ""
    Friend ZIP As String = ""
    Friend HEALTH_PLAN As String = ""
    Friend HOSPITAL As String = ""
    Friend PREFERRED As String = ""
    Friend PROV_ID As String

    'Variables I've added

    Friend PROVID
    Friend PROVIDER_NAME
    Friend GROUP
    Friend CLS
    Friend GROUP_ID
    Friend Specialty
    Friend CONTRACT_EFFECTIVE
    Friend CONTRACT_TERM
    Friend STREET
    Friend ADDRESS2
    Friend CITY_STATE_ZIP
    Friend PHONE
    Friend FAX
    Friend CONTACT
    Friend EMAIL
    Friend ADDRESS_TYPE
    Friend PROV_KEYID





    Dim clsData As New clsDatabase
    Friend connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)
    Friend ReqProcedure As String = ""
    Friend ExpProcedure As String = ""
    Friend AuthProcedure As String = ""


    Public Function LoadData() As SqlDataAdapter

        Try
            Dim cmd As New SqlCommand("SP_PROV_SEARCH", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@LAST_NAME", LAST_NAME)
            cmd.Parameters.AddWithValue("@FIRST_NAME", FIRST_NAME)
            cmd.Parameters.AddWithValue("@SPECIALTY", SPECIALTY)
            cmd.Parameters.AddWithValue("@CITY", CITY)
            cmd.Parameters.AddWithValue("@ZIP", ZIP)
            cmd.Parameters.AddWithValue("@HEALTH_PLAN", HEALTH_PLAN)
            cmd.Parameters.AddWithValue("@HOSPITAL", HOSPITAL)
            cmd.Parameters.AddWithValue("@SORT_COLUMN", 1)
            cmd.Parameters.AddWithValue("@PREFERRED", PREFERRED)
            Dim Adapter As New SqlDataAdapter(cmd)
            con.Close()
            Return Adapter
        Catch ex As Exception
            clsError.CatchError(ex)
            con.Close()
            Throw ex
        End Try
    End Function

    Public Function GetProviderDetails(ByVal rs As SqlDataReader) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_PROV_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@PROV_ID", PROV_ID)
            rs = cmd.ExecuteReader
            If rs.Read() Then
                PROVID = rs("PROVID").ToString
                PROVIDER_NAME = rs("PROVIDER_NAME").ToString
                GROUP = rs("GROUP").ToString
                CLS = rs("CLASS").ToString
                GROUP_ID = rs("GROUP_ID").ToString
                Specialty = rs("SPECIALTY").ToString
                CONTRACT_EFFECTIVE = rs("CONTRACT_EFFECTIVE").ToString
                CONTRACT_TERM = rs("CONTRACT_TERM").ToString
                STREET = rs("STREET").ToString
                ADDRESS2 = rs("ADDRESS2").ToString
                CITY_STATE_ZIP = rs("CITY_STATE_ZIP").ToString
                PHONE = rs("PHONE").ToString
                FAX = rs("FAX").ToString
                CONTACT = rs("CONTACT").ToString
                EMAIL = rs("EMAIL").ToString
                ADDRESS_TYPE = rs("ADDRESS_TYPE").ToString
                PROV_KEYID = rs("PROV_KEYID").ToString
                con.Close()
                Return True

            End If
        Catch ex As Exception
            con.Close()
            Throw ex
        End Try
        Return False
    End Function

End Class
