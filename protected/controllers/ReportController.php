<?php

class ReportController extends RController
{
	public function actionView()
	{
		$this->render('view');
	}
	
	public $layout='//layouts/column2';
	public function filters()
	{
		return array(
			'rights', // perform access control for CRUD operations
		);
	}



	public function actionStudInfoReport()
	{

		$selected_list=null;
		
		$query=null;	
		$baseUrl = Yii::app()->baseUrl; 
  		$cs = Yii::app()->getClientScript();
  		$cs->registerCssFile($baseUrl.'/css/report.css');
		

		if((!empty($_POST['branch']) || !empty($_POST['acdm_period']) || !empty($_POST['quota']) || !empty($_POST['gender']) || !empty($_POST['city']) || !empty($_POST['category']) || !empty($_POST['bg']) || !empty($_POST['sem'])) && !empty($_POST['stud_info']))
		{
			//echo "i m here.."; exit;
			
	if(!empty($_POST['branch']))
	{
		$query .="stud.student_transaction_branch_id=".$_POST['branch']. " AND ";
	}
	if(!empty($_POST['acdm_period']))
	{
		$query .="stud.student_academic_term_period_tran_id=".$_POST['acdm_period']. " AND ";
	}
	
	if(!empty($_POST['quota']))
	{
		$query .="stud.student_transaction_quota_id=".$_POST['quota']. " AND ";
	}
	if(!empty($_POST['category']))
	{
		$query .="stud.student_transaction_category_id=".$_POST['category']. " AND ";
	}
	if(!empty($_POST['city']))
	{
		$query .="add.student_address_c_city=".$_POST['city']. " AND ";			
	}

	if(!empty($_POST['gender']))
	{
		$query .="stud_info.student_gender='".$_POST['gender']."' AND ";
		
	}
	if(!empty($_POST['bg']))
	{
		$query .="stud_info.student_bloodgroup='".$_POST['bg']."' AND ";
		
	}
	if(!empty($_POST['sem']))
	{
		$query .="stud.student_academic_term_name_id=".$_POST['sem']. " AND ";
	}

			$selected_list=$_POST['stud_info'];  
			
			$student_data =Yii::app()->db->createCommand()
					->select('*')
					->from('student_transaction stud')
					->join('student_info stud_info', 'stud_info.student_id = stud.student_transaction_student_id')
					->leftJoin('student_address add', 'add.student_address_id = stud.student_transaction_student_address_id')
					->where($query.' stud.student_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();


				//$this->layout='timetable_layout';	
						
				$this->render('stud_report_view',array(
			      		'stud_data'=>$student_data,'selected_list'=>$selected_list,'query'=>$query,
		       		));
				
				break;		
			}
				
		$this->render('studinfo_dyanamic_report_form1',array(
               'selected_list'=>$selected_list, 'query' => $query,
       		));
	
	}

	public function actionSelectedList()
	{
		if(!empty($_REQUEST['studentlistexport']))
		{
		$query= $_SESSION['query'];
		$selected_list=$_SESSION['selected_list'];
		$student_data =Yii::app()->db->createCommand()
					->select('*')
					->from('student_transaction stud')
					->join('student_info stud_info', 'stud_info.student_id = stud.student_transaction_student_id')
					->leftJoin('student_address add', 'add.student_address_id = stud.student_transaction_student_address_id')
					->where($query.' stud.student_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
		Yii::import('application.extensions.tcpdf.*');
		require_once('tcpdf/tcpdf.php');
		require_once('tcpdf/config/lang/eng.php');
		
		$html = $this->renderPartial('stud_report_view_pdf', array(
			'stud_data'=>$student_data, 
			'selected_list'=>$selected_list,
		), true);
		
		ob_clean();
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('StudentList Report');
		$pdf->SetSubject('StudentList Report');
		$pdf->SetKeywords('example, text, report');
		$pdf->SetHeaderData('', 0, "Student Info Report", '');
		//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Example Report by ".Yii::app()->name, "");
		$pdf->setHeaderFont(Array('helvetica', '', 8));
		$pdf->setFooterFont(Array('helvetica', '', 6));
		$pdf->SetMargins(15, 18, 15);
		$pdf->SetHeaderMargin(5);
		$pdf->SetFooterMargin(10);
		$pdf->SetAutoPageBreak(TRUE, 15);
		$pdf->SetFont('dejavusans', '', 7);
		
		$resolution= array(150, 150);
		$pdf->AddPage('P', $resolution);
		
		$pdf->writeHTML($html, true, false, true, false, '');
		$pdf->LastPage();
		$pdf->Output("StudentInfoReport.pdf", "I");
	
		}
		else if(!empty($_REQUEST['studentlistexcelexport']))
		{
		$query= $_SESSION['query'];
		$selected_list=$_SESSION['selected_list'];
		$student_data =Yii::app()->db->createCommand()
					->select('*')
					->from('student_transaction stud')
					->join('student_info stud_info', 'stud_info.student_id = stud.student_transaction_student_id')
					->leftJoin('student_address add', 'add.student_address_id = stud.student_transaction_student_address_id')

					->where($query.' stud.student_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
		  
		  Yii::app()->request->sendFile(date('YmdHis').'.xlsx',
			    $this->renderPartial('stud_report_view_excel', array(
				'stud_data'=>$student_data, 
				'selected_list'=>$selected_list,
			    ), true)
			);
		}		
		else
		{		
		$query=$_POST['query'];
		$selected_list=null;
		}
		
		$baseUrl = Yii::app()->baseUrl; 
  		$cs = Yii::app()->getClientScript();
  		$cs->registerCssFile($baseUrl.'/css/report.css');		
		

	}
/* for print student id card */

	public function actionEmployeeInfoReport()
	{
		$selected_list=null;
		
		$query=null;	
		$baseUrl = Yii::app()->baseUrl; 
  		$cs = Yii::app()->getClientScript();
  		$cs->registerCssFile($baseUrl.'/css/report.css');
		
    if((!empty($_POST['department'])||!empty($_POST['gender'])||!empty($_POST['city'])||!empty($_POST['category'])||!empty($_POST['bg'])) && !empty($_POST['emp_info']))
	{
			
	if(!empty($_POST['department']))
	{
		$query .="emp.employee_transaction_department_id=".$_POST['department']. " AND ";
	}
	
	if(!empty($_POST['category']))
	{
		$query .="emp.employee_transaction_category_id=".$_POST['category']. " AND ";
	}
	if(!empty($_POST['city']))
	{
		$query .="add.employee_address_c_city=".$_POST['city']. " AND ";
	}

	if(!empty($_POST['gender']))
	{
		
		$query .="emp_info.employee_gender='".$_POST['gender']."' AND ";
		
	}
	if(!empty($_POST['bg']))
	{
		$query .="emp_info.employee_bloodgroup='".$_POST['bg']."' AND ";
		
	}
			$selected_list = $_POST['emp_info'];
			$employee_data =Yii::app()->db->createCommand()
					->select('*')
					->from('employee_transaction emp')
					->join('employee_info emp_info', 'emp_info.employee_id = emp.employee_transaction_employee_id')
					->leftJoin('employee_address add', 'add.employee_address_id = emp.employee_transaction_emp_address_id')

					->where($query.' emp.employee_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
		//$this->layout='timetable_layout';
												
		$this->render('emp_report_view',array(
              		'emp_data'=>$employee_data,'selected_emp_list'=>$selected_list,'query'=>$query,
       		));
			
			
		}
		else		
		$this->render('empinfo_dyanamic_report_form',array('selected_list'=>$selected_list,'query'=>$query));
	
	}

	public function actionSelectedEmployeeList()
	{
		if(!empty($_REQUEST['employeelistexport']))
		{
		$query= $_SESSION['query'];
		$selected_list=$_SESSION['selected_list'];
		$employee_data =Yii::app()->db->createCommand()
					->select('*')
					->from('employee_transaction emp')
					->join('employee_info emp_info', 'emp_info.employee_id = emp.employee_transaction_employee_id')
					->leftJoin('employee_address add', 'add.employee_address_id = emp.employee_transaction_emp_address_id')

					->where($query.' emp.employee_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
		Yii::import('application.extensions.tcpdf.*');
		require_once('tcpdf/tcpdf.php');
		require_once('tcpdf/config/lang/eng.php');
		
		$html = $this->renderPartial('emp_report_view_pdf', array(
			'emp_data'=>$employee_data, 
			'selected_emp_list'=>$selected_list,
		), true);
		
		ob_clean();
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('EmployeeList Report');
		$pdf->SetSubject('EmployeeList Report');
		$pdf->SetKeywords('example, text, report');
		$pdf->SetHeaderData('', 0, "Employee Info Report", '');
		//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Example Report by ".Yii::app()->name, "");
		$pdf->setHeaderFont(Array('helvetica', '', 8));
		$pdf->setFooterFont(Array('helvetica', '', 6));
		$pdf->SetMargins(15, 18, 15);
		$pdf->SetHeaderMargin(5);
		$pdf->SetFooterMargin(10);
		$pdf->SetAutoPageBreak(TRUE, 15);
		$pdf->SetFont('dejavusans', '', 7);
		
		$resolution= array(150, 150);
		$pdf->AddPage('P', $resolution);
		
		$pdf->writeHTML($html, true, false, true, false, '');
		$pdf->LastPage();
		$pdf->Output("EmployeeInfoReport.pdf", "I");
	
		}
		else if(!empty($_REQUEST['employeelistexcelexport']))
		{
		$query= $_SESSION['query'];
		$selected_list=$_SESSION['selected_list'];
		$employee_data =Yii::app()->db->createCommand()
					->select('*')
					->from('employee_transaction emp')
					->join('employee_info emp_info', 'emp_info.employee_id = emp.employee_transaction_employee_id')
					->leftJoin('employee_address add', 'add.employee_address_id = emp.employee_transaction_emp_address_id')

					->where($query.' emp.employee_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
		 Yii::app()->request->sendFile(date('YmdHis').'.xlsx',
			    $this->renderPartial('emp_report_view_excel', array(
				'emp_data'=>$employee_data, 
				'selected_emp_list'=>$selected_list,
			    ), true)
			);
		}		
		else
		{		
		$query=$_POST['query'];
		$selected_list=null;
		}
		
		$baseUrl = Yii::app()->baseUrl; 
  		$cs = Yii::app()->getClientScript();
  		$cs->registerCssFile($baseUrl.'/css/report.css');					
	}

	//By Ravi Bhalodiya


	public function actionStudenthistory()
	{
		if(!empty($_POST['roll_no']) || !empty($_POST['en_no']) || !empty($_REQUEST['id']))
		{
			
			if(!empty($_POST['en_no']))
				$str = 'stud_info.student_enroll_no='.$_POST['en_no'];
			if(!empty($_POST['roll_no']))
				$str = 'stud_info.student_roll_no='.$_POST['roll_no'];
			if(!empty($_REQUEST['id']))
				$str = 'stud_info.student_info_transaction_id ='.$_REQUEST['id'];
		

			$stud_trans= Yii::app()->db->createCommand()
					->select('*')
					->from('student_transaction stud')
					->join('student_info stud_info', 'stud_info.student_id = stud.student_transaction_student_id')
					->where($str.' and stud.student_transaction_organization_id='.Yii::app()->user->getState('org_id'))
					->queryAll();
			if(empty($stud_trans))
			{
				Yii::app()->user->setFlash('no-student-found',"No Student Found.");
				$this->redirect(array('studenthistory'));
			}
			
			$transaction_id= $stud_trans[0]['student_transaction_id'];
		
			$stud_archive = StudentArchiveTable::model()->findAll(array('condition'=>'student_archive_stud_tran_id='.$transaction_id));
				
			$this->render('student_history_view',
					array(
						'stud_archive'=>$stud_archive,
						'stud_trans'=>$stud_trans,
					)
			);		
			
		}
		else
		$this->render('student_history');	
	}

     protected function performAjaxValidation($model)
     {
		if(isset($_POST['ajax']) && ($_POST['ajax']==='document-search' || $_POST['ajax']==='document-search-emp' || $_POST['ajax']==='emp-id-card' || $_POST['ajax']==='stu-id-card'))
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
    }
}
