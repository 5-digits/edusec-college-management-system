<?php
$this->breadcrumbs=array(
	'Registrations'=>array('index'),
	$model->register_id,
);

$this->menu=array(
	array('label'=>'List Registration', 'url'=>array('index')),
	array('label'=>'Create Registration', 'url'=>array('create')),
	array('label'=>'Update Registration', 'url'=>array('update', 'id'=>$model->register_id)),
	array('label'=>'Delete Registration', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->register_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Registration', 'url'=>array('admin')),
);
?>

<h1>View Registration #<?php echo $model->register_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'register_id',
		'first_name',
		'last_name',
		'email',
		'country_code',
		'mobile',
	),
)); ?>
