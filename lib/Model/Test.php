<?php
class Model_Test extends Model_Table {
	public $table="test";
	function init(){
		parent::init();

		$this->addField('name');
		$this->addField('surname');
		$this->addField('gender');
	}

}