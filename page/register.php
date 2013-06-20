<?php

class page_register extends Page {

    function init() {
        parent::init();
			
        // Local variables
        $form = $this->add('Form');
        $model = $this->add('Model_User');
		
		//daca un user simplu incearca sa invite alti useri
		if($this->api->auth->model['is_po']==0)
		{
			 $this->api->redirect('/');
		}

        // Form fields from the table user 
        $form->setModel($model, array('first_name', 'last_name', 'email'));
        $form->addField('password', 'password_1', 'Password');
        $form->addField('password', 'password_2', 'Password');
		
		$model->set('id_po',$this->api->auth->model->id);
	
        $this->api->auth->addEncryptionHook($model);

        // Form submit button
        $form->addSubmit('Register');

        // If form is submitted
        if ($form->isSubmitted()) {

            // Check if password fields are not empty
            if ($form->get('password_1') <> "" | $form->get('password_2') <> "") {

                // Check if passwords match
                if ($form->get('password_1') != $form->get('password_2')) {

                    $form->displayError('password_2', 'Passwords does not match');
                } else { // if match do (below):
                    // Set password into table
                    $model->set('password', $form->get('password_1'));
					
					//$model->set('id_po', var_dump($GET_['id']));

                    // Set created date into table
                    // TODO - missing
                   // $model->debug();
        
                    // Insert into database			
                    $form->update();
                    $this->js()->univ()->successMessage('User registered with success')
                            ->execute();
                }
            } else { // If password fields are empty
                $form->displayError('password_2', 'Please enter a password');
            }
        }
    }

}

?>