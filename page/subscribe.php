<?php

class page_subscribe extends Page{
	function init(){
		parent::init();

		$page=$this;

		$div=$page->add('HtmlElement')
    	->setStyle('padding','4px');

		$div->add('HtmlElement')
    	->setElement('img')
    	->setAttr('src',$this->api->locateURL('template','images/subscribe.png'))
    	->set('');


		$page->add('H4')->set('Subscribe catre Proiectul de licenta pentru o posibila alta versiune!');
		$form=$page->add('Form');
		$form->setModel('Contact',array('nume','email'));
		$form->getElement('nume')->validateField('strlen($this->get())>=6','Nume prea scurt');
		$form->addSubmit('Trimiteti acum');
		

        if ($form->isSubmitted()) {
			$form->update();
                    $this->js()->univ()->successMessage('Va vom trimite informatii! Promitem!')
                            ->execute();
		}
	}
}
