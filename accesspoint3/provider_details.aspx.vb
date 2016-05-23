Imports System.Data.SqlClient

Public Class provider_details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objDefault As New clsUser
        Dim objSession As New clsSession
        Dim objProv As New clsProvider
        objSession = CType(Session("userSession"), clsSession)
        If Not objDefault.Confirm(objSession.USER_GUID) Then
            ''user is not logged in
            Session("LoginMessage") = "Your previous session expired.  Please login again."
            Response.Redirect(ConfigurationManager.AppSettings.Get("TimeoutRedirect"))
            Exit Sub
        End If
        Try
            If Not Page.IsPostBack Then
                LoadData()
            End If
        Catch ex As Exception
            clsError.CatchError(ex)
        End Try

    End Sub

    Public Function LoadData()
        Dim objProvider As New clsProvider
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objProvider.PROV_ID = Request.QueryString("pID")
            objProvider.USER_GUID = objSession.USER_GUID
            If objProvider.GetProviderDetails(rs) Then
                lblProviderID.Text = objProvider.PROVID.ToString()
                lblClass.Text = objProvider.CLS.ToString()
                lblName.Text = objProvider.PROVIDER_NAME.ToString()
                lblGroupID.Text = objProvider.GROUP_ID.ToString()
                lblPractice.Text = objProvider.GROUP.ToString()
                lblSpecialty.Text = objProvider.Specialty.ToString()
                lblContractEff.Text = objProvider.CONTRACT_EFFECTIVE.ToString()
                lblTerm.Text = objProvider.CONTRACT_TERM.ToString()
                lblAddressType.Text = objProvider.ADDRESS_TYPE.ToString()
                lblStreet.Text = objProvider.STREET.ToString()
                lblStreet2.Text = objProvider.ADDRESS2.ToString()
                lblCity.Text = objProvider.CITY_STATE_ZIP.ToString()
                lblPhone.Text = objProvider.PHONE.ToString()
                lblFax.Text = objProvider.FAX.ToString()
                lblContact.Text = objProvider.CONTACT.ToString()
                lblEmail.Text = objProvider.EMAIL.ToString()
            End If
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
    End Function
End Class