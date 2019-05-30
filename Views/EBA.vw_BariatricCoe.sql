SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [EBA].[vw_BariatricCoe]

AS

SELECT
	 core.*
FROM
	(
	SELECT 
		fInitial.[LOG_ID]
		,fInitial.[CASE_ID]
		,fInitial.[PAT_ENC_CSN_ID]
		,fInitial.[HSP_ACCOUNT_ID]
		,har.BASE_CLASS 
		,har.ACCOUNT_CLASS
		,har.HSP_ACCOUNT_NAME
		,har.ADM_DATE_TIME
		,har.DISCH_DATE_TIME
		,pe.DISCH_DISP_NAME
		,pat.BIRTH_DATE
		,pat.PATIENT_SEX
		,pe.BMI
		,DATEDIFF(mi,CAST(har.ADM_DATE_TIME as date),CAST(har.DISCH_DATE_TIME as date)) LOS
		,cov1.PAYOR_ID PAYOR_ID_1
		,cov1.PAYOR_NAME PAYOR_NAME_1
		,cov1.SUBSCR_NUM SUBSCR_NUM_1
		,cov2.PAYOR_ID PAYOR_ID_2
		,cov2.PAYOR_NAME PAYOR_NAME_2
		,cov2.SUBSCR_NUM SUBSCR_NUM_2
		,fInitial.[UPDATE_DATE]
		,CONVERT(varchar(10),CAST(fInitial.[PROCEDURE_DATE] as date),101) [PROCEDURE_DATE]
		,fInitial.[PATIENT_AGE]
		,fInitial.[ADD_ON_CASE_SCH_YN]
		,fInitial.[INPATIENT_YN]
		,fInitial.[PRIMARY_PROCEDURE_ID]
		,fInitial.[PRIMARY_PROCEDURE_NAME]
		,fInitial.[PRIMARY_PROCEDURE_CODE]
		,sched1.[OR_PROC_CODE] SCHEDULED_PROCEDURE_1_CODE
		,sched1.PROC_NAME SCHEDULED_PROCEDURE_1_NAME
		,sched2.[OR_PROC_CODE] SCHEDULED_PROCEDURE_2_CODE
		,sched2.PROC_NAME SCHEDULED_PROCEDURE_2_NAME
		--,sched3.[OR_PROC_CODE] SCHEDULED_PROCEDURE_3_CODE
		--,sched3.PROC_NAME SCHEDULED_PROCEDURE_3_NAME
		,proc1.[OR_PROC_CODE] PERFORMED_PROCEDURE_1_CODE
		,proc1.PROC_NAME PERFORMED_PROCEDURE_1_NAME
		,proc2.[OR_PROC_CODE] PERFORMED_PROCEDURE_2_CODE
		,proc2.PROC_NAME PERFORMED_PROCEDURE_2_NAME
		--,proc3.[OR_PROC_CODE] PERFORMED_PROCEDURE_3_CODE
		--,proc3.PROC_NAME PERFORMED_PROCEDURE_3_NAME
		,cpt1.Cpt_Code PERFORMED_CPT_1
		,cpt1.Cpt_Code_Desc PERFORMED_CPT_1_NAME
		,cpt2.Cpt_Code PERFORMED_CPT_2
		,cpt2.Cpt_Code_Desc PERFORMED_CPT_2_NAME
		,fInitial.[PRIMARY_PHYSICIAN_ID]
		,fInitial.[PRIMARY_PHYSICIAN_NAME]
		,fInitial.[SECONDARY_PHYSICIAN_ID]
		,fInitial.[SECONDARY_PHYSICIAN_NAME]
		,fInitial.[RESP_ANES_ID]
		,fInitial.[RESP_ANES_NAME]
		,fInitial.[FIRST_ANES_ID]
		,fInitial.[FIRST_ANES_NAME]
		,fInitial.[PRIMARY_PREOP_NURSE_ID]
		,fInitial.[RIMARY_PREOP_NURSE_NAME]
		,fInitial.[PRIMARY_CIRCULATOR_ID]
		,fInitial.[PRIMARY_CIRCULATOR_NAME]
		,fInitial.[PRIMARY_SURG_TECH_ID]
		,fInitial.[PRIMARY_SURG_TECH_NAME]
		,fInitial.[PRIMARY_RECOVERY_NURSE_ID]
		,fInitial.[PROV_NAME]
		,fInitial.[PRIMARY_PHASEII_NURSE_ID]
		,fInitial.[PRIMARY_PHASEII_NURSE_NAME]
		,fInitial.[NUMBER_OF_PROCEDURES]
		,fInitial.[PRIMARY_ANES_TYPE_C]
		,fInitial.[PRIMARY_ANES_TYPE_NAME]
		,fInitial.[SCHEDULED_IN_OR_DTTM]
		,fInitial.[SCHEDULED_OUT_OR_DTTM]
		,fInitial.[IN_PREOP_DTTM]
		,fInitial.[COMP_PREOP_DTTM]
		,fInitial.[IN_OR_DTTM]
		,fInitial.[PROCEDURE_START_DTTM]
		,fInitial.[PROCEDURE_COMP_DTTM]
		,fInitial.[OUT_OR_DTTM]
		,fInitial.[IN_RECOVERY_DTTM]
		,fInitial.[COMP_RECOVERY_DTTM]
		,fInitial.[OUT_RECOVERY_DTTM]
		,fInitial.[IN_PHASEII_DTTM]
		,fInitial.[COMP_PHASEII_DTTM]
		,fInitial.[OUT_PHASEII_DTTM]
		,fInitial.[MINUTES_IN_PREOP]
		,fInitial.[MINUTES_SCHEDULED_IN_OR]
		,fInitial.[MINUTES_IN_OR]
		,fInitial.[MINUTES_BOARD_RECOVERY]
		,fInitial.[MINUTES_IN_RECOVERY]
		,fInitial.[MINUTES_BOARD_PHASEII]
		,fInitial.[MINUTES_IN_PHASEII]
		,fInitial.[ROOM_PRE_LOG_ID]
		,fInitial.[PHYS_PRE_LOG_ID]
		,fInitial.[DEPARTMENT_ID]
		,fInitial.[DEPARTMENT_NAME]
		,fInitial.[REV_LOC_ID]
		,fInitial.[REV_LOC_NAME]
		,fInitial.[LOCATION_ABBR]
		,fInitial.[RPT_GRP_SIX]
		,fInitial.[ROOM_ID]
		,fInitial.[ROOM_NAME]
		,fInitial.[DELAY_TYPE_C]
		,fInitial.[DELAY_TYPE_NAME]
		,fInitial.[DELAY_REASON_C]
		,fInitial.[DELAY_REASON_NAME]
		,fInitial.[DELAY_COMMENTS]
		,fInitial.[ANES_START_TIME]
		,fInitial.[ANES_STOP_TIME]
		,EOMONTH(fInitial.PROCEDURE_DATE) End_of_Month
		,CASE WHEN map.Include_YN = 'Y' AND 
			((fInitial.PRIMARY_PROCEDURE_CODE in ('7569','2804','2788','6313','704','705','849','1137') AND BariatricDx.HSP_ACCOUNT_ID IS NOT NULL) 
			OR fInitial.PRIMARY_PROCEDURE_CODE not in ('7569','2804','2788','6313','704','705','849','1137')) THEN 'Y' ELSE 'N' END Include_Bariatrics_YN
		,map.Include_YN Include_Bariatrics_Procedure_Only_YN
		,CASE WHEN bariatricDx.HSP_ACCOUNT_ID IS NOT NULL THEN 'Y' ELSE 'N' END BariatricDx_YN
		,map.[Procedure_Group_Type_MBSAQIP ]
		,map.Procedure_Sub_Group
		,CASE WHEN fInitial.IN_OR_DTTM is not null AND fInitial.OUT_OR_DTTM is not null THEN 'Y' ELSE 'N' END ValidStartStop_YN
		,CASE WHEN fReOp.PAT_ID is NOT NULL THEN 'Y' ELSE 'N' END Thirty_Day_ReOp_YN
		,CASE WHEN harReAdmit.HSP_ACCOUNT_ID IS NOT NULL THEN 'Y' ELSE 'N' END Thirty_Day_ReAdmit_YN
		,CASE WHEN edVisit.PAT_ID IS NOT NULL THEN 'Y' ELSE 'N' END Thirty_Day_EdVisit_YN
		,CASE WHEN fIntervention.HSP_ACCOUNT_ID IS NOT NULL THEN 'Y' ELSE 'N' END Thirty_Day_InterventionVisit_YN
		,CASE WHEN fInitial.SCHEDULED_IN_OR_DTTM < fInitial.IN_OR_DTTM THEN 'N' ELSE 'Y' END ONTIME_START_YN
		,CASE WHEN har.PRIMARY_FINANCIAL_CLASS_NAME like '%Kaiser%' THEN 'Y' ELSE 'N' END Kaiser_YN
		,har.CUSTOM_LOC
		,har.HSP_ACCOUNT_ID HAR_HSP_ACCOUNT_ID
		,har.PATIENT_MRN HAR_PATIENT_MRN
		,har.PAT_ID HAR_HAR_PAT_ID
		,fReOp.LOG_ID ReOp_LOG_ID
		,harReAdmit.HSP_ACCOUNT_ID ReAdmit_HSP_ACCOUNT_ID
		,edVisit.HSP_ACCOUNT_ID edVisit_HSP_ACCOUNT_ID
		,fIntervention.HSP_ACCOUNT_ID intervention_HSP_ACCOUNT_ID
		,ROW_NUMBER() OVER (PARTITION BY fInitial.LOG_ID ORDER BY fReOp.PROCEDURE_DATE, CAST(harReAdmit.ADM_DATE_TIME as date), CAST(edVisit.SERVICE_DATE as date)) Total_Log_Id_Ranker 
	FROM EBA.Clarity.EssentialFLogBased fInitial
	LEFT JOIN EBA.Clarity.EssentialPatEnc pe ON fInitial.PAT_ENC_CSN_ID = pe.PAT_ENC_CSN_ID
	LEFT JOIN EBA.Clarity.EssentialHspAccount har ON fInitial.HSP_ACCOUNT_ID = har.HSP_ACCOUNT_ID
	LEFT JOIN EBA.Clarity.EssentialHspAcctCvgList cvglist1 ON har.HSP_ACCOUNT_ID = cvglist1.HSP_ACCOUNT_ID AND cvglist1.LINE = 1
	LEFT JOIN EBA.Clarity.EssentialCoverage cov1 ON cvglist1.COVERAGE_ID = cov1.COVERAGE_ID
	LEFT JOIN EBA.Clarity.EssentialHspAcctCvgList cvglist2 ON har.HSP_ACCOUNT_ID = cvglist2.HSP_ACCOUNT_ID AND cvglist1.LINE = 2
	LEFT JOIN EBA.Clarity.EssentialCoverage cov2 ON cvglist2.COVERAGE_ID = cov2.COVERAGE_ID
	LEFT JOIN EBA.Clarity.EssentialPatient pat ON har.PAT_ID = pat.PAT_ID
	LEFT JOIN EBA.Clarity.EssentialOrCaseAllProc sched1 ON fInitial.CASE_ID = sched1.OR_CASE_ID AND sched1.LINE = 1
	LEFT JOIN EBA.Clarity.EssentialOrCaseAllProc sched2 ON fInitial.CASE_ID = sched2.OR_CASE_ID AND sched2.LINE = 2
	--LEFT JOIN EBA.Clarity.EssentialOrCaseAllProc sched3 ON fInitial.CASE_ID = sched1.OR_CASE_ID AND sched1.LINE = 3
	LEFT JOIN EBA.Clarity.EssentialOrLogAllProc proc1 ON fInitial.LOG_ID = proc1.LOG_ID AND proc1.LINE = 1
	LEFT JOIN EBA.Clarity.EssentialOrLogAllProc proc2 ON fInitial.LOG_ID = proc2.LOG_ID AND proc2.LINE = 2
	--LEFT JOIN EBA.Clarity.EssentialOrLogAllProc proc3 ON fInitial.LOG_ID = proc1.LOG_ID AND proc1.LINE = 3
	LEFT JOIN EBA.Clarity.EssentialHspAcctCptCodes cpt1 ON fInitial.HSP_ACCOUNT_ID = cpt1.Hsp_Account_ID AND cpt1.Line = 1
	LEFT JOIN EBA.Clarity.EssentialHspAcctCptCodes cpt2 ON fInitial.HSP_ACCOUNT_ID = cpt2.Hsp_Account_ID AND cpt2.Line = 2
	LEFT JOIN EBA.MsExcel.BariatricProcedureMapping map ON fInitial.PRIMARY_PROCEDURE_ID = map.PRIMARY_PROCEDURE_ID
	
	
	--- Re-operation 
	
	LEFT JOIN
		( 
		SELECT 
			har.PAT_ID
			,f.LOG_ID
			,CAST(f.PROCEDURE_DATE as date) PROCEDURE_DATE
		FROM EBA.Clarity.EssentialFLogBased f 
		LEFT JOIN EBA.Clarity.EssentialHspAccount har ON f.HSP_ACCOUNT_ID = har.HSP_ACCOUNT_ID
		WHERE f.IN_OR_DTTM IS NOT NULL AND f.OUT_OR_DTTM IS NOT NULL
		AND f.DEPARTMENT_NAME = 'SJH PERIOP SVCS'
		GROUP BY 
			har.PAT_ID
			,f.LOG_ID
			,CAST(f.PROCEDURE_DATE as date)
		) fReOp ON har.PAT_ID = fReOp.PAT_ID AND CAST(fInitial.PROCEDURE_DATE as date) <= fReOp.PROCEDURE_DATE
											 AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(dd,-30,fReOp.PROCEDURE_DATE)
										     AND fInitial.LOG_ID <> fReOp.LOG_ID
	
	----- Re-admission
	
	LEFT JOIN EBA.Clarity.EssentialHspAccount harReAdmit ON har.PAT_ID = harReAdmit.PAT_ID 
														AND CAST(fInitial.PROCEDURE_DATE as date) < CAST(harReAdmit.ADM_DATE_TIME as date)
														AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(day,-30,CAST(harReAdmit.ADM_DATE_TIME as date))
														AND harReAdmit.TOT_CHGS > 0
													    AND harReAdmit.ACCT_BASECLS_HA_C = 1
	
	----- ED-Visit
	
	LEFT JOIN 
		(
		SELECT 
			har.PAT_ID
			,har.HSP_ACCOUNT_ID
			,CAST(c.SERVICE_DATE as date) SERVICE_DATE
		FROM EBA.Clarity.EssentialHspTransactionsChgs c
		INNER JOIN EBA.Clarity.EssentialHspAccount har ON c.HSP_ACCOUNT_ID = har.HSP_ACCOUNT_ID
		WHERE 
			c.TX_POST_DATE >= '5-1-2018'
			AND c.CPT_CODE in ('99281','99282','99283','99284','99285','99291')
		GROUP BY 
			har.PAT_ID
			,har.HSP_ACCOUNT_ID
			,CAST(c.SERVICE_DATE as date)
		HAVING SUM(c.QUANTITY) > 0
		) edVisit ON har.PAT_ID = edVisit.PAT_ID 
						AND CAST(fInitial.PROCEDURE_DATE as date) < CAST(edVisit.SERVICE_DATE as date)
						AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(day,-30,CAST(edVisit.SERVICE_DATE as date))
						AND harReAdmit.TOT_CHGS > 0
	
	
	----- Visit back to a intervention area   -- this was the initial attempt -- the following block uses the procedures list
	
	--LEFT JOIN
	--	( 
	--	SELECT 
	--		har.PAT_ID
	--		,f.LOG_ID
	--		,CAST(f.PROCEDURE_DATE as date) PROCEDURE_DATE
	--	FROM EBA.Clarity.EssentialFLogBased f 
	--	LEFT JOIN EBA.Clarity.EssentialHspAccount har ON f.HSP_ACCOUNT_ID = har.HSP_ACCOUNT_ID
	--	WHERE 
	--		--f.IN_OR_DTTM IS NOT NULL 
	--		--AND f.OUT_OR_DTTM IS NOT NULL
	--	f.DEPARTMENT_NAME = 'SJH GI'
	--	GROUP BY 
	--		har.PAT_ID
	--		,f.LOG_ID
	--		,CAST(f.PROCEDURE_DATE as date)
	--	) fTherapy ON har.PAT_ID = fTherapy.PAT_ID AND CAST(fInitial.PROCEDURE_DATE as date) <= fTherapy.PROCEDURE_DATE
	--										 AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(dd,-30,fTherapy.PROCEDURE_DATE)
	--									     AND fInitial.LOG_ID <> fTherapy.LOG_ID


	--- Visit back to a intervention area   -- this method utilizes the procedure list
	
	LEFT JOIN
		( 
		SELECT px.*
		FROM
			(
			SELECT 
				px.HSP_ACCOUNT_ID
				,har.PAT_ID
				,CAST(px.PROC_DATE as date) PROC_DATE
			FROM Eba.Clarity.EssentialHspAcctPxList px
			LEFT JOIN EBA.Clarity.EssentialHspAccount har ON px.HSP_ACCOUNT_ID = har.HSP_ACCOUNT_ID
			GROUP BY 
				px.HSP_ACCOUNT_ID
				,har.PAT_ID
				,CAST(px.PROC_DATE as date)
			) px
			LEFT JOIN 
				(
				SELECT 
					f.HSP_ACCOUNT_ID
					,CAST(f.PROCEDURE_DATE as date) PROCEDURE_DATE
				FROM EBA.Clarity.EssentialFLogBased f
				GROUP BY 
					f.HSP_ACCOUNT_ID
					,CAST(f.PROCEDURE_DATE as date)
				) surg ON px.HSP_ACCOUNT_ID = surg.HSP_ACCOUNT_ID AND px.PROC_DATE = surg.PROCEDURE_DATE
		WHERE surg.HSP_ACCOUNT_ID IS NULL
		) fIntervention ON har.PAT_ID = fIntervention.PAT_ID AND CAST(fInitial.PROCEDURE_DATE as date) <= fIntervention.PROC_DATE
											 AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(dd,-30,fIntervention.PROC_DATE)
										  -- AND fInitial.LOG_ID <> fTherapy.LOG_ID


		--GROUP BY 
		--	har.PAT_ID
		--	,f.LOG_ID
		--	,CAST(f.PROCEDURE_DATE as date)
		--) fTherapy ON har.PAT_ID = fTherapy.PAT_ID AND CAST(fInitial.PROCEDURE_DATE as date) <= fTherapy.PROCEDURE_DATE
		--									 AND CAST(fInitial.PROCEDURE_DATE as date) >= DATEADD(dd,-30,fTherapy.PROCEDURE_DATE)
		--								     AND fInitial.LOG_ID <> fTherapy.LOG_ID
	

	-- List of Har's that had the bariatric DX code 

	LEFT JOIN 
		(
		SELECT 
			dx.HSP_ACCOUNT_ID
		FROM [Eba].[Clarity].[EssentialHspAcctDxList] dx
		WHERE dx.REF_BILL_CODE = 'Z98.84'
		GROUP BY dx.HSP_ACCOUNT_ID
		) BariatricDx ON fInitial.HSP_ACCOUNT_ID = BariatricDx.HSP_ACCOUNT_ID

	
	-- Final where 
	
	WHERE fInitial.PRIMARY_PHYSICIAN_ID in ('4156155','4179575','4010282','4176057','4184160','4205486')
	AND fInitial.PROCEDURE_DATE >= '5-1-2018'
	AND fInitial.IN_OR_DTTM is not null 
	AND fInitial.OUT_OR_DTTM is not null
	AND finitial.DEPARTMENT_NAME = 'SJH PERIOP SVCS'
	) core
WHERE core.Total_Log_Id_Ranker = 1;
GO
