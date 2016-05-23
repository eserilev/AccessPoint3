Imports System.Data.SqlClient

Public Class _default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objDefault As New clsUser
        Dim clsData As New clsDatabase

        Dim connectionString As String = clsData.GetConString()
        If Not IsPostBack() Then
            ChangePassWindow.Visible = False
            LoginWindow.Visible = True
        End If

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As ImageClickEventArgs) Handles btnLogin.Click
        Dim objDefault As New clsUser
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        Dim ds2 As DataSet
        checkboxMessage.Visible = False
        loginMessage.Visible = False
        objDefault.userName = txtUsername.Value
        objDefault.password = txtPassword.Value
        If chkLoginDisclaimer.Checked Then
            If objDefault.Login(rs) Then
                ''login succesful
                objSession.USERNAME = objDefault.LOGIN_NAME
                objSession.USER_GUID = objDefault.USERGUID
                objSession.FULLNAME = objDefault.FULLNAME
                objSession.cUser = objDefault
                Session("userSession") = objSession
                objSession = CType(Session("userSession"), clsSession)
                Master.lblCurrentUser = objSession.FULLNAME
                Master.lblCurrentIPA = "Main Street IPA"




                If objDefault.PWD_EXPIRES_DAYS <= 0 Then
                    ''password is expired
                    Label1.Text = Session("PWD_EXPIRES_DAYS")
                    Label1.Visible = True
                    LoginWindow.Visible = False
                    ChangePassWindow.Visible = True
                End If
                Label1.Text = Session("PWD_EXPIRES_DAYS")
                Label1.Visible = True
                LoginWindow.Modal = False
                LoginWindow.Visible = False
            Else
                loginMessage.Visible = True
                loginMessage.Text = " The username Or password did not match, please try again "
                LoginWindow.Modal = True
                LoginWindow.Visible = True
            End If
        Else
            checkboxMessage.Visible = True
            checkboxMessage.Text = " Please agree to the terms of service by clicking the checkbox"
        End If
    End Sub

    Protected Sub btnChangePass_Click(sender As Object, e As ImageClickEventArgs) Handles btnChangePass.Click
        Dim objDefault As New clsUser
        Dim objSession As clsSession
        objSession = Session("userSession")
        Dim rs As SqlDataReader
        Try
            If txtNewPass.Value.Equals(txtCheckNewPass.Value) Then
                If objDefault.ChangePassword(rs, objSession.USERNAME, txtOldPass.Value, txtNewPass.Value, objSession.USER_GUID) Then
                    ''Password change succesful!
                    ChangePassWindow.Visible = False
                    LoginWindow.Visible = True
                    LoginWindow.Modal = True
                    objDefault.LogoutUser(objSession.USER_GUID)
                Else
                    ''Changepassword returned false
                End If
            Else
                ''new password values dont match
            End If


        Catch ex As Exception

        End Try
    End Sub
End Class