<?php

class SiteController extends Controller
{
	public $attempts = 2; // allowed 2 attempts
	public $counter;
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CaptchaExtendedAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	public function filters()
	{
		return array(
			'blockuser + login', //check to ensure valid project context
		);
	}


	public function filterBlockuser($filterChain)
	{
		$reg_details = Registration::model()->count(); 
		if($reg_details == 0) {
			$this->redirect(array('registration/create'));
		}
		$count = User::model()->count();
		$org_count =  Organization::model()->count();
		if($org_count ==  0) {
			$this->redirect(array('site/welcome'));
		}
		/*if($org_count !=  0 &&  $count == 0) {
			$org_data = Yii::app()->db->createCommand()
                                ->select('organization_id')
                                ->from('organization')
                                ->queryRow();
			//print_r($org_data); exit;

			$this->redirect(array('createUser','id'=>$org_data['organization_id']));
		}*/

			$filterChain->run();
	}
	

	public function actionWelcome()
	{
		$reg_details = Registration::model()->count(); 
		if($reg_details == 0) {
			$this->redirect(array('registration/create'));
		}
		$org_count =  Organization::model()->count();
		if($org_count ==  0) {
			$this->redirect(array('site/createOrg'));
		}
		$this->layout='select_company_main';		
		$this->render('wel_come',array());
	}

	public function actionNewDashboard()
	{
		$this->layout='//layouts/dashboard_layout';
		 Yii::app()->getClientScript()->registerCssFile(yii::app()->request->baseUrl.'/css/newdashboard.css');
		if(Yii::app()->user->isGuest)
		{
			  Yii::app()->user->loginRequired();

		}
		else
		{
		  $this->render('newdashboard');
		}
	}

	public function actionCreateUser()
	{
		$this->layout='select_company_main';
		$model=new User;
		$ass_comp = new assignCompanyUserTable;
		//$model->setScenario('create');
		$auth_assign = new AuthAssignment;
		// Uncomment the following line if AJAX validation is needed
		 $this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			$model->user_password=md5($model->user_password.$model->user_password);
			$model->user_type='admin';
			$model->user_created_by=1;
			$model->user_creation_date=new CDbExpression('NOW()');
			$model->user_organization_id = $_REQUEST['id'];
			if($model->save())
			{
				$ass_comp->assign_user_id = $model->user_id;
				$ass_comp->assign_org_id = $_REQUEST['id'];
				$ass_comp->assign_created_by = $model->user_id;
				$ass_comp->assign_creation_date = new CDbExpression('NOW()');
				$ass_comp->save();

				$auth_assign->itemname = 'SuperAdmin';
				$auth_assign->userid = $model->user_id;
				$auth_assign->save(false); 
				$this->redirect(array('site/redirectLogin'));
			}
		}

