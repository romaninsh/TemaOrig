<?php
class page_index extends Page {
    function init(){
        parent::init();
        $page=$this;

        if($this->api->auth->isLoggedIn()){
            $this->add('View_Info')->set('Hello, '.$this->api->auth->model['first_name']);
        }

		$page->add('H3')->set('This site was made in order to satisfy the thesis which demanded a specialised application 
		that develops a software product using an Agile concept.');
		$page->add('H4')->set('The best framework found that resolved this requirement was Agile Toolkit.');
		$page->add('H4')->set('Agile Toolkit is used for creating powerful web applications. It is open source and currently
		on the 4.2.4 version.');
		$page->add('H4')->set('Many thanks to the Agile team for offering such a great product!');
       /* $form=$page->add('StylingForm');
        $form->addClass('stacked atk-row');
 
        $form->template->trySet('fieldset','span6');
        $sep=$form->addSeparator('span6');
        $form->add('Order')->move($sep,'before','age')->now();*/
    }
}
