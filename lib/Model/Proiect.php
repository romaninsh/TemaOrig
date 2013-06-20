<?php
class Model_Proiect extends Model_Table {
	public $table="proiect";
	function init(){
		parent::init();

		$this->addField('nume')->mandatory('Introduceti numele proiectului');
		$this->addField('realizare')->editable(false);
		//$this->hasOne('User');
		
		//$this->hasMany('Issues');

	}
}