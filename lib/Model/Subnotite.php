<?php
class Model_Subnotite extends Model_Table {
	public $table="subnotite";
	function init(){
		parent::init();

		$this->addField('nume')->mandatory('Introduceti numele sprintului');
		$this->addField('estimare');
		$this->addField('Finalizare')->hidden('true');
		$this->addField('Utilitate')->hidden('true');
		$this->addField('is_used')->hidden('true');
		$this->addField('is_done')->hidden('true');
		$this->hasOne('User',null,'first_name');
	}
}