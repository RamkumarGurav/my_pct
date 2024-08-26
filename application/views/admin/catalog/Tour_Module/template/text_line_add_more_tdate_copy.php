<?php
// Initialize $id to 1
$id_tdate = 1;

// Check if $append_id is not empty
if (!empty($append_id_tdate)) {
  // If $append_id is not empty, assign its value to $id
  $id_tdate = $append_id_tdate;
}
?>

<!-- Start of a new table row -->
<tr class=" qe_sub_table_tr_tdate">
  <!-- Table cell for the row count (this will be uptdated dynamically) -->
  <td class=" qe_sub_table_count_tdate">1.</td>

  <!-- Table cell for the name input -->
  <td>
    <div class="input-group date joining_date_input" id="joining_date_input<?= $id_tdate ?>"
      data-target-input="nearest">
      <input type="text" name="start_date_tdate[]" id="start_date_tdate<?= $id_tdate ?>" placeholder="Start Date"
        style="width: 100%;" class="form-control datetimepicker-input width100 form-control-sm"
        data-target="#joining_date_input<?= $id_tdate ?>" />
      <div class="input-group-append" data-target="#joining_date_input<?= $id_tdate ?>" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
      </div>

    </div>

  </td>

  <td>
    <div class="input-group date end_date_input" id="end_date_input<?= $id_tdate ?>" data-target-input="nearest">
      <input type="text" name="end_date_tdate[]" id="end_date_tdate<?= $id_tdate ?>" placeholder="End Date"
        style="width: 100%;" class="form-control datetimepicker-input width100 form-control-sm"
        data-target="#end_date_input<?= $id_tdate ?>" />
      <div class="input-group-append" data-target="#end_date_input<?= $id_tdate ?>" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
      </div>

    </div>

  </td>
  <td>
    <input type="text" name="price_tdate[]" id="price_tdate_<?= $id_tdate ?>" placeholder="Price"
      class="form-control search-code form-control-sm" />
  </td>

  <!-- Table cell for the remove button (this will be uptdated dynamically) -->
  <td class=" qe_sub_table_remove_td_tdate"></td>
</tr>