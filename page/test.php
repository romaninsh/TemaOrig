<?php
// This class splits page into even parts. Every time you call addColumn it returns
// a new object. You can then use that object to add additional elements in there. 
// In our example we are actually creating quite complicated structure:
//     
class page_test extends Page {
	  function init(){
        parent::init();
        $p=$this;  
        $c=$p->add('View_Columns');

        $col=$c->addColumn();
        $col->add('H3')->set('Male list');
        $col->add('TSGrid')
            ->setReloadThis($c)
            ->dq
            ->where('gender','M');

        $col=$c->addColumn();
        $col->add('H3')->set('Female list');
        $col->add('TSGrid')
            ->setReloadThis($c)
            ->dq
        ->where('gender','F');
    }

}
