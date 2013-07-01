<?php

class RegistrationController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/select_company_main';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create', 'test'),
				'users'=>array('*'),
			),
			
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Registration;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Registration']))
		{
			$model->attributes=$_POST['Registration'];
			if($model->save()) {
				$user = new User;
				$auth_assign = new AuthAssignment;
				$user->user_organization_email_id = $model->email;
				$user->user_password=md5($model->email.$model->email);
				$user->user_type='admin';
				$user->user_created_by=1;
				$user->user_creation_date=new CDbExpression('NOW()');
				$user->user_organization_id = 1;
				if($user->save())
				{
					$auth_assign->itemname = 'SuperAdmin';
					$auth_assign->userid = $user->user_id;
					$auth_assign->save(false); 
					$request_url = 'http://www.rudrasoftech.com/register-script.php?first_name='.$model->first_name.'&last_name='.$model->last_name.'&email='.$model->email.'&country_code='.$model->country_code.'&mobile='.$model->mobile;
		$response = $this->get_url($request_url);
					
				}
				
				$this->redirect(array('site/createOrg'));
			}
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Registration']))
		{
			$model->attributes=$_POST['Registration'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->register_id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Registration');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function get_url($request_url) {
	  $ch = curl_init();
	  curl_setopt($ch, CURLOPT_URL, $request_url);
	  curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	  $response = curl_exec($ch);
	  curl_close($ch);

	  return $response;
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Registration('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Registration']))
			$model->attributes=$_GET['Registration'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Registration::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='registration-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
