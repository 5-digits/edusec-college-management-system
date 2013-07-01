<?php
$this->breadcrumbs=array(
	'Branch Wise Receipt Generation',
	
);
?>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'fees-payment-transaction-form',
	'enableAjaxValidation'=>true,
	
)); ?>

	<?php
	$acd = Yii::app()->db->createCommand()
		->select('*')
		->from('academic_term')
		->queryAll();
	$acdterm=CHtml::listData($acd,'academic_term_id','academic_term_name');	
	$pe_data = AcademicTermPeriod::model()->findByPk($acd[0]['academic_term_period_id']);
	$period[$pe_data->academic_terms_period_id] = $pe_data->academic_term_period; 

	?>
	<?php echo $form->errorSummary($model); ?>
<!--
	<p class="note">Fields with <span class="required">*</span> are required.</p>
-->
	<div class="row">
        <?php echo $form->labelEx($model,'fees_acdm_period'); ?>
        
	<?php
			echo $form->dropDownList($model,'fees_acdm_period',$period,array('tabindex'=>1)); 
			 
			?><span class="status">&nbsp;</span>
        <?php echo $form->error($model,'fees_acdm_period'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fees_acdm_name'); ?>
	        <?php //echo $form->dropDownList($model,'student_academic_term_name_id',array()); ?>
		<?php 
			echo $form->dropDownList($model,'fees_acdm_name',$acdterm,array('prompt' => 'Select Semester','tabindex'=>2)); 
		?><span class="status">&nbsp;</span>
		<?php echo $form->error($model,'fees_acdm_name'); ?>
	</div>	

	<div class="row">
		<?php echo $form->labelEx($model,'fees_branch'); ?>
		<?php //echo $form->textField($model,'acdm_name_id'); ?>	
		<?php
			echo $form->dropDownList($model,'fees_branch',
				CHtml::listData(Branch::model()->findAll(),'branch_id','branch_name'),
				array(
				'prompt' => 'Select Branch','tabindex'=>3,
				'ajax' => array(
				'type'=>'POST', 
				'url'=>CController::createUrl('dependent/Branchreceiptdivision'),	 	
				'update'=>'#FeesPaymentTransaction_fees_division', //selector to update
				
				)));		 
		?><span class="status">&nbsp;</span>
		<?php echo $form->error($model,'fees_branch'); ?>
	</div>

	
	

	<div class="row">
		<?php echo $form->labelEx($model,'fees_division'); ?>
		<?php echo $form->dropDownList($model,'fees_division',array(),array('prompt' => 'Select Division','tabindex'=>4)); 
		?><span class="status">&nbsp;</span>
		<?php echo $form->error($model,'fees_division'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search', array('class'=>'submit','tabindex'=>5));
			//echo CHtml::button('search',array('class'=>'submit','submit'=>array('')); 
		?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

