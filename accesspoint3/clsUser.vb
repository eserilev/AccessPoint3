Imports System.Data.SqlClient

'AMG add functions to load config values into Dictionary object
'AMG add function to load security settins into Dictionary object

Public Class clsUser
    Inherits System.Web.UI.Page

    Friend userName
    Friend password
    Friend objDatabase As New clsDatabase
    Friend USERGUID As String
    Friend FULLNAME As String
    Friend CURRENT_DB_KEY As String
    Friend LOGIN_NAME As String
    Friend IS_LOGGED_IN As Boolean
    Friend PWD_EXPIRES
    Friend PWD_EXPIRES_DAYS As Long
    Dim clsData As New clsDatabase
    Dim connectionString As String = clsData.GetConString()
    Dim con As New SqlConnection(connectionString)
    Dim ErrMessage As String

    Public Function Login(ByRef rs As SqlDataReader) As Boolean

        If userName <> "" And password <> "" Then

            Try
                ''LoadData()
                Dim cmd As New SqlCommand("SP_LOGIN", con)
                cmd.CommandType = CommandType.StoredProcedure
                con.Open()
                Dim param As New SqlParameter
                cmd.Parameters.AddWithValue("@LOGIN_NAME", userName)
                cmd.Parameters.AddWithValue("@PASSWORD", password)
                rs = cmd.ExecuteReader()
                If rs.Read() Then
                    FULLNAME = rs("FULLNAME")
                    USERGUID = rs("USER_GUID").ToString
                    IS_LOGGED_IN = rs("IS_LOGGED_IN")
                    Try
                        PWD_EXPIRES = rs("PWD_EXPIRES")
                        con.Close()
                        PWD_EXPIRES_DAYS = DateDiff(DateInterval.Day, Now(), PWD_EXPIRES)
                        'set password expiration message
                        If PWD_EXPIRES_DAYS <= 7 Then
                            Session("PWD_EXPIRES_DAYS") = "  (Passowrd Expires in " + PWD_EXPIRES_DAYS.ToString + " days)"
                        Else
                            Session("PWD_EXPIRES_DAYS") = ""
                        End If
                    Catch
                        PWD_EXPIRES = #1/1/2500#
                        PWD_EXPIRES_DAYS = 1000
                        Session("PWD_EXPIRES_DAYS") = ""
                    End Try
                    con.Close()
                    Return True
                End If

            Catch eSql As SqlException
                con.Close()
                Return False
            Catch ex As Exception
                clsError.CatchError(ex)
                Return False
            End Try
        End If
    End Function

    Public Function Confirm(ByVal pGuid As String) As Boolean
        Dim rs As SqlDataReader

        Try
            Dim cmd As New SqlCommand("SP_CONFIRM", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("GUID", pGuid)
            rs = cmd.ExecuteReader()
            If rs.Read() Then
                If rs.HasRows Then
                    FULLNAME = rs("FULLNAME")
                    USERGUID = rs("USER_GUID").ToString
                    CURRENT_DB_KEY = rs("CURRENT_DB_KEY")
                    LOGIN_NAME = rs("LOGIN_NAME")
                    Return True
                Else
                    Return False
                End If
            Else
                Return False 'User is not logged in
            End If

        Catch ex As Exception
            clsError.CatchError(ex)
            Return False
        End Try
    End Function

    Public Function UserSecurity(ByRef rs As SqlDataReader, pGuid As String) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_USER_GET_SECURITY", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("GUID", pGuid)
            rs = cmd.ExecuteReader()
            Dim dict As New Dictionary(Of String, String)
            If rs.Read() Then
                For count As Integer = 0 To (rs.FieldCount - 1)
                    dict.Add(rs.GetName(count), rs.GetValue(count))
                Next
                con.Close()
                Return True
            Else
                dict.Add("false", 0)
                Return False
            End If
        Catch ex As Exception
            clsError.CatchError(ex)
            Return False
        End Try
    End Function

    Public Function LogoutUser(ByVal pGuid As String) As Boolean
        Dim rs As SqlDataReader
        Try
            Dim cmd As New SqlCommand("SP_LOGOUT", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("GUID", pGuid)
            rs = cmd.ExecuteReader()
            If rs.Read() Then
                con.Close()
                Return True
            Else
                con.Close()
                Return False
            End If
        Catch ex As Exception
            clsError.CatchError(ex)
            Return False
        End Try
    End Function

    Public Function ChangePassword(ByRef rs As SqlDataReader, ByVal pLoginName As String, ByVal pOldPassword As String, ByVal pNewPassword As String, ByVal pGuid As String) As Boolean
        Try
            Dim cmd As New SqlCommand("SP_USER_CHANGE_PWD_2012", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@GUID", pGuid)
            cmd.Parameters.AddWithValue("@LOGIN_NAME", pLoginName)
            cmd.Parameters.AddWithValue("@OLD_PASSWORD", pOldPassword)
            cmd.Parameters.AddWithValue("@NEW_PASSWORD", pNewPassword)
            rs = cmd.ExecuteReader()
            If rs.Read() Then
                If rs(0) = 0 Then
                    ChangePassword = False
                Else
                    ChangePassword = True
                End If
            End If
            Dim test = ChangePassword
            Return ChangePassword

        Catch ex As Exception
            clsError.CatchError(ex)
            Return False
        End Try
    End Function
    'AMG add functions to load config values into Dictionary object
    'AMG add function to load security settins into Dictionary object
    ''  Public Function ConfigValues() As Dictionary(Of Integer, String)

    ''End Function
End Class
