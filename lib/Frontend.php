<?php
class Frontend extends ApiFrontend {
    function init(){
        parent::init();
        $this->dbConnect();
        $this->requires('atk','4.2.0');
        $this->add('jUI');

        $this->pathfinder->addLocation('/',array(
            'addons'=>array('my-addons','ambient-addons','atk4-addons'),
			'js'=>array(
						 'templates/js',
						 'misc/templates/js'
            ),
			'template'=> array(
                'tree/templates/default'
            )))
           ->setParent($this->pathfinder->base_location)
           ->setRelativePath('/');  
		   
		   $this->pathfinder->addLocation('.',array('addons'=>'ds-addons'));    
		
		$this->add("cms/Controller_Cms");
        $this->add('Auth')
        ->setModel('User');
        $this->auth->allowPage(array('index'));  

		if($this->auth->isLoggedIn()){
		$this->add('menu/Menu_Dropdown',null,'Menu')
		->setType('horizontal')
		->setPosition('left')
		->addMenuItem('index','Welcome')
		->addMenuItem('proiect','Project Planning')
		->sub()
				->addMenuItem('proiect','Current Project')
				->addMenuItem('story','Story')
				->addMenuItem('issues','Issues')	
		->end()
        ->addMenuItem('test2','Sprint Planning')
		->sub()
			->addMenuItem('test2','Sprint Backlog')
			->addMenuItem('subnotes','Manage Notes')
			->addMenuItem('test','Sprint Schedule')
			->addMenuItem('mypage','Sprint Tracking')	
			
		->end()
		->addMenuItem('user','Current User')
		->sub()
			->addMenuItem('vizUseri','Team Members')
			->addMenuItem('user','Preferences')
			->addMenuItem('progress','Work in Progress')
		->end()
		->addMenuItem('log','Log')
        ->addMenuItem('logout','Logout');
		
		/*$is_po = $this->api->auth->model['is_po'];
			if($is_po)
			{
				$this->add('menu/Menu_Dropdown',null,'Menu')
		->setType('horizontal')	// horizontal|vertical (optional)
		->setPosition('right')	// left|right (optional)
		->addMenuItem('index','Welcome')
		->addMenuItem('index','Welcome')
		;
			}*/
		}else{
		$menu=$this->add('Menu',null,'Menu')
            ->addMenuItem('index','Welcome')
            ->addMenuItem('login');
		}
			
			
        $this->auth->check();
    } 
}
