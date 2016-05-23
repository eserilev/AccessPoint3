Imports System.Data.SqlClient

Public Class member_details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadData()
        LoadEligHistoryGrid()
        LoadAuthHistroyGrid()
    End Sub
    Public Function LoadData()
        Dim objMember As New clsMember
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objMember.MEMBER_ID = Request.QueryString("mID")
            objMember.USER_GUID = objSession.USER_GUID
            If objMember.GetMemberResults(rs) Then
                lblIPA.Text = objMember.IPA_Name.ToString()
                lblMemName.Text = objMember.MEMBER_NAME.ToString()
                lblHealthPlan.Text = objMember.HEALTH_PLAN.ToString()
                lblCoverage.Text = objMember.MEMB_OTHCOV.ToString()
                lblAddress.Text = objMember.ADDRESS.ToString()
                lblCityStateZip.Text = objMember.CSZ.ToString()
                lblDOB.Text = objMember.BIRTH.ToString()
                lblRelToSubs.Text = objMember.RELATION.ToString()
                lblBenefitPlan.Text = objMember.BENEFIT_PLAN.ToString()
                lblBenefitEffective.Text = objMember.BENEFIT_EFFECTIVE.ToString()
                lblCoPay.Text = objMember.COPAY.ToString()
                lblBenefitTermed.Text = objMember.BENEFIT_TERM.ToString()
                lblPcpName.Text = objMember.PCP_NAME.ToString()
                lblSpecialty.Text = objMember.PCP_SPECIALTY.ToString()
                lblPhoneNo.Text = objMember.PCP_PHONE.ToString()
                lblPcpEffective.Text = objMember.PCP_EFFECTIVE.ToString()
                lblProvId.Text = objMember.PCP_ID.ToString()
                lblFax.Text = objMember.PCP_FAX.ToString()
                lblPcpTerm.Text = objMember.PCP_TERM.ToString()

            End If
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
    End Function

    Public Function LoadEligHistoryGrid()
        Dim objMember As New clsMember
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objMember.MEMBER_ID = Request.QueryString("mID")
            objMember.USER_GUID = objSession.USER_GUID
            Dim adapter = objMember.GetEligHistory()
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridEligHistory.DataSource = dt
            End With
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try

    End Function


    Public Function LoadAuthHistroyGrid()
        Dim objMember As New clsMember
        Dim objSession As New clsSession
        Dim rs As SqlDataReader
        objSession = CType(Session("userSession"), clsSession)
        Try
            objMember.MEMBER_ID = Request.QueryString("mID")
            objMember.USER_GUID = objSession.USER_GUID
            Dim adapter = objMember.GetAuthHistory()
            With adapter
                Dim dt As New DataTable
                .Fill(dt)
                Me.gridAuthHistory.DataSource = dt
            End With
        Catch ex As Exception
            Throw ex
            Exit Function
        End Try
    End Function

End Class