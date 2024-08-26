<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once (APPPATH . "controllers/secureRegions/Main.php");
class Di_Tour_Module extends Main
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
    $this->load->model('administrator/catalog/Di_Tour_Model');

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
    $this->load->view('admin/catalog/Di_Tour_Module/list', $this->data);
    parent::get_footer();
  }



  function di_tour_list()
  {




    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
    $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }


    $search = array();
    $di_tour_variant = "";
    $field_name = '';
    $field_value = '';
    $end_date = '';
    $start_date = '';
    $record_status = "";

    if (!empty($_POST['di_tour_variant']))
      $di_tour_variant = $_POST['di_tour_variant'];

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
    $this->data['di_tour_variant'] = $di_tour_variant;
    $this->data['field_name'] = $field_name;
    $this->data['field_value'] = $field_value;
    $this->data['end_date'] = $end_date;
    $this->data['start_date'] = $start_date;
    $this->data['record_status'] = $record_status;


    $search['di_tour_variant'] = $di_tour_variant;
    $search['end_date'] = $end_date;
    $search['start_date'] = $start_date;
    $search['field_value'] = $field_value;
    $search['field_name'] = $field_name;
    $search['record_status'] = $record_status;
    $search['search_for'] = "count";


    //getting count
    $data_count = $this->Di_Tour_Model->get_di_tour($search);
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


    $this->data['di_tour_data'] = $this->Di_Tour_Model->get_di_tour($search);




    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/catalog/Di_Tour_Module/di_tour_list', $this->data);
    parent::get_footer();
  }


  function di_tour_doUpdateStatus()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
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
        $response = $this->Common_Model->update_operation(array('table' => "di_tour", 'data' => $update_data, 'condition' => "di_tour_id in ($ids)"));

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


  function di_tour_view($di_tour_id = "")
  {


    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($di_tour_id)) {
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



    $this->data['di_tour_data'] = $this->Di_Tour_Model->get_di_tour(array("di_tour_id" => $di_tour_id, "details" => 1));



    //if there is no data for given di_tour_id show page not found page
    if (empty($this->data['di_tour_data'])) {
      REDIRECT(MAINSITE_Admin . "wam/page_not_found");
      exit;
    }


    if (empty($di_tour_id)) {
      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
			aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
      $this->session->set_flashdata('alert_message', $alert_message);

      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
      exit;
    }

    $this->data['di_tour_data'] = $this->data['di_tour_data'][0];



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/catalog/Di_Tour_Module/di_tour_view', $this->data);
    parent::get_footer();
  }


  function di_tour_edit($di_tour_id = "")
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if (empty($di_tour_id)) {
      if ($user_access->add_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }

    if (!empty($di_tour_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }

    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;


    if (!empty($di_tour_id)) {
      $this->data['di_tour_data'] = $this->Di_Tour_Model->get_di_tour(array("di_tour_id" => $di_tour_id, "details" => 1));

      if (empty($this->data['di_tour_data'])) {

        $this->session->set_flashdata('alert_message', '<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fas fa-ban"></i> Record Not Found. 
				  </div>');
        REDIRECT(MAINSITE_Admin . $user_access->class_name . '/' . $user_access->function_name);
      }
      $this->data['di_tour_data'] = $this->data['di_tour_data'][0];
    }



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/catalog/Di_Tour_Module/di_tour_edit', $this->data);
    parent::get_footer();
  }


  function diTourDoEdit()
  {


    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));




    if (
      empty($_POST['name']) && empty($_POST['di_tour_variant']) && empty($_POST['description']) && empty($_POST['location']) && empty($_POST['google_map_address']) && empty($_POST['google_map_url'])
      && empty($_POST['minimum_age']) && empty($_POST['tour_type']) && empty($_POST['actual_price'])
    ) {
      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" 
			class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i>
			Something Went Wrong. Please Try Again.</div>';
      $this->session->set_flashdata('alert_message', $alert_message);
      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
      exit;
    }

    $di_tour_id = $_POST['di_tour_id'];

    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if (empty($di_tour_id)) {
      if ($user_access->add_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }


    if (!empty($di_tour_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }

    $name = trim($_POST['name']);
    $di_tour_variant = trim($_POST['di_tour_variant']);
    $duration_day = trim($_POST['duration_day']);
    $duration_night = trim($_POST['duration_night']);
    // $available_slots = trim($_POST['available_slots']);
    $is_discount = trim($_POST['is_discount']);
    $actual_price = trim($_POST['actual_price']);
    $discounted_price = trim($_POST['discounted_price']);
    $minimum_age = trim($_POST['minimum_age']);
    $tour_type = trim($_POST['tour_type']);
    $location = trim($_POST['location']);
    $google_map_address = trim($_POST['google_map_address']);
    $google_map_url = trim($_POST['google_map_url']);
    $description = $_POST['description'];
    $inclusion = $_POST['inclusion'];
    $exclusion = $_POST['exclusion'];
    $important_notes = $_POST['important_notes'];
    $additional_info = $_POST['additional_info'];
    $status = trim($_POST['status']);

    $is_exist = $this->Common_Model->getData(
      array(
        'select' => '*',
        'from' => 'di_tour',
        'where' => "name = '$name' and di_tour_id != $di_tour_id"
      )
    );





    if (!empty($is_exist)) {

      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
			aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Upcoming Tour already exist in database.</div>';

      $this->session->set_flashdata('alert_message', $alert_message);

      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/di-tour-edit/" . $di_tour_id);
      exit;
    }

    $enter_data['name'] = $name;
    $enter_data['di_tour_variant'] = $di_tour_variant;
    $enter_data['duration_day'] = $duration_day;
    $enter_data['duration_night'] = $duration_night;
    // $enter_data['available_slots'] = $available_slots;
    $enter_data['is_discount'] = $is_discount;
    $enter_data['actual_price'] = $actual_price;
    $enter_data['discounted_price'] = $discounted_price;
    $enter_data['minimum_age'] = $minimum_age;
    $enter_data['tour_type'] = $tour_type;
    $enter_data['location'] = $location;
    $enter_data['google_map_address'] = $google_map_address;
    $enter_data['google_map_url'] = $google_map_url;
    $enter_data['description'] = $description;
    $enter_data['inclusion'] = $inclusion;
    $enter_data['exclusion'] = $exclusion;
    $enter_data['important_notes'] = $important_notes;
    $enter_data['additional_info'] = $additional_info;
    $enter_data['status'] = $status;



    $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert"
     aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong Please Try Again. </div>';
    if (!empty($di_tour_id)) {
      $enter_data['updated_on'] = date("Y-m-d H:i:s");
      $enter_data['updated_by'] = $this->data['session_uid'];

      $insertStatus = $this->Common_Model->update_operation(array('table' => 'di_tour', 'data' => $enter_data, 'condition' => "di_tour_id = $di_tour_id"));
      if (!empty($insertStatus)) {
        $this->upload_any_image("di_tour", "di_tour_id", $di_tour_id, "banner_image", "banner_image", "di_tour_banner_image_", "di_tour_banner_image");
        $this->upload_any_image("di_tour", "di_tour_id", $di_tour_id, "cover_image", "cover_image", "di_tour_cover_image_", "di_tour_cover_image");
        $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
				aria-hidden="true">×</button><i class="icon fas fa-check"></i> Record Updated Successfully </div>';
      }

    } else {
      $enter_data['added_on'] = date("Y-m-d H:i:s");
      $enter_data['added_by'] = $this->data['session_uid'];

      $di_tour_id = $insertStatus = $this->Common_Model->add_operation(array('table' => "di_tour", 'data' => $enter_data));
      if (!empty($insertStatus)) {
        $this->upload_any_image("di_tour", "di_tour_id", $di_tour_id, "banner_image", "banner_image", "di_tour_banner_image_", "di_tour_banner_image");
        $this->upload_any_image("di_tour", "di_tour_id", $di_tour_id, "cover_image", "cover_image", "di_tour_cover_image_", "di_tour_cover_image");
        $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-check"></i> New Record Added Successfully </div>';
      }
    }


    if ($insertStatus > 0) { // Checking if $insertStatus is greater than 0 (indicating successful insertion)
      $this->upload_multi_files_carousel($di_tour_id);
      $this->upload_multi_files_gallery($di_tour_id);
      $this->upload_multi_texts_ttc($di_tour_id);
      $this->upload_multi_texts_plan($di_tour_id);

    }


    $this->session->set_flashdata('alert_message', $alert_message);

    if (!empty($_POST['redirect_type'])) {
      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/di-tour-edit");
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


  public function addNewLine_carousel()
  {
    if (!empty($_POST['append_id_carousel'])) {
      $this->data['append_id_carousel'] = $_POST['append_id_carousel'];
    }
    $template = $this->load->view('admin/catalog/Di_Tour_Module/template/file_line_add_more_carousel', $this->data, true);
    echo json_encode(array("template" => $template));
  }

  public function addNewLine_gallery()
  {
    if (!empty($_POST['append_id_gallery'])) {
      $this->data['append_id_gallery'] = $_POST['append_id_gallery'];
    }
    $template = $this->load->view('admin/catalog/Di_Tour_Module/template/file_line_add_more_gallery', $this->data, true);
    echo json_encode(array("template" => $template));
  }

  public function addNewLine_ttc()
  {
    if (!empty($_POST['append_id_ttc'])) {
      $this->data['append_id_ttc'] = $_POST['append_id_ttc'];
    }
    $template = $this->load->view('admin/catalog/Di_Tour_Module/template/text_line_add_more_ttc', $this->data, true);
    echo json_encode(array("template" => $template));
  }

  public function addNewLine_tdate()
  {
    if (!empty($_POST['append_id_tdate'])) {
      $this->data['append_id_tdate'] = $_POST['append_id_tdate'];
    }
    $template = $this->load->view('admin/catalog/Di_Tour_Module/template/text_line_add_more_tdate', $this->data, true);
    echo json_encode(array("template" => $template));
  }

  public function addNewLine_plan()
  {
    if (!empty($_POST['append_id_plan'])) {
      $this->data['append_id_plan'] = $_POST['append_id_plan'];
    }
    $template = $this->load->view('admin/catalog/Di_Tour_Module/template/text_line_add_more_plan', $this->data, true);
    echo json_encode(array("template" => $template));
  }





  function upload_multi_files_carousel($idf)
  {
    $table_name = "di_tour_carousel_image";
    $idp_column = "di_tour_carousel_image_id";
    $idf_column = "di_tour_id";
    $input_file_name = "file_carousel";
    $input_text_name = "position_carousel";
    $target_file_column = "file";
    $target_text_column = "position";
    $prefix = "di_tour_carousel_image_";
    $target_folder_name = "di_tour_carousel_image";
    $logo_file_name = "";
    $count = 0;

    if (!empty($_FILES[$input_file_name]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . $target_folder_name)) {
        mkdir('./' . _uploaded_temp_files_ . $target_folder_name, 0777, TRUE);
      }

      $file_title2 = $_POST[$input_text_name];
      for ($i = 0; $i < count($_FILES[$input_file_name]['name']); $i++) {
        if (isset($_FILES[$input_file_name]['name'][$i]) && !empty($_FILES[$input_file_name]['name'][$i])) {

          $img_data[$target_text_column] = $file_title2[$i];
          $img_data[$idf_column] = $idf;
          $img_data['added_on'] = date("Y-m-d H:i:s");
          $img_data['added_by'] = $this->data['session_uid'];
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $img_data));

          $count++;

          $timg_name = $_FILES[$input_file_name]['name'][$i];
          $temp_var = explode(".", strtolower($timg_name));
          $timage_ext = end($temp_var);
          $timage_name_new = $prefix . $idp . "." . $timage_ext;
          $update_img_data[$target_file_column] = $timage_name_new;
          $idp = $this->Common_Model->update_operation(array('table' => $table_name, 'data' => $update_img_data, 'condition' => "$idp_column = $idp"));
          if ($idp > 0) {
            move_uploaded_file($_FILES[$input_file_name]['tmp_name'][$i], _uploaded_temp_files_ . $target_folder_name . "/" . $timage_name_new);
            $logo_file_name = $timage_name_new;
          }
        }
      }
    }
  }

  function upload_multi_files_gallery($idf)
  {
    $table_name = "di_tour_gallery_image";
    $idp_column = "di_tour_gallery_image_id";
    $idf_column = "di_tour_id";
    $input_file_name = "file_gallery";
    $input_text_name = "position_gallery";
    $target_file_column = "file";
    $target_text_column = "position";
    $prefix = "di_tour_gallery_image_";
    $target_folder_name = "di_tour_gallery_image";
    $logo_file_name = "";
    $count = 0;

    if (!empty($_FILES[$input_file_name]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . $target_folder_name)) {
        mkdir('./' . _uploaded_temp_files_ . $target_folder_name, 0777, TRUE);
      }

      $file_title2 = $_POST[$input_text_name];
      for ($i = 0; $i < count($_FILES[$input_file_name]['name']); $i++) {
        if (isset($_FILES[$input_file_name]['name'][$i]) && !empty($_FILES[$input_file_name]['name'][$i])) {

          $img_data[$target_text_column] = $file_title2[$i];
          $img_data[$idf_column] = $idf;
          $img_data['added_on'] = date("Y-m-d H:i:s");
          $img_data['added_by'] = $this->data['session_uid'];
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $img_data));

          $count++;

          $timg_name = $_FILES[$input_file_name]['name'][$i];
          $temp_var = explode(".", strtolower($timg_name));
          $timage_ext = end($temp_var);
          $timage_name_new = $prefix . $idp . "." . $timage_ext;
          $update_img_data[$target_file_column] = $timage_name_new;
          $idp = $this->Common_Model->update_operation(array('table' => $table_name, 'data' => $update_img_data, 'condition' => "$idp_column = $idp"));
          if ($idp > 0) {
            move_uploaded_file($_FILES[$input_file_name]['tmp_name'][$i], _uploaded_temp_files_ . $target_folder_name . "/" . $timage_name_new);
            $logo_file_name = $timage_name_new;
          }
        }
      }
    }
  }


  function upload_multi_texts_ttc($idf)
  {
    $table_name = "di_tour_things_to_carry";
    $idf_column = "di_tour_id";
    $input_text_name = "name_ttc";
    $target_text_column = "name";
    $count = 0;
    if (!empty($_POST[$input_text_name])) {


      $file_title = $_POST[$input_text_name];
      for ($i = 0; $i < count($_POST[$input_text_name]); $i++) {
        if (isset($_POST[$input_text_name][$i]) && !empty($_POST[$input_text_name][$i])) {

          $enter_data[$target_text_column] = $file_title[$i];
          $enter_data[$idf_column] = $idf;
          $enter_data['added_on'] = date("Y-m-d H:i:s");
          $enter_data['added_by'] = $this->data['session_uid'];
          $idp = $this->Common_Model->add_operation(array('table' => $table_name, 'data' => $enter_data));
          $count++;
        }
      }
    }
  }
  function upload_multi_texts_plan($idf)
  {
    $table_name = "di_tour_plan";
    $idf_column = "di_tour_id";
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



  function di_tour_list_export()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 201;
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

    $this->data['di_tour_data'] = $this->Di_Tour_Model->get_di_tour($search);


    $this->load->view('admin/catalog/Di_Tour_Module/tour_list_export', $this->data);
  }









  function upload_tour_file($di_tour_id)
  {
    $logo_file_name = "";
    $count = 0;
    if (!empty($_FILES["file"]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . 'tour_file')) {
        mkdir('./' . _uploaded_temp_files_ . 'tour_file', 0777, TRUE);
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
          $timage_name_new = $temp_var[0] . '_' . $di_tour_id . '_' . $count . "." . $timage_ext;
          //$timage_name_new = "file_".$quotation_enquiry_id.'_'.$count.".".$timage_ext; 
          $img_data['file_title'] = $file_title[$i];
          $img_data['di_tour_id'] = $di_tour_id;
          $img_data['file_name'] = $timage_name_new;
          $imginsertStatus = $this->Common_Model->add_operation(array('table' => 'admin_user_file', 'data' => $img_data));
          if ($imginsertStatus > 0) {
            move_uploaded_file($_FILES['file']['tmp_name'][$i], _uploaded_temp_files_ . "tour_file/" . $timage_name_new);
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
