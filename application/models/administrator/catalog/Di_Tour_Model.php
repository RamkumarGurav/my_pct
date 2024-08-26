<?php
class Di_Tour_Model extends CI_Model
{
  public $session_uid = '';
  public $session_name = '';
  public $session_email = '';

  function __construct()
  {
    //db
    $this->load->database();


    $this->model_data = array();


    $this->db->query("SET sql_mode = ''");

    //session data
    $this->session_uid = $this->session->userdata('sess_psts_uid');
    $this->session_name = $this->session->userdata('sess_psts_name');
    $this->session_email = $this->session->userdata('sess_psts_email');


    $this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
    $this->output->set_header("Pragma: no-cache");
  }

  function get_di_tour($params = array())
  {
    $result = '';

    // Check if search_for parameter is provided to decide the count query
    if (!empty($params['search_for'])) {

      $this->db->select("count(ft.di_tour_id) as counts"); // Select count of records
    } else {

      // Select all required fields and additional information
      $this->db->select("ft.* ");
      $this->db->select("(select au.name from admin_user as  au where au.admin_user_id = ft.added_by) as added_by_name "); // Select added_by user's name
      $this->db->select("(select au.name from admin_user as  au where au.admin_user_id = ft.updated_by) as updated_by_name "); // Select updated_by user's name
      $this->db->select("(select au.name from admin_user as  au where au.admin_user_id = ft.is_deleted_by) as is_deleted_by_name "); // Select updated_by user's name
    }

    // From admin_user table "ft" refers to "from table"
    $this->db->from("di_tour as ft");

    // Joins with other tables
    // $this->db->join("di_tour_plans as  tp", "tp.di_tour_id = ft.di_tour_id");
    // $this->db->join("things_to_carry as  ttc", "ttc.di_tour_id = ft.di_tour_id");
    // $this->db->join("gallery as  g", "g.di_tour_id = ft.di_tour_id");

    // Conditional logic for ordering results
    if (!empty($params['order_by'])) {
      $this->db->order_by($params['order_by']);
    } else {
      $this->db->order_by("ft.di_tour_id desc"); // Default order by admin_user_id descending
    }

    // Conditions based on provided parameters
    if (!empty($params['di_tour_id'])) {
      $this->db->where("ft.di_tour_id", $params['di_tour_id']);
    }



    if (!empty($params['start_date'])) {
      $temp_date = date('Y-m-d', strtotime($params['start_date']));
      $this->db->where("DATE_FORMAT(ft.added_on, '%Y%m%d') >= DATE_FORMAT('$temp_date', '%Y%m%d')"); // Start date condition
    }

    if (!empty($params['end_date'])) {
      $temp_date = date('Y-m-d', strtotime($params['end_date']));
      $this->db->where("DATE_FORMAT(ft.added_on, '%Y%m%d') <= DATE_FORMAT('$temp_date', '%Y%m%d')"); // End date condition
    }

    if (!empty($params['record_status'])) {
      if ($params['record_status'] == 'zero') {
        $this->db->where("ft.status = 0"); // Status zero condition
      } else {
        $this->db->where("ft.status", $params['record_status']); // Specific status condition
      }
    }

    if (!empty($params['field_value']) && !empty($params['field_name'])) {
      $this->db->where("$params[field_name] like ('%$params[field_value]%')"); // Field name and value condition
    }

    if (!empty($params['limit']) && !empty($params['offset'])) {
      $this->db->limit($params['limit'], $params['offset']); // Limit and offset for pagination
    } else if (!empty($params['limit'])) {
      $this->db->limit($params['limit']); // Limit for number of records
    }


    // Execute query and get results
    $query_get_list = $this->db->get();
    $result = $query_get_list->result();//RESULT CONTAINS ARRAY OF ADMIN_USERS


    // If details parameter is provided, fetch additional details
    if (!empty($result) && !empty($params['details'])) {
      foreach ($result as $utd) {

        $this->db->select("ttc.*");
        $this->db->from("di_tour_things_to_carry as ttc");
        $this->db->where("ttc.di_tour_id", $utd->di_tour_id);
        $utd->di_tour_things_to_carry = $this->db->get()->result();


        $this->db->select("ci.*");
        $this->db->from("di_tour_carousel_image as ci");
        $this->db->where("ci.di_tour_id", $utd->di_tour_id);
        $this->db->order_by("ci.position desc");
        $utd->di_tour_carousel_image = $this->db->get()->result();

        $this->db->select("gi.*");
        $this->db->from("di_tour_gallery_image as gi");
        $this->db->where("gi.di_tour_id", $utd->di_tour_id);
        $this->db->order_by("gi.position desc");
        $utd->di_tour_gallery_image = $this->db->get()->result();

        $this->db->select("tp.*");
        $this->db->from("di_tour_plan as tp");
        $this->db->where("tp.di_tour_id", $utd->di_tour_id);
        $this->db->order_by("tp.day_number asc");
        $utd->di_tour_plan = $this->db->get()->result();


      }
    }

    return $result; // Return the final result
  }
}

?>