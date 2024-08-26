<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once (APPPATH . "controllers/secureRegions/Main.php");
class Video_Module extends Main
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
    $this->load->model('administrator/media/Video_Model');

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
    $this->load->view('admin/media/Video_Module/list', $this->data);
    parent::get_footer();
  }

  function video_list()
  {




    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
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
    $data_count = $this->Video_Model->get_video($search);
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


    $this->data['video_data'] = $this->Video_Model->get_video($search);




    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Video_Module/video_list', $this->data);
    parent::get_footer();
  }

  function video_doUpdateStatus()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
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
        $response = $this->Common_Model->update_operation(array('table' => "video", 'data' => $update_data, 'condition' => "video_id in ($ids)"));
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

  function video_view($video_id = "")
  {


    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($video_id)) {
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



    $this->data['video_data'] = $this->Video_Model->get_video(array("video_id" => $video_id, "details" => 1));



    //if there is no data for given video_id show page not found page
    if (empty($this->data['video_data'])) {
      REDIRECT(MAINSITE_Admin . "wam/page_not_found");
      exit;
    }


    if (empty($video_id)) {
      $alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
			aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
      $this->session->set_flashdata('alert_message', $alert_message);

      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
      exit;
    }

    $this->data['video_data'] = $this->data['video_data'][0];



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Video_Module/video_view', $this->data);
    parent::get_footer();
  }


  function video_add()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
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




    // $this->data['video_data'] = $this->Video_Model->get_video(array("order_by" => "position"));


    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Video_Module/video_add', $this->data);
    parent::get_footer();
  }

  function video_edit($video_id = "")
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }




    if (!empty($video_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }

    // $this->data['page_is_master'] = $this->data['user_access']->is_master;
    // $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;


    if (!empty($video_id)) {
      $this->data['video_data'] = $this->Video_Model->get_video(array("video_id" => $video_id, "details" => 1));

      if (empty($this->data['video_data'])) {

        $this->session->set_flashdata('alert_message', '<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fas fa-ban"></i> Record Not Found. 
				  </div>');
        REDIRECT(MAINSITE_Admin . $user_access->class_name . '/' . $user_access->function_name);
      }
      $this->data['video_data'] = $this->data['video_data'][0];
    }



    parent::get_header();
    parent::get_left_nav();
    $this->load->view('admin/media/Video_Module/video_edit', $this->data);
    parent::get_footer();
  }



  function videoDoEdit()
  {




    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
    $user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));



    $video_id = $_POST['video_id'];


    if (empty($this->data['user_access'])) {
      REDIRECT(MAINSITE_Admin . "wam/access-denied");
    }

    if (empty($video_id)) {
      if ($user_access->add_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }


    if (!empty($video_id)) {
      if ($user_access->update_module != 1) {
        $this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
        REDIRECT(MAINSITE_Admin . "wam/access-denied");
      }
    }




    if (!empty($video_id)) {
      $enter_data['position'] = trim($_POST['position']);
      $enter_data['file_title'] = trim($_POST['file_title']);
      $enter_data['file'] = trim($_POST['file']);
      $enter_data['status'] = trim($_POST['status']);
      $enter_data['updated_on'] = date("Y-m-d H:i:s");
      $enter_data['updated_by'] = $this->data['session_uid'];

      $insertStatus = $this->Common_Model->update_operation(array('table' => 'video', 'data' => $enter_data, 'condition' => "video_id = $video_id"));
      if (!empty($insertStatus)) {
        $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" 
				aria-hidden="true">×</button><i class="icon fas fa-check"></i> Record Updated Successfully </div>';

      }

    } else {

      $this->upload_multi_texts_video();
      $alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-check"></i> New Record Added Successfully </div>';

    }







    $this->session->set_flashdata('alert_message', $alert_message);

    if (!empty($_POST['redirect_type'])) {
      REDIRECT(MAINSITE_Admin . $user_access->class_name . "/vedio-edit");
    }

    REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
  }














  public function addNewLine_video()
  {
    if (!empty($_POST['append_id_video'])) {
      $this->data['append_id_video'] = $_POST['append_id_video'];
    }
    $template = $this->load->view('admin/media/Video_Module/template/text_line_add_more_video', $this->data, true);
    echo json_encode(array("template" => $template));
  }











  function upload_multi_texts_video()
  {

    $table_name = "video ";
    $count = 0;
    if (!empty($_POST["file_video"])) {



      $position = $_POST["position_video"];
      $file_title = $_POST["file_title_video"];
      $file = $_POST["file_video"];
      $status = $_POST["status_video"];
      for ($i = 0; $i < count($_POST["file_video"]); $i++) {
        if (isset($_POST["file_video"][$i]) && !empty($_POST["file_video"][$i])) {

          $enter_data["position"] = $position[$i];
          $enter_data["file_title"] = $file_title[$i];
          $enter_data["file"] = $file[$i];
          $enter_data["status"] = $status[$i];
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



  function video_list_export()
  {
    $this->data['page_type'] = "list";
    $this->data['page_module_id'] = 199;
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

    $this->data['video_data'] = $this->Video_Model->get_video($search);


    $this->load->view('admin/media/Video_Module/video_list_export', $this->data);
  }









  function upload_video_file($video_id)
  {
    $logo_file_name = "";
    $count = 0;
    if (!empty($_FILES["file"]['name'])) {
      if (!is_dir(_uploaded_temp_files_ . 'video_file')) {
        mkdir('./' . _uploaded_temp_files_ . 'video_file', 0777, TRUE);
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
          $timage_name_new = $temp_var[0] . '_' . $video_id . '_' . $count . "." . $timage_ext;
          //$timage_name_new = "file_".$quotation_enquiry_id.'_'.$count.".".$timage_ext; 
          $img_data['file_title'] = $file_title[$i];
          $img_data['video_id'] = $video_id;
          $img_data['file_name'] = $timage_name_new;
          $imginsertStatus = $this->Common_Model->add_operation(array('table' => 'admin_user_file', 'data' => $img_data));
          if ($imginsertStatus > 0) {
            move_uploaded_file($_FILES['file']['tmp_name'][$i], _uploaded_temp_files_ . "video_file/" . $timage_name_new);
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
