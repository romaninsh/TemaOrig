<?php
class page_story extends Page {
	function init(){
		parent::init();
		$page=$this;
		$m=$this->add('Model_Proiect');
		$m->addCondition('realizare','1');
		//$m->debug();
		$nume= $m->loadAny()->get('nume');

		$this->add('View_Warning')->set('Povestile de mai jos sunt pentru proiectul: ' .$nume)
								  ->addclose('true');

		if(($this->api->auth->model['is_po']) || ($this->api->auth->model['is_scrum']))		
		//if user= Product owner or Scrum master, he/she can modify these records or even state that they're fixed
		{
			$g = $page->add('gridext/CRUD_Extended');
			$g->setModel('story');
			if($g->grid) {
				$g->grid->addPaginator(4);
				$g->grid->getColumn('Prioritate')->makeSortable();
				$g->grid->getColumn('Estimare')->makeSortable();
			}
		}
		else
		{
			$g = $page->add('Grid');
			$g->setModel('story');
			$g->addPaginator(4);
			$g->getColumn('Prioritate')->makeSortable();
			$g->getColumn('Estimare')->makeSortable();
			
		}
	}
}