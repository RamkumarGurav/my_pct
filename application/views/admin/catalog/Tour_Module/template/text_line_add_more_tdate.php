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
<tr class="qe_sub_table_tr_tdate">
  <!-- Table cell for the row count (this will be updated dynamically) -->
  <td class="qe_sub_table_count_tdate">1.</td>

  <!-- Table cell for the start date input -->
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

  <!-- Table cell for the end date input -->
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

  <!-- Table cell for the discount radio buttons and price inputs -->
  <td>
    <div>
      <label>
        <input type="radio" name="is_discount_tdate[<?= $id_tdate - 1 ?>]" id="is_discount_tdate_yes_<?= $id_tdate ?>"
          value="1" checked onchange="toggleDiscountFields(<?= $id_tdate - 1 ?>)"> Yes
      </label>
      <label>
        <input type="radio" name="is_discount_tdate[<?= $id_tdate - 1 ?>]" id="is_discount_tdate_no_<?= $id_tdate ?>"
          value="0" onchange="toggleDiscountFields(<?= $id_tdate ?>)"> No
      </label>
    </div>
  </td>
  <td>
    <div class="d-flex" id="actual_price_fields_<?= $id_tdate ?>">
      <input type="number" min="1" name="actual_price_tdate[]" id="actual_price_tdate_<?= $id_tdate ?>"
        placeholder="Actual Price" class="form-control search-code form-control-sm" />
    </div>
  </td>
  <td>
    <div class="d-flex" id="discounted_price_fields_<?= $id_tdate ?>">
      <input type="number" min="1" name="discounted_price_tdate[]" id="discounted_price_tdate_<?= $id_tdate ?>"
        placeholder="Discounted Price" class="form-control search-code form-control-sm" />
    </div>
  </td>

  <!-- Table cell for the remove button (this will be updated dynamically) -->
  <td class="qe_sub_table_remove_td_tdate"></td>
</tr>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    // Show the discounted price field by default if "Yes" is selected
    toggleDiscountFields(<?= $id_tdate ?>);
  });

  function toggleDiscountFields(id) {
    var isDiscountYes = document.getElementById('is_discount_tdate_yes_' + id).checked;
    var discountedPriceField = document.getElementById('discounted_price_tdate_' + id);
    if (isDiscountYes) { // "1" for Yes
      discountedPriceField.style.display = 'block';
      discountedPriceField.removeAttribute('readonly');
      discountedPriceField.value = '';
    } else { // "0" for No
      discountedPriceField.style.display = 'block';
      discountedPriceField.setAttribute('readonly', true);
      discountedPriceField.value = '0';
    }
  }

  function validateForm_tdate() {
    var isValid = true;
    var discountFields = document.querySelectorAll('input[name^="is_discount_tdate"]');

    discountFields.forEach(function (field) {
      var id = field.name.match(/\d+/)[0];
      var isDiscount = document.querySelector('input[name="is_discount_tdate[' + id + ']"]:checked').value;
      if (isDiscount === '1') { // "1" for Yes
        var discountedPrice = document.getElementById('discounted_price_tdate_' + id).value;
        if (discountedPrice < 1) {
          isValid = false;
          alert('Discounted Price must be greater than or equal to 1');
        }
      }
    });

    return isValid;
  }
</script>