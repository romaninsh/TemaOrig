<?php
class page_proiect extends Page {
	function init(){
		parent::init();

		$m=$this->add('Model_User');
		$m->addCondition('is_po','1');
		//$m->debug();
		$nume= $m->loadAny()->get('full_name');

		$this->add('View_Hint')->setTitle('Proiect curent in colaborare cu: '.$nume)
								->set('');

		$g=$this->add('Grid');
		$g->setModel('proiect',array('nume'));
		$g->dq->where('realizare','1');

		$this->add('View_Info')->set('Proiecte viitoare')
								->addclose('true');
		$model = $this->add('Model_User');
		if($this->api->auth->model['is_po']==1)
		{
			$c=$this->add('CRUD');
			$c->setModel('proiect',array('nume'));
			$c->dq->where('realizare','0');
		}
		else
		{
			$c=$this->add('Grid');
			$c->setModel('proiect');
			$c->dq->where('realizare','0');
		}
	}
}