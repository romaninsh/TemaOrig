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

		$menu = $this->add('menu/Menu_Dropdown',null,'Menu');
        $menu
		->setType('horizontal')
		->setPosition('left')
		->addMenuItem('index','Welcome');


        $menu
		->addMenuItem('proiect','Project Planning')
		->sub()
				->addMenuItem('proiect','Current Project')
				->addMenuItem('story','Story')
				->addMenuItem('issues','Issues')	
		->end();


        // DEMO - how you can add menu only if admin
        if($this->auth->model['is_admin']){

            $menu
                ->addMenuItem('test2','Sprint Planning')
                ->sub()
                ->addMenuItem('test2','Sprint Backlog')
                ->addMenuItem('subnotes','Manage Notes')
                ->addMenuItem('test','Sprint Schedule')
                ->addMenuItem('mypage','Sprint Tracking')	
            ->end();
        }
			

        $menu
		->addMenuItem('user','Current User')
		->sub()
			->addMenuItem('vizUseri','Team Members')
			->addMenuItem('user','Preferences')
			->addMenuItem('progress','Work in Progress')
		->end();

        $menu
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


        // DEMO: Secondary Menu
		$menu = $this->add('Menu',null,'Menu2');

        $menu->addMenuItem('test');
        $fm = $menu->addSubMenu('Submenu >');
        $fm->addMenuItem('test2');
        $fm->addMenuItem('test3');
        $fm->addMenuItem('test4');
            












		}else{
		$menu=$this->add('Menu',null,'Menu')
            ->addMenuItem('index','Welcome')
            ->addMenuItem('login');
		}
			
			
        $this->auth->check();
    } 
}
