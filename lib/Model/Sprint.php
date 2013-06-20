<?php
class Model_Sprint extends Model_Table {
	public $table="sprint";
	function init(){
		parent::init();

		$this->addField('Nume');
		$this->addField('DataIncepere');
		$this->addField('DataSfarsit');
	}

}