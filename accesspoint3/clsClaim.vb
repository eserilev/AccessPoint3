Imports System.Data.SqlClient

Public Class clsClaim

    Friend USER_GUID As String = ""
    Friend CLAIM_ID As String = ""
    Friend WEB_DBKEY As String = ""
    Friend ClaimNo As String = ""
    Friend ClaimStatus As String = ""
    Friend ServDateBegin As String = ""
    Friend ServDateEnd As String = ""
    Friend RefProvider As String = ""
    Friend MemberFirst As String = ""
    Friend MemberLast As String = ""
    Friend MemberID As String = ""
    Friend MemberDob As String = ""
    Friend HpCode As String = ""
    Friend PROVID As String = ""
    Friend STATUS_DESCR As String = ""
    Friend AuthNo As String = ""
    Friend DATERECD As String = ""
    Friend DATEPAID As String = ""
    Friend CHECK_X As String
    Friend VENDOR As String
    Friend DIAG As String
    Friend FROMDATESVC As String
    Friend PROCCODE As String
    Friend MODIF As String
    Friend QTY As String
    Friend HEALTH_PLAN As String
    Friend MEMB_KEYID As String
    Friend WITHHOLD As String
    Friend ADJUST As String
    Friend DBKEY As String
    Friend Net As String
    Friend OPT As String
    Friend PLACESVC As String
    Friend PROVCLAIM As String
    Friend CROSSREFID As String
    Friend AdjCode As String
    Friend AdjDescr As String
    Friend IPA_NAME As String
    Friend PROV_KEYID As String
    Friend PROCSTATUS_DESCR As String




    'Variables I've added
    ''Friend connectionString As String = "Data Source=EITAN-PC\SQLEXPRESS;Initial Catalog=GSIWEB_AIPA;User ID=gsiweb;Password=gsiweb2016"
    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)


    Public Function LoadData() As SqlDataAdapter
        Try
            ''LoadData()
            Dim cmd As New SqlCommand("SP_CLAIM_SEARCH", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            Dim param As New SqlParameter
            ''Data Table
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@CLAIMNO", ClaimNo)
            cmd.Parameters.AddWithValue("@STATUS", ClaimStatus)
            cmd.Parameters.AddWithValue("@SERVDATE_BEGIN", ServDateBegin)
            cmd.Parameters.AddWithValue("@SERVDATE_END", ServDateEnd)
            cmd.Parameters.AddWithValue("@REFPROV", RefProvider)
            cmd.Parameters.AddWithValue("@MEMB_FIRST", MemberFirst)
            cmd.Parameters.AddWithValue("@MEMB_LAST", MemberLast)
            cmd.Parameters.AddWithValue("@MEMB_ID", MemberID)
            cmd.Parameters.AddWithValue("@MEMB_DOB", MemberDob)
            cmd.Parameters.AddWithValue("@HPCODE", HpCode)
            cmd.Parameters.AddWithValue("@SORT_COLUMN", 1)

            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            clsError.CatchError(ex)
            Throw ex
        End Try
    End Function

    Public Function GetClaimDetails(ByVal rs As SqlDataReader) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_CLAIM_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@CLAIMNO", CLAIM_ID)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)
            rs = cmd.ExecuteReader
            If rs.Read() Then
                MemberID = rs("MEMBID").ToString
                PROVID = rs("PROVID").ToString
                ClaimNo = rs("CLAIMNO").ToString
                STATUS_DESCR = rs("STATUS DESCR").ToString
                AuthNo = rs("AUTHNO").ToString
                DATERECD = rs("DATERECD").ToString
                DATEPAID = rs("DATEPAID").ToString
                CHECK_X = rs("CHECK_X").ToString
                VENDOR = rs("VENDOR").ToString
                DIAG = rs("DIAG").ToString
                FROMDATESVC = rs("FROMDATESVC").ToString
                PROCCODE = rs("PROCCODE").ToString
                MODIF = rs("MODIF").ToString
                QTY = rs("QTY").ToString
                HEALTH_PLAN = rs("HEALTH PLAN").ToString
                MEMB_KEYID = rs("MEMB_KEYID").ToString
                WITHHOLD = rs("WITHHOLD").ToString
                ADJUST = rs("ADJUST").ToString
                DBKEY = rs("DBKEY").ToString
                Net = rs("NET").ToString
                OPT = rs("OPT").ToString
                PLACESVC = rs("PLACESVC").ToString
                PROVCLAIM = rs("PROVCLAIM").ToString
                CROSSREFID = rs("CROSSREFID").ToString
                AdjCode = rs("AdjCode").ToString
                AdjDescr = rs("AdjDescr").ToString
                IPA_NAME = rs("IPA").ToString
                PROV_KEYID = rs("PROV_KEYID").ToString
                PROCSTATUS_DESCR = rs("PROCSTATUS_DESCR").ToString
                Return True
            End If
        Catch ex As Exception
            Throw ex
        End Try
        Return False
    End Function
    Public Function GetClaimDetails() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_CLAIM_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)

            cmd.Parameters.AddWithValue("@CLAIMNO", CLAIM_ID)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)

            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function GetClaimTotals() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_CLAIM_DETAIL_TOTALS_2011", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@CLAIMNO", CLAIM_ID)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)

            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try

    End Function


End Class
