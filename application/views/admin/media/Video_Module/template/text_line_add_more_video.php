<?php
// Initialize $id to 1
$id_video = 1;

// Check if $append_id is not empty
if (!empty($append_id_video)) {
  // If $append_id is not empty, assign its value to $id
  $id_video = $append_id_video;
}
?>

<!-- Start of a new table row -->
<tr class="  qe_sub_table_tr_video">
  <!-- Table cell for the row count (this will be updated dynamically) -->
  <td class=" qe_sub_table_count_video">1.</td>

  <!-- Table cell for the file title input -->
  <td>
    <!-- Input field for the file title with a dynamic ID -->
    <input type="number" min="1" step="1" value="1" name="position_video[]" id="position_video_<?= $id_video ?>"
      placeholder="Image Position" class="form-control search-code form-control-sm" />
    <!-- Hidden input field for the quotation enquiry detail ID with a dynamic ID -->
    <!-- <input type="hidden" name="quotation_enquiry_detail_id[]" id="quotation_enquiry_detail_id<?= $id_video ?>" value="" /> -->
  </td>

  <td>
    <!-- Input field for the file title with a dynamic ID -->
    <input type="text" name="file_title_video[]" id="file_title_video_<?= $id_video ?>" placeholder="Video Title"
      class="form-control search-code form-control-sm" />
    <!-- Hidden input field for the quotation enquiry detail ID with a dynamic ID -->
    <!-- <input type="hidden" name="quotation_enquiry_detail_id[]" id="quotation_enquiry_detail_id<?= $id_video ?>" value="" /> -->
  </td>

  <td>
    <!-- Input field for the file title with a dynamic ID -->
    <input type="text" name="file_video[]" id="file_video_<?= $id_video ?>" placeholder="Video Code"
      class="form-control search-code form-control-sm" />
    <!-- Hidden input field for the quotation enquiry detail ID with a dynamic ID -->
    <!-- <input type="hidden" name="quotation_enquiry_detail_id[]" id="quotation_enquiry_detail_id<?= $id_video ?>" value="" /> -->
  </td>


  <td class="pl-4">
    <div>
      <label class="pr-2">
        <input type="radio" name="status_video[<?= $id_video - 1 ?>]" id="status_video_yes_<?= $id_video ?>" value="1">
        Yes
      </label>
      <label>
        <input type="radio" name="status_video[<?= $id_video - 1 ?>]" id="status_video_no_<?= $id_video ?>" value="0"
          checked> No
      </label>
    </div>
  </td>
  <!-- Table cell for the remove button (this will be updated dynamically) -->
  <td class=" qe_sub_table_remove_td_video"></td>
</tr>