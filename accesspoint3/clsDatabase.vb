Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO

Public Class clsDatabase
    'AMG Get connect from XML file.  Start using this class in the other classes


    Friend connectionString As String
    Dim m_Connection As New SqlConnection(connectionString)
    Public m_Command As SqlCommand
    Public ErrMessage As String

    Public Function GetConString() As String
        Dim document As XDocument = XDocument.Load(HttpContext.Current.Server.MapPath("~/Content/XMLConfig.xml"))
        Dim conString = From t In document.Descendants("connectionString") Select t.Value
        Return conString.First()
    End Function


    Public Function GetData(ByRef rs As SqlDataReader, ByVal sSQLString As String) As Boolean


        Try
            m_Command = New SqlCommand(sSQLString, m_Connection)
            m_Command.CommandTimeout = ConfigurationManager.AppSettings.Get("app_QueryTimeout")
            rs = m_Command.ExecuteReader()
            Return True

        Catch eSql As SqlException

            'Dim oLog As New EventLog
            'oLog.Source = "cms"
            'oLog.WriteEntry("clsDatabase.OpenDatabase:" & eSql.Message & " [ Error " & eSql.Number & "]")
            'oLog = Nothing

            ErrMessage = eSql.Message & " [ Error " & eSql.Number & "]"
            CloseDatabase()
            GetData = False

        Catch e As Exception

            'Dim oLog As New EventLog
            'oLog.Source = "cms"
            'oLog.WriteEntry("clsDatabase.GetData:" & e.Message)
            'oLog = Nothing

            ErrMessage = e.Message
            CloseDatabase()
            GetData = False

        End Try

    End Function

    Public Function CloseDatabase() As Boolean

        If ConfigurationManager.AppSettings.Get("debug_DontCloseDBConnection") = "true" Then
            Return True
            Exit Function
        End If

        Try
            m_Connection.Close()
            m_Connection = Nothing

        Catch eSql As SqlException
            ErrMessage = eSql.Message & " [ Error " & eSql.Number & "]"
            CloseDatabase = False

        Catch e As Exception
            'ErrMessage = e.Message
            'CloseDatabase = False
        End Try
    End Function
End Class
