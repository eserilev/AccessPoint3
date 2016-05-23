Public Class VerticalNavbar
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function stuff(ByVal test As String)
        Dim objDefault As New clsUser
        Dim objSession As New clsSession
    End Function

    Protected Sub click_logout(sender As Object, e As EventArgs)
        Dim objDefault As New clsUser
        Dim access = Session("GSI_GUID")
        objDefault.LogoutUser(access)
        Response.Redirect(ConfigurationManager.AppSettings.Get("TimeoutRedirect"))
    End Sub

End Class