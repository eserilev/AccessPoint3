

Module clsError
    Public Sub CatchError(ByVal ex As Exception)
        'AMG add login name of user from the session object
        '' IO.File.AppendAllText("C:\Log.txt", String.Format("{0}{1}", Environment.NewLine, ex.ToString())) ''current user, timestamp
    End Sub
End Module
