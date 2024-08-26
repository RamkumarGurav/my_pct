<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once (APPPATH . "controllers/secureRegions/Main.php");
class Gallery_Module extends Main
{

  function __construct()
  {
    parent::__construct();

    //db
    $this->load->database();

    //libraries
    $this->load->library('session');
    $this->load->library('pagination');
    $this->load->library('User_auth');

    //helpers
    $this->load->helper('url');

    //models
    $this->load->model('Common_Model');
    $this->load->model('administrator/Admin_Common_Model');
    $this->load->model('administrator/Admin_model');
    $this->load->model('administrator/media/Gallery_Model');

    //session data
    $session_uid = $this->data['session_uid'] = $this->session->userdata('sess_psts_uid');
    $this->data['session_name'] = $this->session->userdata('sess_psts_name');
    $this->data['session_email'] = $this->session->userdata('sess_psts_email');


    //admin status
    $this->data['User_auth_obj'] = new User_auth();
    $this->data['user_data'] = $this->data['User_auth_obj']->check_user_status();

    //headers
    $this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
    $this->output->set_header("Pragma: no-cache");

  }


  /****************************************************************
   *HELPERS
   ****************************************************************/

  function unset_only()
  {
    $user_data = $this->session->all_userdata();
    foreach ($user_data as $key => $value) {
      if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
        $this->session->unset_userdata($key);
      }
    }
  }

  /****************************************************************
   ****************************************************************/


  function index()
  {


    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Gallery_Module/list', $this->data);
    parent::get_footer();
  }

  function gallery_list()
  {



    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }


    $search = array();
    $field_name = '';
    $field_value = '';
    $end_date = '';
    $start_date = '';
    $record_status = "";



    if (!empty($_REQUEST['field_name']))
      $field_name = $_POST['field_name'];
    else if (!empty($field_name))
      $field_name = $field_name;

    if (!empty($_REQUEST['field_value']))
      $field_value = $_POST['field_value'];
    else if (!empty($field_value))
      $field_value = $field_value;

    if (!empty($_POST['end_date']))
      $end_date = $_POST['end_date'];

    if (!empty($_POST['start_date']))
      $start_date = $_POST['start_date'];

    if (!empty($_POST['record_status']))
      $record_status = $_POST['record_status'];


    //this is useful to retian values inside search panel after selecting country or any other options
    $this->data['field_name'] = $field_name;
    $this->data['field_value'] = $field_value;
    $this->data['end_date'] = $end_date;
    $this->data['start_date'] = $start_date;
    $this->data['record_status'] = $record_status;


    $search['end_date'] = $end_date;
    $search['start_date'] = $start_date;
    $search['field_value'] = $field_value;
    $search['field_name'] = $field_name;
    $search['record_status'] = $record_status;
    $search['search_for'] = "count";


    //getting count
    $data_count = $this->Gallery_Model->get_gallery($search);
    $r_count = $this->data['row_count'] = $data_count[0]->counts;


    //deleting count parameter
    unset($search['search_for']);

    $offset = (int) $this->uri->segment(5); //echo $offset;
    if ($offset == "") {
      $offset = '0';
    }

    $per_page = _all_pagination_;

    $this->load->library('pagination');
    $config['base_url'] = MAINSITE_Admin . $this->data['user_access']->class_name . '/' . $this->data['user_access']->function_name . '/';
    $config['total_rows'] = $r_count;
    $config['uri_segment'] = '5';
    $config['per_page'] = $per_page;
    $config['num_links'] = 4;
    $config['first_link'] = '&lsaquo; First';
    $config['last_link'] = 'Last &rsaquo;';
    $config['prev_link'] = 'Prev';
    $config['full_tag_open'] = '<p>';
    $config['full_tag_close'] = '</p>';
    $config['attributes'] = array('class' => 'paginationClass');


    $this->pagination->initialize($config);

    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;

    $search['details'] = 1;

    $search['limit'] = $per_page;
    $search['offset'] = $offset;


    $this->data['gallery_data'] = $this->Gallery_Model->get_gallery($search);




    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Gallery_Module/gallery_list', $this->data);
    parent::get_footer();
  }

  function gallery_doUpdateStatus()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));
    //print_r($this->data['user_access']);
    $task = $_POST['task'];
    $id_arr = $_POST['sel_recds'];
    if (empty($user_access)) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }
    if ($user_access->update_module == 1) {
      $this->session->set_flashdata('alert_message', '<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fas fa-ban"></i> Something Went Wrong Please Try Again. 
				  </div>');
      $update_data = array();
      if (!empty($id_arr)) {
        $action_taken = "";
        $ids = implode(',', $id_arr);
        if ($task == "active") {
          $update_data['status'] = 1;
          $action_taken = "Activate";
        }
        if ($task == "block") {
          $update_data['status'] = 0;
          $action_taken = "Blocked";
        }
        $update_data['updated_on'] = date("Y-m-d H:i:s");
        $update_data['updated_by'] = $this->data['session_uid'];
        $response = $this->Common_Model->update_operation(array('table' => "gallery", 'data' => $update_data, 'condition' => "gallery_id in ($ids)"));
        if ($response) {
          $this->session->set_flashdata('alert_message', '<div class="alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						<i class="icon fas fa-check"></i> Records Successfully ' . $action_taken . ' 
						</div>');
        }
      }
      REDIRECT(MAINSITE_Admin . $user_access->class_name . '/' . $user_access->function_name);
    } else {
      $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }
  }

  function gallery_view($gallery_id = "")
  {


    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($gallery_id)) {
      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close"
			 data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
      $this->session->set_flashdata('alert_message', $alert_message);
      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
      exit;
    }


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }


    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;



    $this->data['gallery_data'] = $this->Gallery_Model->get_gallery(array("gallery_id" => $gallery_id, "details" => 1));



    //if there is no data for given gallery_id show page not found page
    if (empty($this->data['gallery_data'])) {
      REDIRECT(MAINSITE_Admin . "wam/page_not_found");
      exit;
    }


    if (empty($gallery_id)) {
      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
			aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
      $this->session->set_flashdata('alert_message', $alert_message);

      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
      exit;
    }

    $this->data['gallery_data'] = $this->data['gallery_data'][0];



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Gallery_Module/gallery_view', $this->data);
    parent::get_footer();
  }


  function gallery_add()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if ($user_access->add_module != 1) {
      $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }



    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;




    $this->data['gallery_data'] = $this->Gallery_Model->get_gallery(array("order_by" => "position"));


    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Gallery_Module/gallery_add', $this->data);
    parent::get_footer();
  }

  function gallery_edit($gallery_id = "")
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }




    if (!empty($gallery_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }

    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;


    if (!empty($gallery_id)) {
      $this->data['gallery_data'] = $this->Gallery_Model->get_gallery(array("gallery_id" => $gallery_id, "details" => 1));

      if (empty($this->data['gallery_data'])) {

        $this->session->set_flashdata('alert_message', '<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fas fa-ban"></i> Record Not Found. 
				  </div>');
        REDIRECT(MAINSITE_Admin . $user_access->class_name . '/' . $user_access->function_name);
      }
      $this->data['gallery_data'] = $this->data['gallery_data'][0];
    }



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Gallery_Module/gallery_edit', $this->data);
    parent::get_footer();
  }



  function galleryDoEdit()
  {






    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));






    $gallery_id = $_POST['gallery_id'];


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if (empty($gallery_id)) {
      if ($user_access->add_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }


    if (!empty($gallery_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }



    if (!empty($gallery_id)) {
      $enter_data['position'] = trim($_POST['position']);
      $enter_data['file_title'] = trim($_POST['file_title']);
      $enter_data['status'] = trim($_POST['status']);
      $enter_data['updated_on'] = date("Y-m-d H:i:s");
      $enter_data['updated_by'] = $this->data['session_uid'];

      $insertStatus = $this->Common_Model->update_operation(array('table' => 'gallery', 'data' => $enter_data, 'condition' => "gallery_id = $gallery_id"));
      if (!empty($insertStatus)) {
        $this->upload_any_image("gallery", "gallery_id", $gallery_id, "file", "file", "main_gallery_", "main_gallery");
        $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
				aria-hidden="true">×</button><i class="icon fas fa-check"></i> Record Updated Successfully </div>';
      }

    } else {

      $this->upload_multi_files_gallery();
      $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-check"></i> New Record Added Successfully </div>';

    }







    $this->session->set_flashdata('alert_message', $alert_message);

    if (!empty($_POST['redirect_type'])) {
      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/gallery-edit");
    }

    REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
  }





  function upload_any_image($table_name, $id_column, $id, $input_name, $target_column, $prefix, $target_folder_name)
  {
    $file_name = "";
    if (isset($_FILES[$input_name]['name'])) {
      $timg_name = $_FILES[$input_name]['name'];
      if (!empty($timg_name)) {
        $temp_var = explode(".", strtolower($timg_name));
        $timage_ext = end($temp_var);
        $timage_name_new = $prefix . $id . "." . $timage_ext;
        $image_enter_data[$target_column] = $timage_name_new;
        $imginsertStatus = $this->Common_Model->update_operation(array('table' => $table_name, 'data' => $image_enter_data, 'condition' => "$id_column = $id"));
        if ($imginsertStatus == 1) {
          if (!is_dir(_uploaded_temp_files_ . $target_folder_name)) {
            mkdir(_uploaded_temp_files_ . './' . $target_folder_name, 0777, TRUE);

          }
          move_uploaded_file($_FILES["$input_name"]['tmp_name'], _uploaded_temp_files_ . $target_folder_name . "/" . $timage_name_new);
          $file_name = $timage_name_new;
        }

      }
    }
  }








  public function addNewLine_gallery()
  {
    if (!empty($_POST['append_id_gallery'])) {
      $this->data['append_id_gallery'] = $_POST['append_id_gallery'];
    }
    $template = $this->load->view('admin/media/Gallery_Module/template/file_line_add_more_gallery', $this->data, true);
    echo json_encode(array("template" => $template));
  }








  function upload_multi_files_gallery()
  {
    $table_name = "gallery";
    $idp_column = "gallery_id";
    $prefix = "main_gallery_";
    $target_folder_name = "main_gallery";
    $logo_file_name = "";
    $count = 0;

    if (!empty($_FILES["file_gallery"]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . $target_folder_name)) {
        mkdir('./' . _uploaded_temp_files_ . $target_folder_name, 0777, TRUE);
      }

      $position = $_POST["position_gallery"];
      $file_title = $_POST["file_title_gallery"];
      $status = $_POST["status_gallery"];
      for ($i = 0; $i < count($_FILES["file_gallery"]['name']); $i++) {
        if (isset($_FILES["file_gallery"]['name'][$i]) && !empty($_FILES["file_gallery"]['name'][$i])) {

          $img_data["position"] = $position[$i];
          $img_data["file_title"] = $file_title[$i];
          $img_data["status"] = $status[$i];
          $img_data['added_on'] = date("Y-m-d H:i:s");
          $img_data['added_by'] = $this->data['session_uid'];
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $img_data));

          $count++;

          $timg_name = $_FILES["file_gallery"]['name'][$i];
          $temp_var = explode(".", strtolower($timg_name));
          $timage_ext = end($temp_var);
          $timage_name_new = $prefix . $idp . "." . $timage_ext;
          $update_img_data["file"] = $timage_name_new;
          $idp = $this->Common_Model->update_operation(array('table' => $table_name, 'data' => $update_img_data, 'condition' => "$idp_column = $idp"));
          if ($idp > 0) {
            move_uploaded_file($_FILES["file_gallery"]['tmp_name'][$i], _uploaded_temp_files_ . $target_folder_name . "/" . $timage_name_new);
            $logo_file_name = $timage_name_new;
          }
        }
      }
    }
  }


  function upload_multi_texts_plan($idf)
  {
    $table_name = "gallery_plan ";
    $idf_column = "gallery_id";
    $input_text_name1 = "day_number_plan";
    $target_text_column1 = "day_number";
    $input_text_name2 = "day_name_plan";
    $target_text_column2 = "day_name";
    $input_text_name3 = "day_plan_plan";
    $target_text_column3 = "day_plan";
    $count = 0;
    if (!empty($_POST[$input_text_name2])) {


      $input1 = $_POST[$input_text_name1];
      $input2 = $_POST[$input_text_name2];
      $input3 = $_POST[$input_text_name3];
      for ($i = 0; $i < count($_POST[$input_text_name2]); $i++) {
        if (isset($_POST[$input_text_name2][$i]) && !empty($_POST[$input_text_name2][$i])) {

          $enter_data[$target_text_column1] = $input1[$i];
          $enter_data[$target_text_column2] = $input2[$i];
          $enter_data[$target_text_column3] = $input3[$i];
          $enter_data[$idf_column] = $idf;
          $enter_data['added_on'] = date("Y-m-d H:i:s");
          $enter_data['added_by'] = $this->data['session_uid'];
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $enter_data));
          $count++;
        }
      }
    }
  }

  ////////////////////////////////////

  function upload_multi_any_files($table_name, $idp_column, $idf_column, $idf, $input_file_name, $input_text_name, $target_file_column, $target_text_column, $prefix, $target_folder_name)
  {
    $logo_file_name = "";
    $count = 0;
    if (!empty($_FILES[$input_file_name]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . $target_folder_name)) {
        mkdir('./' . _uploaded_temp_files_ . $target_folder_name, 0777, TRUE);
      }

      $file_title = $_POST[$input_text_name];
      for ($i = 0; $i < count($_FILES[$input_file_name]['name']); $i++) {
        if (isset($_FILES[$input_file_name]['name'][$i]) && !empty($_FILES[$input_file_name]['name'][$i])) {

          $img_data[$target_text_column] = $file_title[$i];
          $img_data[$idf_column] = $idf;
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $img_data));
          $count++;
          $timg_name = $_FILES[$input_file_name]['name'][$i];
          $temp_var = explode(".", strtolower($timg_name));
          $timage_ext = end($temp_var);
          $timage_name_new = $prefix . $idp . "." . $timage_ext;
          $update_img_data[$target_file_column] = $timage_name_new;
          $idp = $this->Common_Model->update_operation(array('table' => $table_name, 'data' => $update_img_data, 'condition' => "$idp_column = $idp"));
          if ($idp > 0) {
            move_uploaded_file($_FILES['file']['tmp_name'][$i], _uploaded_temp_files_ . $target_folder_name . "/" . $timage_name_new);
            $logo_file_name = $timage_name_new;
          }
        }
      }
    }
  }



  function gallery_list_export()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 198;
    $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));
    //print_r($this->data['user_access']);
    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if ($this->data['user_access']->export_data != 1) {
      $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Export " . $user_access->module_name);
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }
    $search = array();
    $field_name = '';
    $field_value = '';
    $end_date = '';
    $start_date = '';
    $record_status = "";
    $country_id = "";
    $state_id = "";

    if (!empty($_REQUEST['field_name']))
      $field_name = $_POST['field_name'];
    else if (!empty($field_name))
      $field_name = $field_name;

    if (!empty($_REQUEST['field_value']))
      $field_value = $_POST['field_value'];
    else if (!empty($field_value))
      $field_value = $field_value;

    if (!empty($_POST['end_date']))
      $end_date = $_POST['end_date'];

    if (!empty($_POST['start_date']))
      $start_date = $_POST['start_date'];

    if (!empty($_POST['record_status']))
      $record_status = $_POST['record_status'];

    if (!empty($_POST['country_id']))
      $country_id = $_POST['country_id'];

    if (!empty($_POST['state_id']))
      $state_id = $_POST['state_id'];


    $this->data['field_name'] = $field_name;
    $this->data['field_value'] = $field_value;
    $this->data['end_date'] = $end_date;
    $this->data['start_date'] = $start_date;
    $this->data['record_status'] = $record_status;
    $this->data['country_id'] = $country_id;
    $this->data['state_id'] = $state_id;

    $search['end_date'] = $end_date;
    $search['start_date'] = $start_date;
    $search['field_value'] = $field_value;
    $search['field_name'] = $field_name;
    $search['record_status'] = $record_status;
    $search['country_id'] = $country_id;
    $search['state_id'] = $state_id;
    $search['details'] = 1;

    $this->data['gallery_data'] = $this->Gallery_Model->get_gallery($search);


    $this->load->view('admin/media/Gallery_Module/gallery_list_export', $this->data);
  }









  function upload_gallery_file($gallery_id)
  {
    $logo_file_name = "";
    $count = 0;
    if (!empty($_FILES["file"]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . 'gallery_file')) {
        mkdir('./' . _uploaded_temp_files_ . 'gallery_file', 0777, TRUE);
      }

      $file_title = $_POST['file_title'];
      //echo count($_FILES["file"]['name']);
      for ($i = 0; $i < count($_FILES["file"]['name']); $i++) {
        if (isset($_FILES["file"]['name'][$i]) && !empty($_FILES["file"]['name'][$i])) {
          $count++;
          $timg_name = $_FILES['file']['name'][$i];
          $temp_var = explode(".", strtolower($timg_name));
          //$temp_count = rand(10,10000);
          $timage_ext = end($temp_var);
          $timage_name_new = $temp_var[0] . '_' . $gallery_id . '_' . $count . "." . $timage_ext;
          //$timage_name_new = "file_".$quotation_enquiry_id.'_'.$count.".".$timage_ext; 
          $img_data['file_title'] = $file_title[$i];
          $img_data['gallery_id'] = $gallery_id;
          $img_data['file_name'] = $timage_name_new;
          $imginsertStatus = $this->Common_Model->add_operation(array('table' => 'admin_user_file', 'data' => $img_data));
          if ($imginsertStatus > 0) {
            move_uploaded_file($_FILES['file']['tmp_name'][$i], _uploaded_temp_files_ . "gallery_file/" . $timage_name_new);
            $logo_file_name = $timage_name_new;
          }
        }
      }
    }
  }






  function logout()
  {
    $this->unset_only();
    $this->session->set_flashdata('alert_message', '<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		<i class="icon fas fa-check"></i> You Are Successfully Logout.
		</div>');
    $this->session->unset_userdata('sess_psts_uid');
    REDIRECT(MAINSITE_Admin . 'login');
  }



  public function index1()
  {
    $this->load->view('welcome_message');
  }

  function mypdf()
  {


    $this->load->library('pdf');


    $this->pdf->load_view('mypdf');
    $this->pdf->render();


    $this->pdf->stream("welcome.pdf");
  }


}
