<?php
class Model_User extends Model_Table {
	public $table="user";
	function init(){
		parent::init();

		$this->addField('first_name')->mandatory('Enter first name');
		$this->addField('last_name')->mandatory('Enter last name');
		$this->addField('email')->mandatory('Email is required');
		$this->addField('password')->display(array('form'=>'password'))->mandatory('Type your password');
		
		$this->addExpression('full_name')->set('concat(first_name," ",last_name)');

		$this->addField('is_admin')->type('boolean');
		
		$this->addField('is_po')->type('boolean');

		$this->addField('is_scrum')->type('boolean');
		
		/*$this->add('filestore/Field_File','image_id');
		$this->addExpression('img_url')->set(function($m,$q){
			return $m->refSQL('image_id')->fieldQuery('url');

		});*/
		
		//->editable(false);
		
		$this->hasMany('Proiect');
		
		$this->hasMany('Story');
	
	    $this->addHook('beforeSave',function($m){
        $m['email']=strtolower($m['email']);
        });
	}

}