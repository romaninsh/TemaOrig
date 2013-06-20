<?php
class page_proiect_Proiecte_realizate extends Page {
	function init(){
		parent::init();
		$this->api->stickyGET('id');
		$au=$this->add('Model_User')->load($_GET['id']);
		//$au->addCondition('id',$_GET['id']);
		//$la=$au->ref('Proiect');
		$la=$this->add('CRUD');
		$la->setModel($au->ref('Proiect'));
		$la->dq->limit(5);

		//$crud = $this->add('CRUD');
		//$crud->setModel($la);


		/*if($crud->grid){

			$crud->grid->addColumn('button','found','Mark as Found');

			if($_GET['found']){
				$crud->model->load($_GET['found']);

				$crud->model->markAsFound();

				$crud->js(null,$crud->grid->js()->reload())
				->univ()->alert('Success')->execute();
			}
		}*/

	}
}