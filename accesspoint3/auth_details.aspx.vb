Imports System.Data.SqlClient

Public Class auth_details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadAttachmentGrid()
        LoadData()
        LoadAuthGrid()
    End Sub

    Public Function LoadData()
        Dim objAuth As New clsAuthorization
        Dim objSession As New clsSession
        Dim objProvider As New clsProvider
        Dim objMember As New clsMember
        Dim rs, mem_rs, prov_rs, auth_rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objAuth.Authno = Request.QueryString("aid")
            objAuth.WEB_DBKEY = Request.QueryString("pDBKEY")
            objAuth.USER_GUID = objSession.USER_GUID
            If objAuth.GetAuthDetails(rs) Then
                lblIpa.Text = objAuth.IPA_Name
                lblIpaAddress1.Text = objAuth.IPA_Address1
                lblIpaAddress2.Text = objAuth.IPA_Address2
                lblHealthPlan.Text = objAuth.HEALTH_PLAN
                lblPos.Text = objAuth.PLACESVC
                lblAuthNo.Text = objAuth.Authno
                lblReqDate.Text = objAuth.REQDATE


                lblStatus.Text = objAuth.STATUS
                lblAuthDate.Text = objAuth.AUTHDATE
                lblExpDate.Text = objAuth.EXPRDATE
                lblPos.Text = objAuth.PLACESVC
                lblMemo.Text = objAuth.MEMO


                objMember.USER_GUID = objSession.USER_GUID
                objMember.MEMBER_ID = objAuth.MEMB_KEYID

                If objMember.GetMemberResults(mem_rs) Then
                    lblMembName.Text = objMember.MEMBER_NAME
                    lblMembSex.Text = objMember.SEX
                    lblMembDob.Text = objMember.BIRTH
                    lblAge.Text = objMember.AGE
                    lblDiag.Text = objAuth.DIAG
                End If
                objProvider.USER_GUID = objSession.USER_GUID
                objProvider.PROV_ID = objMember.PROV_KEYID

                If objProvider.GetProviderDetails(prov_rs) Then
                    lblReqProvName.Text = objProvider.PROVIDER_NAME
                    lblReqProvId.Text = objProvider.PROVID
                    lblReqProvSpecialty.Text = objProvider.Specialty
                    lblReqProvPhone.Text = objProvider.PHONE
                    lblReqProvFax.Text = objProvider.FAX
                End If

                objProvider.PROV_ID = objAuth.AUTHPCP_KEYID
                If objProvider.GetProviderDetails(auth_rs) Then
                    lblRefProvName.Text = objProvider.PROVIDER_NAME
                    lblRefProvId.Text = objProvider.PROVID
                    lblReqProvSpecialty.Text = objProvider.Specialty
                    lblReqProvPhone.Text = objProvider.PHONE
                    lblReqProvFax.Text = objProvider.FAX
                End If

            Else

            End If
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
    End Function

    Public Function LoadAttachmentGrid()
        Dim objAuth As New clsAuthorization
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objAuth.Authno = Request.QueryString("aid")
            objAuth.USER_GUID = objSession.USER_GUID
            objAuth.WEB_DBKEY = Request.QueryString("pDBKEY")
            Dim adapter = objAuth.GetFileAttachments
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridAttachments.DataSource = dt
            End With
            If gridAttachments.Rows.Count = 0 Then
                ''throw no results messageco
                ''                ''lblNoResults.Visible = True
                gridAttachments.Visible = True
            Else
                gridAttachments.Visible = True
            End If
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
    End Function


    Public Function LoadAuthGrid()
        Dim objAuth As New clsAuthorization
        Dim objSession As New clsSession
        objSession = CType(Session("userSession"), clsSession)
        Try
            objAuth.Authno = Request.QueryString("aID")
            objAuth.USER_GUID = objSession.USER_GUID
            objAuth.WEB_DBKEY = Request.QueryString("pDBKEY")
            Dim adapter = objAuth.GetAuthDetails()
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridService.DataSource = dt
                gridService.Visible = True
            End With
        Catch ex As Exception
            Throw ex
            ''clsError.CatchError(ex)
            Exit Function
        End Try

    End Function


End Class