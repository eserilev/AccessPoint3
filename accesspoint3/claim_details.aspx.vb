

Imports System.Data.SqlClient

Public Class claim_details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadData()
        LoadServicesGrid()
        LoadServicesTotalGrid()
    End Sub
    Public Function LoadData()
        Dim objClaim As New clsClaim
        Dim objSession As New clsSession
        Dim objProvider As New clsProvider
        Dim objMember As New clsMember
        Dim rs, mem_rs, prov_rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
            Try
            objClaim.CLAIM_ID = Request.QueryString("cID")
            objClaim.WEB_DBKEY = Request.QueryString("pDBKEY")
            objClaim.USER_GUID = objSession.USER_GUID
            If objClaim.GetClaimDetails(rs) Then
                lblIPA.Text = objClaim.IPA_NAME
                lblClaimNo.Text = objClaim.ClaimNo
                lblAuthNo.Text = objClaim.AuthNo
                lblDateRec.Text = objClaim.DATERECD
                lblVendor.Text = objClaim.VENDOR
                lblStatus.Text = objClaim.STATUS_DESCR
                lblCheck.Text = objClaim.CHECK_X
                lblDatePaid.Text = objClaim.DATEPAID
                lblPlaceOfService.Text = objClaim.PLACESVC
                lblProcStatus.Text = objClaim.PROCSTATUS_DESCR
                lblCrossRefId.Text = objClaim.CROSSREFID

                objMember.USER_GUID = objSession.USER_GUID
                objMember.MEMBER_ID = objClaim.MEMB_KEYID
                If objMember.GetMemberResults(mem_rs) Then
                    lblMemberName.Text = objMember.MEMBER_NAME
                    lblSex.Text = objMember.SEX
                    lblDob.Text = objMember.BIRTH
                    lblHealthPlan.Text = objMember.HEALTH_PLAN
                    lblAge.Text = objMember.AGE
                End If

                objProvider.PROV_ID = objClaim.PROV_KEYID
                objProvider.USER_GUID = objSession.USER_GUID
                If objProvider.GetProviderDetails(prov_rs) Then
                    lblProviderName.Text = objProvider.PROVIDER_NAME
                    lblProviderId.Text = objProvider.PROVID
                    lblSpecialty.Text = objProvider.Specialty
                    lblFax.Text = objProvider.FAX
                End If
            End If
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
        End Function

    Public Function LoadServicesGrid()
        Dim objClaim As New clsClaim
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objClaim.CLAIM_ID = Request.QueryString("cID")
            objClaim.USER_GUID = objSession.USER_GUID
            objClaim.WEB_DBKEY = Request.QueryString("pDBKEY")
            Dim adapter = objClaim.GetClaimDetails()
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridServices.DataSource = dt
            End With
        Catch ex As Exception
            clsError.CatchError(ex)
            Exit Function
        End Try

    End Function

    Public Function LoadServicesTotalGrid()
        Dim objClaim As New clsClaim
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objClaim.CLAIM_ID = Request.QueryString("cID")
            objClaim.USER_GUID = objSession.USER_GUID
            objClaim.WEB_DBKEY = Request.QueryString("pDBKEY")
            Dim adapter = objClaim.GetClaimTotals()
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridServicesTotal.DataSource = dt
            End With
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try

    End Function



End Class