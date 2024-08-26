<?php
// Initialize $id to 1
$id_plan = 1;

// Check if $append_id is not empty
if (!empty($append_id_plan)) {
  // If $append_id is not empty, assign its value to $id
  $id_plan = $append_id_plan;
}
?>

<!-- Start of a new table row -->
<tr class=" qe_sub_table_tr_plan">
  <!-- Table cell for the row count (this will be updated dynamically) -->
  <td class=" qe_sub_table_count_plan">1.</td>

  <!-- Table cell for the name input -->
  <td>
    <input type="number" name="day_number_plan[]" id="day_number_plan_<?= $id_plan ?>" placeholder="Day Number"
      class="form-control search-code form-control-sm" />
  </td>
  <td class=" ">
    <input type="text" name="day_name_plan[]" id="day_name_plan_<?= $id_plan ?>" placeholder="Day Title"
      class="form-control search-code form-control-sm" />
  </td>
  <td>
    <textarea class="search_textbox ckeditor" name="day_plan_plan[]" id="day_plan_plan_<?= $id_plan ?>"
      style="width: 576px; height: 200px;"></textarea>

    <span class="field-validation-valid" data-valmsg-for="day_plan_plan_<?= $id_plan ?>"
      data-valmsg-replace="true"></span>

  </td>


  <!-- Table cell for the remove button (this will be updated dynamically) -->
  <td class=" qe_sub_table_remove_td_plan"></td>
</tr>
<script>
  CKEDITOR.replace("day_plan_plan_<?= $id_plan ?>");
</script>