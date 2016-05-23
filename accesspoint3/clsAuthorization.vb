Imports System.Data.SqlClient

Public Class clsAuthorization

    Friend USER_GUID As String

    Friend AuthStatus As String
    Friend ReqBegin As String = ""
    Friend ReqEnd As String = ""
    Friend OperatorReq As String = ""
    Friend AuthBegin As String = ""
    Friend AuthEnd As String = ""
    Friend OperatorAuth As String = ""
    Friend ExpBegin As String = ""
    Friend ExpEnd As String = ""
    Friend OperatorExp As String = ""
    Friend RefProvider As String = ""
    Friend ReqProvFirst As String = ""
    Friend ReqProvLast As String = ""
    Friend MemberFirst As String
    Friend MemberLast As String
    Friend MemberID As String
    Friend WEB_DBKEY As String

    'Status Info
    Friend Authno As String
    Friend REQDATE As String = ""
    Friend STATUS As String
    Friend AUTHDATE As String
    Friend CREATEBY As String
    Friend EXPRDATE As String
    Friend AUTHUNITS As String
    Friend PLACESVC As String
    Friend MEMO As String


    Friend AUTHPCP As String
    Friend REQPROV As String = ""
    Friend LOS As String
    Friend COPAY As String
    Friend DIAG As String
    Friend PROCCODE As String
    Friend PHCODE As String
    Friend DESCR As String
    Friend MODIF As String
    Friend QTY As String
    Friend HEALTH_PLAN As String

    Friend MEMB_KEYID As String
    Friend AUTHPCP_KEYID As String
    Friend REQPROV_KEYID As String
    Friend DBKEY As String
    Friend WEBKEY As Long '/* 20090801

    'IPA
    Friend IPA_Name As String
    Friend IPA_Address1 As String
    Friend IPA_Address2 As String
    Friend IPA_Address3 As String
    Friend IPA_Address4 As String
    Friend IPA_Address5 As String

    Friend UDF1 As String
    Friend UDF2 As String
    Friend UDF3 As String
    Friend UDF4 As String
    Friend UDF5 As String

    'Web auth note '/* 02-01-07 */
    Friend WEB_AUTH_NOTE As String

    '20120328
    Friend REQPROV_OFFICE As Integer
    Friend AUTHPCP_OFFICE As Integer

    Friend AUTH_MESSAGE As String  '/* 20141023 */
    Friend ALLOW_EXTEND As String '/* 20141109



    Friend CLAIMNO As String
    'Variables I've added

    Dim clsData As New clsDatabase
    Friend connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)
    Friend ReqProcedure As String = ""
    Friend ExpProcedure As String = ""
    Friend AuthProcedure As String = ""


    Dim test = Authno
    Public Function LoadData() As SqlDataAdapter

        Try
            Dim cmd As New SqlCommand("SP_Auth_Search", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@AUTHNO", Authno)
            cmd.Parameters.AddWithValue("@STATUS", AuthStatus)
            cmd.Parameters.AddWithValue("@REQDATE_BEGIN", ReqBegin)
            cmd.Parameters.AddWithValue("@REQDATE_END", ReqEnd)
            cmd.Parameters.AddWithValue("@REQDATE_OP", ReqProcedure)
            cmd.Parameters.AddWithValue("@AUTDATE_BEGIN", AuthBegin)
            cmd.Parameters.AddWithValue("@AUTDATE_END", AuthEnd)
            cmd.Parameters.AddWithValue("@AUTDATE_OP", AuthProcedure)
            cmd.Parameters.AddWithValue("@EXPDATE_BEGIN", ExpBegin)
            cmd.Parameters.AddWithValue("@EXPDATE_END", ExpEnd)
            cmd.Parameters.AddWithValue("@EXPDATE_OP", ExpProcedure)
            cmd.Parameters.AddWithValue("@REFPROV", RefProvider)
            cmd.Parameters.AddWithValue("@REQPROV_FIRST", ReqProvFirst)
            cmd.Parameters.AddWithValue("@REQPROV_LAST", ReqProvLast)
            cmd.Parameters.AddWithValue("@MEMB_FIRST", MemberFirst)
            cmd.Parameters.AddWithValue("@MEMB_LAST", MemberLast)
            cmd.Parameters.AddWithValue("@MEMB_ID", MemberID)
            cmd.Parameters.AddWithValue("@SORT_COLUMN", 1)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            ''IO.File.AppendAllText("C:\Log.txt", String.Format("{0}{1}", Environment.NewLine, ex.ToString())) ''current user, timestamp

            Throw ex
        End Try
    End Function

    Public Function GetAuthDetails(ByVal rs As SqlDataReader) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_AUTH_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@AUTHNO", Authno)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)
            rs = cmd.ExecuteReader
            If rs.Read() Then
                MemberID = rs("MEMBID").ToString

                AUTHPCP = rs("AUTHPCP").ToString
                REQPROV = rs("REQPROV").ToString
                Authno = rs("AUTHNO").ToString
                REQDATE = rs("REQDATE").ToString
                STATUS = rs("STATUS DESCR").ToString()
                AUTHDATE = rs("AUTHDATE").ToString
                CREATEBY = rs("CREATEBY").ToString
                EXPRDATE = rs("EXPRDATE").ToString
                LOS = rs("LOS").ToString
                AUTHUNITS = rs("AUTHUNITS").ToString
                PLACESVC = rs("PLACESVC DESCR").ToString
                COPAY = rs("COPAY").ToString
                DIAG = rs("DIAG").ToString
                PROCCODE = rs("PROCCODE").ToString
                PHCODE = rs("PHCODE").ToString
                DESCR = rs("DESCR").ToString
                MODIF = rs("MODIF").ToString
                QTY = rs("QTY").ToString
                HEALTH_PLAN = rs("HEALTH PLAN").ToString
                MEMB_KEYID = rs("MEMB_KEYID").ToString
                AUTHPCP_KEYID = rs("AUTHPCP_KEYID").ToString
                REQPROV_KEYID = rs("REQPROV_KEYID").ToString
                DBKEY = rs("DBKEY").ToString
                IPA_NAME = rs("IPA").ToString
                IPA_Address1 = rs("ADDRESS1").ToString
                IPA_Address2 = rs("ADDRESS2").ToString
                IPA_Address3 = rs("ADDRESS3").ToString
                IPA_Address4 = rs("ADDRESS4").ToString
                IPA_Address5 = rs("ADDRESS5").ToString
                UDF1 = rs("UDF1").ToString
                UDF2 = rs("UDF2").ToString
                UDF3 = rs("UDF3").ToString
                UDF4 = rs("UDF4").ToString
                UDF5 = rs("UDF5").ToString

                MEMO = rs("MEMO").ToString
                WEBKEY = rs("WEBKEY").ToString

                Try
                    WEB_AUTH_NOTE = rs("WEB_AUTH_NOTE").ToString
                Catch ex As Exception
                    Exit Try
                End Try

                '20120328
                Try
                    AUTHPCP_OFFICE = rs("AUTHPCP_OFFICE").ToString
                    REQPROV_OFFICE = rs("REQPROV_OFFICE").ToString
                Catch ex As Exception
                    AUTHPCP_OFFICE = 1
                    REQPROV_OFFICE = 1
                End Try
                Try
                    AUTH_MESSAGE = rs("AUTH_MESSAGE").ToString
                Catch ex As Exception
                    AUTH_MESSAGE = ""
                End Try
                Try  '/* 20141109 */
                    ALLOW_EXTEND = rs("ALLOW_EXTEND").ToString
                Catch ex As Exception
                    ALLOW_EXTEND = "NO"
                End Try


                Return True
            End If
        Catch ex As Exception
            Throw ex
        End Try
        Return False
    End Function

    Public Function GetAuthDetails() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_AUTH_DETAIL", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@AUTHNO", Authno)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function GetFileAttachments() As SqlDataAdapter
        Try
            Dim cmd As New SqlCommand("SP_FILE_ATTACHMENTS_GET_2013", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", USER_GUID)
            cmd.Parameters.AddWithValue("@AUTHNO", Authno)
            cmd.Parameters.AddWithValue("@CLAIMNO", CLAIMNO)
            cmd.Parameters.AddWithValue("@WEB_DBKEY", WEB_DBKEY)
            Dim Adapter As New SqlDataAdapter(cmd)
            Return Adapter
        Catch ex As Exception
            Throw ex
        End Try
    End Function

End Class
