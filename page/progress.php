<?php
class page_progress extends Page {
    function init(){
        parent::init();
        $page=$this;
		
        $this->add('View_Info')->set('Mister '.$this->api->auth->model['first_name'].' this is your current work so far:');

       /* $form=$page->add('StylingForm');
        $form->addClass('stacked atk-row');
 
        $form->template->trySet('fieldset','span6');
        $sep=$form->addSeparator('span6');
        $form->add('Order')->move($sep,'before','age')->now();*/
    }
}
