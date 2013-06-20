<?php

class page_contact extends Page{
	function init(){
		parent::init();

		$page=$this;

		$form=$page->add('Form');
		$model = $page->add('Model_Contact');
		//$model->addCondition('detalii','<=',5);
		$form->setModel($model);
		$form->getElement('detalii')->setFieldHint('Detaliile nu pot fi mai mari de 5 litere');
		$form->getElement('nume')->validateField('strlen($this->get())>=6','Nume prea scurt');
		$form->getElement('detalii')
    		->setAttr('maxlength',4);
		$form->addSubmit('Trimiteti acum');
		
        $form->addClass('stacked atk-row');
        $form->template->trySet('fieldset','span6');
        $sep=$form->addSeparator('span6');
        $form->add('Order')->move($sep,'before','companie')->now();

        if ($form->isSubmitted()) {
			$form->update();
                    $this->js()->univ()->successMessage('Multumim pentru timpul dumneavoastra!')
                            ->execute();
		}
	}
}
