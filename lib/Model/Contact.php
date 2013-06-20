<?php
class Model_Contact extends Model_Table {
	public $table="contact";
	function init(){
		parent::init();

		$this->addField('nume')->mandatory('Introduceti numele dumneavoastra');
		$this->addField('email')->mandatory('Trebuie Email');
		$this->addField('telefon');
		$this->addField('companie');
		$this->addField('detalii')->mandatory('Detalii?');
		//->editable(false);
	
	    $this->addHook('beforeSave',function($m){
        $m['email']=strtolower($m['email']);
        });
	}

}