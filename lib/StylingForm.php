<?php

class StylingForm extends Form {
    function init(){
        parent::init();
        $f=$this;

        $f->addField('line','name')->validateNotNull()
            ->setFieldHint('Click "Register" to see error');
        $f->addField('line','email')
            ->validateNotNull()
            ->validateField('filter_var($this->get(), FILTER_VALIDATE_EMAIL)')
            ;

        $f->addField('password','password')->validateNotNull()
            ->setProperty('max-length',30)->setFieldHint('30 characters maximum');

        $p2=$f->addField('password','password2')
            ->validateField('$this->get()==$this->owner->getElement("password")->get()',
                    'Passwords do not match');




        $f->addField('DatePicker','date_birth','Birthdate');

        $f->addField('dropdown','age')
            ->setValueList(array('','11 - 20', '21 - 30', '31 - 40'));

        $f->addField('text','about')
            ->setProperty('cols',45)->setProperty('rows','5')
            ->validateField('5000>=strlen($this->get())','Too long');

        $f->addField('Radio','sex')
            ->setValueList(array('m'=>'Male','f'=>'Female'))
            ;  // automatically validated to be one of value list



        $f->addField('checkbox','agreeRules','I Agree to Rules and Terms'
                )->validateNotNull('You must agree to the rules');


        $js=array();
        $this->js()->atk4_form('fieldError','password2','Passwords do not match');
        $this->js()->atk4_form('fieldError','age','Age is not entered - sample longer error which may span');
        $this->js()->atk4_form('fieldError','about','Sample error on textarea field');


        $f->addSubmit('Submit')->js('click');
    }
}