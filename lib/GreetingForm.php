<?php

class GreetingForm extends Form {
    function init(){
        parent::init();
        $this->addField('line','name')->validateNotNull();
        $this->addSubmit('Greet');
        if($this->isSubmitted()){
            $this->js()->univ()->alert('Hello, '.$this->get('first_name'))->execute();
        }
    }
}

