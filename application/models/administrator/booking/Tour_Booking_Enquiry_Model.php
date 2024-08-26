<?php
class Tour_Booking_Enquiry_Model extends CI_Model
{
	public $session_uid = '';
	public $session_name = '';
	public $session_email = '';

	function __construct()
	{
		$this->load->database();
		$this->model_data = array();
		$this->db->query("SET sql_mode = ''");
		$this->session_uid = $this->session->userdata('sess_psts_uid');
		$this->session_name = $this->session->userdata('sess_psts_name');
		$this->session_email = $this->session->userdata('sess_psts_email');

	}

	function get_tour_booking_enquiry($params = array())
	{
		$result = '';
		if (!empty($params['search_for'])) {
			$this->db->select("count(ft.tour_booking_enquiry_id) as counts");
		} else {
			$this->db->select("ft.*");
			$this->db->select("(select au.name from admin_user as au where au.admin_user_id = ft.updated_by) as updated_by_name ");
		}

		$this->db->from("tour_booking_enquiry as ft");
		//$this->db->join("users_role_master as  urm" , "urm.user_role_id = ft.user_role_id");
		$this->db->join("admin_user as  au1", "au1.admin_user_id = ft.updated_by", "left");


		if (!empty($params['order_by'])) {
			$this->db->order_by($params['order_by']);
		} else {
			$this->db->order_by("ft.tour_booking_enquiry_id desc");
		}

		if (!empty($params['tour_booking_enquiry_id'])) {
			$this->db->where("ft.tour_booking_enquiry_id", $params['tour_booking_enquiry_id']);
		}

		if (!empty($params['tour_id'])) {
			$this->db->where("ft.tour_id", $params['tour_id']);
		}



		if (!empty($params['start_date'])) {
			$temp_date = date('Y-m-d', strtotime($params['start_date']));
			$this->db->where("DATE_FORMAT(ft.added_on, '%Y%m%d') >= DATE_FORMAT('$temp_date', '%Y%m%d')");
		}

		if (!empty($params['end_date'])) {
			$temp_date = date('Y-m-d', strtotime($params['end_date']));
			$this->db->where("DATE_FORMAT(ft.added_on, '%Y%m%d') <= DATE_FORMAT('$temp_date', '%Y%m%d')");
		}

		if (!empty($params['record_status'])) {
			if ($params['record_status'] == 'zero') {
				$this->db->where("ft.status = 0");
			} else {
				$this->db->where("ft.status", $params['record_status']);
			}
		}

		if (!empty($params['limit']) && !empty($params['offset'])) {
			$this->db->limit($params['limit'], $params['offset']);
		} else if (!empty($params['limit'])) {
			$this->db->limit($params['limit']);
		}

		$query_get_list = $this->db->get();
		$result = $query_get_list->result();

		if (!empty($result)) {
			if (!empty($params['details'])) {
				foreach ($result as $e) {
					$this->db->select("t.*");
					$this->db->from("tour as t");
					$this->db->where("t.tour_id", $e->tour_id);
					$e->tour = $this->db->get()->result();


					$this->db->select("tdate.*");
					$this->db->from("tour_date as tdate");
					$this->db->where("tdate.tour_date_id", $e->tour_date_id);
					$e->tour_date = $this->db->get()->result();


				}
			}

		}
		return $result;
	}

}

?>