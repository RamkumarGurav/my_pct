<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once (APPPATH . "controllers/secureRegions/Main.php");
class Di_Tour_Booking_Enquiry_Module extends Main
{

	function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->library('session');
		$this->load->model('Common_Model');
		$this->load->model('administrator/Admin_Common_Model');
		$this->load->model('administrator/Admin_model');
		$this->load->model('administrator/booking/Di_Tour_Booking_Enquiry_Model');
		$this->load->library('pagination');

		$this->load->library('User_auth');

		$session_uid = $this->data['session_uid'] = $this->session->userdata('sess_psts_uid');
		$this->data['session_name'] = $this->session->userdata('sess_psts_name');
		$this->data['session_email'] = $this->session->userdata('sess_psts_email');

		$this->load->helper('url');

		$this->data['User_auth_obj'] = new User_auth();
		$this->data['user_data'] = $this->data['User_auth_obj']->check_user_status();

		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
		$this->output->set_header("Pragma: no-cache");

		$this->data['page_module_id'] = 202;
	}

	function unset_only()
	{
		$user_data = $this->session->all_userdata();
		foreach ($user_data as $key => $value) {
			if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
				$this->session->unset_userdata($key);
			}
		}
	}

	function index()
	{


		parent::get_header();
		parent::get_left_nav();
		$this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/listings', $this->data);
		parent::get_footer();
	}

	function listings()
	{



		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 202;
		$this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));
		//print_r($this->data['user_access']);
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

		$data_count = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry($search);
		$r_count = $this->data['row_count'] = $data_count[0]->counts;

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
		$this->data['di_tour_booking_enquiry_data'] = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry($search);




		parent::get_header();
		parent::get_left_nav();
		$this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/listings', $this->data);
		parent::get_footer();
	}

	function view($di_tour_booking_enquiry_id = "")
	{





		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 202;
		$user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));

		if (empty($di_tour_booking_enquiry_id)) {
			$alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
			$this->session->set_flashdata('alert_message', $alert_message);
			REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
			exit;
		}
		if (empty($this->data['user_access'])) {
			REDIRECT(MAINSITE_Admin . "wam/access-denied");
		}


		// $this->data['page_is_master'] = $this->data['user_access']->is_master;
		// $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;

		$this->data['di_tour_booking_enquiry_data'] = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry(array("di_tour_booking_enquiry_id" => $di_tour_booking_enquiry_id, "details" => 1));
		if (empty($di_tour_booking_enquiry_id)) {
			$alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. </div>';
			$this->session->set_flashdata('alert_message', $alert_message);
			REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
			exit;
		}

		$this->data['di_tour_booking_enquiry_data'] = $this->data['di_tour_booking_enquiry_data'][0];




		parent::get_header();
		parent::get_left_nav();
		$this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/view', $this->data);
		parent::get_footer();
	}




	function edit($di_tour_booking_enquiry_id = "")
	{



		$this->data['page_type'] = "list";
		$user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));
		//print_r($this->data['user_access']);
		if (empty($this->data['user_access'])) {
			REDIRECT(MAINSITE_Admin . "wam/access-denied");
		}
		if (empty($di_tour_booking_enquiry_id)) {
			if ($user_access->add_module != 1) {
				$this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
				REDIRECT(MAINSITE_Admin . "wam/access-denied");
			}
		}

		if (!empty($di_tour_booking_enquiry_id)) {
			if ($user_access->update_module != 1) {
				$this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
				REDIRECT(MAINSITE_Admin . "wam/access-denied");
			}
		}




		// $this->data['page_is_master'] = $this->data['user_access']->is_master;
		// $this->data['page_parent_module_id'] = $this->data['user_access']->parent_module_id;

		if (!empty($di_tour_booking_enquiry_id)) {
			$this->data['di_tour_booking_enquiry_data'] = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry(array("di_tour_booking_enquiry_id" => $di_tour_booking_enquiry_id, "details" => 1));
			if (empty($this->data['di_tour_booking_enquiry_data'])) {
				$this->session->set_flashdata('alert_message', '<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fas fa-ban"></i> Record Not Found. 
				  </div>');
				REDIRECT(MAINSITE_Admin . $user_access->class_name . '/' . $user_access->function_name);
			}
			$this->data['di_tour_booking_enquiry_data'] = $this->data['di_tour_booking_enquiry_data'][0];
			$di_tour_id = $this->data['di_tour_booking_enquiry_data']->di_tour_id;
			$this->data['tour_date_data'] = $this->Common_Model->getData(array('select' => '*', 'from' => 'tour_date', 'where' => "di_tour_id = $di_tour_id"));
		}


		parent::get_header();
		parent::get_left_nav();
		$this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/edit', $this->data);
		parent::get_footer();
	}

	function doEdit()
	{
		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 202;
		$user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));

		if (empty($_POST['enquiry_date']) && empty($_POST['name']) && empty($_POST['email']) && empty($_POST['contactno']) && empty($_POST['subject']) && empty($_POST['description'])) {
			$alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong. Please Try Again. anubhav</div>';
			$this->session->set_flashdata('alert_message', $alert_message);
			REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
			exit;
		}
		$di_tour_booking_enquiry_id = $_POST['di_tour_booking_enquiry_id'];

		//print_r($_POST);
		if (empty($this->data['user_access'])) {
			REDIRECT(MAINSITE_Admin . "wam/access-denied");
		}
		if (empty($di_tour_booking_enquiry_id)) {
			if ($user_access->add_module != 1) {
				$this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Add " . $user_access->module_name);
				REDIRECT(MAINSITE_Admin . "wam/access-denied");
			}
		}
		if (!empty($di_tour_booking_enquiry_id)) {
			if ($user_access->update_module != 1) {
				$this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Update " . $user_access->module_name);
				REDIRECT(MAINSITE_Admin . "wam/access-denied");
			}
		}

		$added_on = $_POST['enquiry_date'];
		$name = $_POST['name'];
		$email = $_POST['email'];
		$contactno = $_POST['contactno'];
		$subject = $_POST['subject'];
		$description = $_POST['description'];
		//$receipt_no = $_POST['receipt_no'];
		$status = $_POST['status'];



		$enter_data['name'] = trim($_POST['name']);
		$enter_data['di_tour_id'] = trim($_POST['di_tour_id']);
		$enter_data['tour_date_id'] = trim($_POST['tour_date_id']);
		$enter_data['email'] = trim($_POST['email']);
		$enter_data['contactno'] = trim($_POST['contactno']);
		$enter_data['subject'] = trim($_POST['subject']);
		$enter_data['description'] = trim($_POST['description']);
		//$enter_data['receipt_no'] = trim($_POST['receipt_no']);
		$enter_data['status'] = trim($_POST['status']);
		$alert_message = '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-ban"></i> Something Went Wrong Please Try Again. </div>';
		if (!empty($di_tour_booking_enquiry_id)) {
			$enter_data['updated_on'] = date("Y-m-d H:i:s");
			$enter_data['updated_by'] = $this->data['session_uid'];
			$insertStatus = $this->Common_Model->update_operation(array('table' => 'di_tour_booking_enquiry', 'data' => $enter_data, 'condition' => "di_tour_booking_enquiry_id = $di_tour_booking_enquiry_id"));
			if (!empty($insertStatus)) {
				$alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-check"></i> Record Updated Successfully </div>';
			}

		} else {
			$enter_data['added_on'] = date("Y-m-d H:i:s");
			$di_tour_booking_enquiry_id = $insertStatus = $this->Common_Model->add_operation(array('table' => 'di_tour_booking_enquiry', 'data' => $enter_data));
			if (!empty($insertStatus)) {
				$alert_message = '<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><i class="icon fas fa-check"></i> New Record Added Successfully </div>';
			}
		}
		$this->session->set_flashdata('alert_message', $alert_message);

		if (!empty($_POST['redirect_type'])) {
			REDIRECT(MAINSITE_Admin . $user_access->class_name . "/edit");
		}

		REDIRECT(MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name);
	}

	function doUpdateStatus()
	{
		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 202;
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
				$response = $this->Common_Model->update_operation(array('table' => "di_tour_booking_enquiry", 'data' => $update_data, 'condition' => "di_tour_booking_enquiry_id in ($ids)"));
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


	function ajax_insert_tourget_di_tour_booking_enquiry()
	{




		$enter_data['name'] = trim($_POST['name']);
		$enter_data['contactno'] = trim($_POST['contactno']);
		$enter_data['email'] = trim($_POST['email']);
		$enter_data['subject'] = trim($_POST['subject']);
		$enter_data['description'] = trim($_POST['description']);
		$enter_data['di_tour_id'] = trim($_POST['di_tour_id']);
		$enter_data['tour_date_id'] = trim($_POST['tour_date_id']);
		$enter_data['status'] = 1;

		$enter_data['added_on'] = date("Y-m-d H:i:s");

		$enqui = $insertStatus = $this->Common_Model->add_operation(array('table' => 'di_tour_booking_enquiry', 'data' => $enter_data));


	}


	function export()
	{
		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 8;
		$user_access = $this->data['user_access'] = $this->data['User_auth_obj']->check_user_access(array("module_id" => $this->data['page_module_id']));
		//print_r($this->data['user_access']);
		if (empty($this->data['user_access'])) {
			REDIRECT(MAINSITE_Admin . "wam/access-denied");
		}

		if ($this->data['user_access']->export_data != 1) {
			$this->session->set_flashdata('no_access_flash_message', "You Are Not Allowed To Export " . $user_access->module_name);
			REDIRECT(MAINSITE_Admin . "wam/access-denied");
		}
		$search = array();
		$end_date = '';
		$start_date = '';
		$record_status = "";
		$customer_profile_id = "";
		$enquiry_mode = "";
		$admin_user_id = "";

		if (!empty($_POST['end_date']))
			$end_date = $_POST['end_date'];

		if (!empty($_POST['start_date']))
			$start_date = $_POST['start_date'];

		if (!empty($_POST['record_status']))
			$record_status = $_POST['record_status'];

		if (!empty($_POST['customer_profile_id']))
			$customer_profile_id = $_POST['customer_profile_id'];

		if (!empty($_POST['enquiry_mode']))
			$enquiry_mode = $_POST['enquiry_mode'];

		if (!empty($_POST['admin_user_id']))
			$admin_user_id = $_POST['admin_user_id'];

		$this->data['end_date'] = $end_date;
		$this->data['start_date'] = $start_date;
		$this->data['record_status'] = $record_status;
		$this->data['customer_profile_id'] = $customer_profile_id;
		$this->data['enquiry_mode'] = $enquiry_mode;
		$this->data['admin_user_id'] = $admin_user_id;

		$search['end_date'] = $end_date;
		$search['start_date'] = $start_date;
		$search['record_status'] = $record_status;
		$search['customer_profile_id'] = $customer_profile_id;
		$search['enquiry_mode'] = $enquiry_mode;
		$search['admin_user_id'] = $admin_user_id;
		$search['details'] = 1;

		$this->data['di_tour_booking_enquiry_data'] = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry($search);


		$this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/export', $this->data);
	}

	function pdf()
	{
		$this->load->library('pdf');

		$this->data['page_type'] = "list";
		$this->data['page_module_id'] = 8;
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
		$end_date = '';
		$start_date = '';
		$record_status = "";
		$customer_profile_id = "";
		$enquiry_mode = "";
		$admin_user_id = "";

		if (!empty($_POST['end_date']))
			$end_date = $_POST['end_date'];

		if (!empty($_POST['start_date']))
			$start_date = $_POST['start_date'];

		if (!empty($_POST['record_status']))
			$record_status = $_POST['record_status'];

		if (!empty($_POST['customer_profile_id']))
			$customer_profile_id = $_POST['customer_profile_id'];

		if (!empty($_POST['enquiry_mode']))
			$enquiry_mode = $_POST['enquiry_mode'];

		if (!empty($_POST['admin_user_id']))
			$admin_user_id = $_POST['admin_user_id'];

		$this->data['end_date'] = $end_date;
		$this->data['start_date'] = $start_date;
		$this->data['record_status'] = $record_status;
		$this->data['customer_profile_id'] = $customer_profile_id;
		$this->data['enquiry_mode'] = $enquiry_mode;
		$this->data['admin_user_id'] = $admin_user_id;

		$search['end_date'] = $end_date;
		$search['start_date'] = $start_date;
		$search['record_status'] = $record_status;
		$search['customer_profile_id'] = $customer_profile_id;
		$search['enquiry_mode'] = $enquiry_mode;
		$search['admin_user_id'] = $admin_user_id;
		$search['details'] = 1;

		$this->data['di_tour_booking_enquiry_data'] = $this->Di_Tour_Booking_Enquiry_Model->get_di_tour_booking_enquiry($search);


		$date = date('Y-m-d H:i:s');
		//echo "$customer_name : $customer_name <br>";
		$html = $this->load->view('admin/booking/Di_Tour_Booking_Enquiry_Module/pdf', $this->data, true);
		//echo $html;
		//$html = $this->load->view('admin/reports/Project_Reports_Module/project_reports_list_pdf' , $this->data, true);
		$this->pdf->createPDF($html, $date, false);

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

	//END


}
