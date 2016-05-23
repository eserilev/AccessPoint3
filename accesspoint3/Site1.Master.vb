Public Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        If objSession IsNot Nothing Then
            Me.lblCurrentUser = objSession.FULLNAME
            Me.lblLastAction = ""

        End If

    End Sub

    Public Property lblCurrentIPA
        Get
            Dim lbl As Label = CType(VertNav.FindControl("lblCurrentIPA"), Label)
            Return lbl.Text
        End Get
        Set(value)
            Dim lbl As Label = CType(VertNav.FindControl("lblCurrentIPA"), Label)
            lbl.Text = value
        End Set
    End Property

    Public Property lblLastAction
        Get
            Dim lbl As Label = CType(VertNav.FindControl("lblCurrentIPA"), Label)
            Return lbl.Text
        End Get
        Set(value)
            Dim lbl As Label = CType(VertNav.FindControl("lblCurrentIPA"), Label)
            lbl.Text = value
        End Set
    End Property

    Public Property lblCurrentUser
        Get
            Dim lbl As Label = CType(VertNav.FindControl("lblUser"), Label)
            Return lbl.Text
        End Get
        Set(value)
            Dim lbl As Label = CType(VertNav.FindControl("lblUser"), Label)
            lbl.Text = value
        End Set
    End Property

End Class