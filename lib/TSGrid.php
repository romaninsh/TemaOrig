<?php

class TSGrid extends Grid {

  function setReloadThis($view){

    if($id=$_GET[$this->name.'_chsex']){
     // do note, usually we supply 2 arguments for set() function. Second
     // argument is being properly quoted (or parametrized), however in this
     // case no quoting is required. Hence all the statement goes into first 
        // argument.
      $this->dq
         ->set('gender', $this->api->db->dsql()->expr('if(gender="M","F","M")'))
         ->where('id',$id)
         ->do_update();

     // univ()->page() method updates page content through AJAX. In this case each
     // grid is unaware of other objects on the page. So to keep it safe, we will refresh
     // page completely.
      $view->js()->reload()->execute();
    }


      return $this;
  }

  function init(){
    parent::init();
    $g=$this;

    // When you are making your own classes, you must always keep in mind
    // that those objects must be just as re-usable as original grids. In our case
    // we do set the table and fields, however we leave it up to parent to set the
    // additional conditions on our query. This is a major reason for the philosophy
    // of Agile Toolkit saying to keep properties public.

    $g->addColumn('text','name');
    $g->addColumn('text','surname');
    $g->addColumn('text','gender');
    $g->addColumn('button','chsex','Change Sex');
    $g->setModel('test');

  }
} 