		$this->render('create_user',array(
			'model'=>$model,
		));
	}

	public function actionRedirectLogin()
	{
		$this->layout='select_company_main';
		$this->render('redirect_login',array());
	}

	public function actionCreateOrg()
	{
		$reg_details = Registration::model()->count(); 
		if($reg_details == 0) {
			$this->redirect(array('registration/create'));
		}
		$this->layout='select_company_main';
		$model=new Organization;
		
		// Uncomment the following line if AJAX validation is needed
		 $this->performAjaxValidation($model);

		if(isset($_POST['Organization']['organization_name']) && !empty($_POST['Organization']['address_line1']) && !empty($_POST['Organization']['city']) && !empty($_POST['Organization']['state']) && !empty($_POST['Organization']['country']) && !empty($_POST['Organization']['pin']) && !empty($_POST['Organization']['phone']) && !empty($_POST['Organization']['no_of_semester']) && !empty($_POST['Organization']['email']))
		{
			$country_model = new Country;
			$country_model->name = $_POST['Organization']['country'];
			$country_model->save();

			$state_model = new State;
			$state_model->state_name = $_POST['Organization']['state'];
			$state_model->country_id = $country_model->id;
			$state_model->save();

			$city_model = new City;
			$city_model->city_name = $_POST['Organization']['city'];
			$city_model->country_id = $country_model->id;
			$city_model->state_id = $state_model->state_id;
			$city_model->save();

			$model->attributes=$_POST['Organization'];
			$model->organization_created_by=1;
			$model->organization_creation_date=new CDbExpression('NOW()');

			
			if(!empty($_FILES['Organization']['tmp_name']['logo']))
           	 	{
				
				$file = CUploadedFile::getInstance($model,'logo');
		
				//$model->filename = $file->name;
				$model->file_type = $file->type;
				
				$fp = fopen($file->tempName, 'r');
				$content = fread($fp, filesize($file->tempName));
				fclose($fp);
				$model->logo = $content;
            		}
			$model->city = $city_model->city_id;
			$model->state = $state_model->state_id;
			$model->country = $country_model->id;
			
			
			if($model->save(false))
				$this->redirect(array('site/redirectLogin'));
		}

		$this->render('create_org',array(
			'model'=>$model,
		));
	}


	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && ( $_POST['ajax']==='user-form' ||  $_POST['ajax']==='organization-form'))
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionloadImage($id)
    	{
        	$model=Organization::model()->findByPk($id);
       		$this->renderPartial('image', array(
            		'model'=>$model
        				));
    	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		if(Yii::app()->user->isGuest)
		{
			  Yii::app()->user->loginRequired();

		}
		else
		{
			$this->redirect(array('site/newdashboard'));										
		}
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}


	public function actionForgotpassword()
	{
		$this->layout='login_layout';
		$model = new LoginForm;
		if(isset($_POST['LoginForm'])) {
		   $model->attributes=$_POST['LoginForm'];
		   $user_id = User::model()->findByAttributes(array('user_organization_email_id'=>$model->username));
		   //var_dump($user_id); exit;
		   if(!empty($user_id)) {

		   $random = substr(number_format(time() * rand(),0,'',''),0,10);
		   $phone_no = 0;
		   
		   $check_user = StudentTransaction::model()->find('student_transaction_user_id ='.$user_id->user_id);
		   if(!empty($check_user))
		   $phone_no = StudentInfo::model()->findByPk($check_user->student_transaction_student_id)->student_mobile_no;

		   $check_user_emp = EmployeeTransaction::model()->find('employee_transaction_user_id ='.$user_id->user_id);
		   if(!empty($check_user_emp)) 
		   $phone_no = EmployeeInfo::model()->findByPk($check_user_emp->employee_transaction_employee_id)->employee_private_mobile;

		   if($phone_no != 0) { 
			
			$smsobj=new SmsApi;
			$org=$user_id->user_organization_id;
			$r=$smsobj->sendsms($phone_no,$random,$org);


		   if(preg_match('/alert_/',$r))
   		   { 
		     $update_user = User::model()->findByPk($user_id->user_id);
		     $update_user->user_password = md5($random.$random);
		     $update_user->save();
		     $this->redirect(array('smsNotification','status'=>'success'));
		   }
		   else
		     $this->redirect(array('smsNotification','status'=>'getway-error'));
		  }
		     $this->redirect(array('smsNotification','status'=>'user_not_exist'));
		}
		else
		     $this->redirect(array('smsNotification','status'=>'user_not_exist'));

		}
        	$this->render('forgotpassword', array('model'=>$model));
	}


	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
                
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$headers="From: {$model->email}\r\nReply-To: {$model->email}";
				mail(Yii::app()->params['adminEmail'],$model->subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */

	public function actionLogin()
	{	
		$this->layout='login_layout';
		if(Yii::app()->user->isGuest)
		{

			$login=new LoginUser;
			$model = $this->captchaRequired()? new LoginForm('captchaRequired') : new LoginForm;
				
			// if it is ajax validation request
			if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
			{
				echo CActiveForm::validate($model);
				Yii::app()->end();
			}

			// collect user input data
			if(isset($_POST['LoginForm']))
			{
				
				$model->attributes=$_POST['LoginForm'];
				//$login->attributes=$_POST['LoginUser'];
				// validate user input and redirect to the previous page if valid
				if($model->validate() && $model->login())
				{
					Yii::app()->user->setState('org_id',1);

					$loginuser = Yii::app()->user->id;
					$emplogin = EmployeeTransaction::model()->findByAttributes(array('employee_transaction_user_id'=>$loginuser));
					$studlogin = StudentTransaction::model()->findByAttributes(array('student_transaction_user_id'=>$loginuser));
					if($studlogin)
					{
						Yii::app()->user->setState('stud_id',$studlogin->student_transaction_id);
					}
					if($emplogin)
					{
						Yii::app()->user->setState('emp_id',$emplogin->employee_transaction_id);
					}

					$login->user_id = Yii::app()->user->id;
					$login->status=1;
					$login->log_in_time=new CDbExpression('NOW()');
					$login->user_ip_address=$_SERVER['REMOTE_ADDR'];
					$login->login_organization_id=Yii::app()->user->getState('org_id');
					$login->save();
					$this->redirect(array('site/newdashboard'));
				}
				else
				{
					 $this->counter=Yii::app()->session->itemAt('captchaRequired') + 1;
					 Yii::app()->session->add('captchaRequired',$this->counter);
				}

			}
					
			// display the login form
					
			
			$this->render('login',array('model'=>$model));

		}
		else
		{
			if(Yii::app()->user->getState('org_id') != NULL)
				$this->redirect(array('site/newdashboard'));
			else {
				Yii::app()->user->logout();	
				$this->redirect(Yii::app()->homeUrl);	
			}
				
		}
		
	}
	public function captchaRequired()
        {           
               return Yii::app()->session->itemAt('captchaRequired') >= $this->attempts;
		//return ($this->counter >= $this->attempts);
        }

	public function actionLogout()
	{
		if(isset(Yii::app()->user->id))
		LoginUser::model()->updateAll(array( 'status' => 0, 'log_out_time'=> new CDbExpression('NOW()')),'user_id='.Yii::app()->user->id.' AND status = 1');	
		//Yii::app()->session->destroy();
		Yii::app()->user->logout();		
		$this->redirect(Yii::app()->homeUrl);

	}
}
