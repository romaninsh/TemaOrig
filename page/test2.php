<?php

class page_test2 extends Page{
	function init(){
		parent::init();

		$page=$this;
		
		$tabs = $this->add('Tabs');

		$tab = $tabs->addTab('Sprint Numarul 1');

		$user_crud=$tab->add('CRUD');
		$user_crud->setModel('SprintBacklog')
			->addCondition('nrSprint','1');
		if($user_crud->grid)$user_crud->grid->addClass('zebra bordered');

		$tab = $tabs->addTab('Sprint Numarul 2');
		$tab->add('CRUD')->setModel('SprintBacklog')
			->addCondition('nrSprint','2');

		$tab = $tabs->addTab('Sprint Numarul 3');
		$tab->add('CRUD')->setModel('SprintBacklog')
			->addCondition('nrSprint','3');
		
		
			
		// Urmeaza Backlog Sprint	
		
		$g = $page->add('gridext/Grid_Extended');
		$g->setModel('Story');
		$g->addActionToolbar();
		$g->addPaginator(4);
		$g->addQuickSearch(array('Nume'));
		
		$form=$page->add('Form');
		//$form->addSeparator();
		
		
	}
}
