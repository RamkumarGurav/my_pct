<?php
// Initialize $id to 1
$id_ttc = 1;

// Check if $append_id is not empty
if (!empty($append_id_ttc)) {
  // If $append_id is not empty, assign its value to $id
  $id_ttc = $append_id_ttc;
}
?>

<!-- Start of a new table row -->
<tr class=" qe_sub_table_tr_ttc">
  <!-- Table cell for the row count (this will be updated dynamically) -->
  <td class=" qe_sub_table_count_ttc">1.</td>

  <!-- Table cell for the name input -->
  <td>
    <input type="text" name="name_ttc[]" id="text_name_<?= $id_ttc ?>" placeholder="Name"
      class="form-control search-code form-control-sm" />
  </td>



  <!-- Table cell for the remove button (this will be updated dynamically) -->
  <td class=" qe_sub_table_remove_td_ttc"></td>
</tr>