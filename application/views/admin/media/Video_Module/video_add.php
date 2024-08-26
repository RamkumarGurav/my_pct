<?php
$page_module_name = "Video";
?>
<?
$record_action = "Add New Record";
$video_id = 0;
$position = 0;
$file_title = $file = "";
$status = 0;






?>
<!-- /.navbar -->

<!-- Main Sidebar Container -->


<!--{{{{{{ Content Wrapper. Contains page content -->
<div class="content-wrapper">

	<!--{{{{{{ Page Module Header with breadcrumb -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">

				<div class="col-sm-6">
					<h1 class="m-0 text-dark">
						<?= $page_module_name ?> </small>
					</h1>
				</div><!-- /.col -->

				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<?= MAINSITE_Admin . "wam" ?>">Home</a></li>
						<li class="breadcrumb-item"><a
								href="<?= MAINSITE_Admin . $user_access->class_name . "/" . $user_access->function_name ?>">
								<?= $user_access->module_name ?>
								List
							</a></li>

						<li class="breadcrumb-item">
							<?= $record_action ?>
						</li>
					</ol>
				</div><!-- /.col -->

			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- }}}}}} Page Module Header with breadcrumb -->

	<!--{{{{{{ Main content -->
	<section class="content">
		<div class="row">
			<div class="col-12">

				<!-- {{{{{{ Main Card form with Header -->
				<div class="card">

					<!-- {{{{{form-header -->
					<div class="card-header">
						<h3 class="card-title">
							<?= $file_title ?> <small>
								<?= $record_action ?>
							</small>
						</h3>
					</div>
					<!-- }}}}}.form-header -->


					<!-- {{{{{ Main Form -->
					<?php
					if ($user_access->view_module == 1 || true) {
						?>

						<!-- {{{{{ always echo the "alert_message" before the main "card-body"-->
						<? echo $this->session->flashdata('alert_message'); ?>
						<!-- }}}}} "alert_message" -->


						<div class="card-body">
							<?php echo form_open(
								MAINSITE_Admin . "$user_access->class_name/videoDoEdit",
								array(
									'method' => 'post',
									'id' => 'video_form',
									"name" => "video_form",
									'style' => '',
									'class' => 'form-horizontal',
									'role' => 'form',
									'enctype' => 'multipart/form-data'
								)
							); ?>
							<input type="hidden" name="video_id" id="video_id" value="<?= $video_id ?>" />
							<input type="hidden" name="redirect_type" id="redirect_type" value="" />





							<div class="form-group row">

								<div class="col-12">
									<label for="asdf" class="col-sm-12 label_content px-2 py-0">Video Images </label>
									<div class="card-body py-0 px-2">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>#</th>
													<th width="15%">Video Position No.</th>
													<th>Video Title</th>
													<th width="30%">Video Code</th>
													<th width="15%" class="pl-4">Status</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="RFQDetailBody_video">
												<? $this->load->view('admin/media/Video_Module/template/text_line_add_more_video', $this->data); ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="9"><button type="button" onclick="addNewRFQDeatilLine_video(0)"
															class="btn btn-block btn-default">Add New Line</button>
													<td>
												</tr>
											</tfoot>
										</table>

									</div>

								</div>

							</div>





							<!-- /.card-body -->
							<div class="card-footer">
								<center>
									<button type="submit" name="save" onclick=" redirect_type_func('');" value="1"
										class="btn btn-info">Save</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" name="save-add-new" onclick=" redirect_type_func('save-add-new');" value="1"
										class="btn btn-default ">Save And Add New</button>
								</center>
							</div>
							<!-- /.card-footer -->

							<?php echo form_close() ?>
							</table>
						</div>
					<? } else {
						$this->data['no_access_flash_message'] = "You Dont Have Access To View " . $page_module_name;
						$this->load->view('admin/template/access_denied', $this->data);
					} ?>

					<!-- }}}}} Main Form -->
				</div>
				<!--   }}}}}} Main Card form with Header -->
			</div>
		</div>


	</section>
	<!-- }}}}} Main content -->
</div>
<!--}}}}}} Content Wrapper. Contains page content -->


<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>


<script>
	window.addEventListener('load', function () {
		//add validation for description
		document.getElementById('video_form').addEventListener('submit', function (event) {
			var description = document.getElementById('description').value.trim();

			if (description === "") {
				toastrDefaultErrorFunc("Tour description is required");
				event.preventDefault(); // Prevent form from submitting
			}
		});
	});
</script>
<script>
	function validateForm() {
		event.preventDefault();
		//user_role user_role_id

		$(".error_span").html("");
		var user_role_id_arr = document.getElementsByName("user_role_id[]");
		var i = 0;
		var user_role_check = true;
		for (i = 0; i < user_role_id_arr.length; i++) {
			if (user_role_id_arr[i].value != '') {
				user_role_check = false;
			}
		}
		if (user_role_check) {
			toastrDefaultErrorFunc("You Did Not Assign The Role To The User.");
			$("#user_role_error").html("You Did Not Assign The Role To The User.");
		}
		else {
			$('#employee_form').attr('onsubmit', '');
			$("#employee_form").submit();
		}
	}

	function redirect_type_func(data) {
		document.getElementById("redirect_type").value = data;
		return true;
	}

	window.addEventListener('load', function () {
		if (window.File && window.FileList && window.FileReader) {
			$("#banner_image").on("change", function (e) {
				var files = e.target.files,
					filesLength = files.length;
				for (var i = 0; i < filesLength; i++) {
					var f = files[i]
					var fileReader = new FileReader();
					fileReader.onload = (function (e) {
						var file = e.target;
						//customized code 
						$(".pip0").remove();
						$(".custom-file-display0").html("<span class=\"pip pip0\">" +
							"<img class=\"imageThumb imageThumb0\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" + "</span>");
					});
					fileReader.readAsDataURL(f);
				}
			});
		} else {
			alert("Your browser doesn't support to File API")
		}

	});


	window.addEventListener('load', function () {
		if (window.File && window.FileList && window.FileReader) {
			$("#cover_image").on("change", function (e) {
				var files = e.target.files,
					filesLength = files.length;
				for (var i = 0; i < filesLength; i++) {
					var f = files[i]
					var fileReader = new FileReader();
					fileReader.onload = (function (e) {
						var file = e.target;
						//customized code 
						$(".pip1").remove();
						$(".custom-file-display1").html("<span class=\"pip pip1\">" +
							"<img  class=\"imageThumb imageThumb1\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" + "</span>");
					});
					fileReader.readAsDataURL(f);
				}
			});
		} else {
			alert("Your browser doesn't support to File API")
		}

	});







	/*  >>> ADDING MORE Carusel FILES*/

	var append_id_carousel = 1;

	function addNewRFQDeatilLine_carousel(id_carousel = 0) {
		append_id_carousel++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_carousel' ?>",
			type: 'post',
			dataType: "json",
			data: { 'id_carousel': id_carousel, 'append_id_carousel': append_id_carousel, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>" },
			success: function (response) {
				$(".RFQDetailBody_carousel").append(response.template);
				set_qe_sub_table_count_carousel();
				set_qe_sub_table_remove_btn_carousel();
				calculate_qe_sub_table_price_carousel();
				set_input_element_functions_carousel();
				// Initialize Summernote
				$('.summernote').summernote({
					<?= _summernote_ ?>
				});
			},
			error: function (request, error) {
				toastrDefaultErrorFunc("Unknown Error. Please Try Again");
			}
		});
	}

	// Use event delegation for file input change event
	$(document).on('change', '.custom-file-input', function () {
		let fileName = Array.from(this.files).map(x => x.name).join(', ');
		$(this).siblings('.custom-file-label').addClass("selected").html(fileName);
	});

	function set_qe_sub_table_count_carousel() {
		let count_carousel = 0;
		$('.qe_sub_table_count_carousel').each(function (index, value) {
			count_carousel++;
			$(this).html(count_carousel + '.');
		});
	}

	function set_qe_sub_table_remove_btn_carousel() {
		$('.qe_sub_table_remove_td_carousel').html('');
		let count_carousel = 0;
		$('.qe_sub_table_remove_td_carousel').each(function (index, value) {
			count_carousel++;
		});
		if (count_carousel > 1) {
			$('.qe_sub_table_remove_td_carousel').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_carousel($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_carousel(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_carousel();
		set_qe_sub_table_count_carousel();
	}

	function del_carousel($carousel_image_id) {
		if (parseInt($carousel_image_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_file' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "carousel_image",
						"id_column": "carousel_image_id",
						'id': $carousel_image_id,
						"folder_name": "carousel_image",
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
						//alert(response);
						$("#quotation_enquiry_file_" + $carousel_image_id).hide();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}
	/* <<<< ADDING MORE FILES*/



	/*  >>> ADDING MORE VIDEO FILES*/

	var append_id_video = 1;

	function addNewRFQDeatilLine_video(id_video = 0) {
		append_id_video++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_video' ?>",
			type: 'post',
			dataType: "json",
			data: {
				'id_video': id_video, 'append_id_video': append_id_video, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
			},
			success: function (response) {
				$(".RFQDetailBody_video").append(response.template);
				set_qe_sub_table_count_video();
				set_qe_sub_table_remove_btn_video();
				calculate_qe_sub_table_price_video();
				set_input_element_functions_video();
				// Initialize Summernote
				$('.summernote').summernote({
					<?= _summernote_ ?>
				});
			},
			error: function (request, error) {
				toastrDefaultErrorFunc("Unknown Error. Please Try Again");
			}
		});
	}

	// Use event delegation for file input change event
	$(document).on('change', '.custom-file-input', function () {
		let fileName = Array.from(this.files).map(x => x.name).join(', ');
		$(this).siblings('.custom-file-label').addClass("selected").html(fileName);
	});

	function set_qe_sub_table_count_video() {
		var count_video = 0;
		$('.qe_sub_table_count_video').each(function (index, value) {
			count_video++;
			$(this).html(count_video + '.');
		});
	}

	function set_qe_sub_table_remove_btn_video() {
		$('.qe_sub_table_remove_td_video').html('');
		var count_video = 0;
		$('.qe_sub_table_remove_td_video').each(function (index, value) {
			count_video++;
		});
		if (count_video > 1) {
			$('.qe_sub_table_remove_td_video').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_video($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_video(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_video();
		set_qe_sub_table_count_video();
	}



	function del_video($video_id) {
		if (parseInt($video_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_file' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "video",
						"id_column": "video_id",
						'id': $video_id,
						"folder_name": "main_video",
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
						//alert(response);
						$("#quotation_enquiry_file_" + $video_id).hide();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}
	/* <<<< ADDING MORE VIDEO FILES*/

	/*  >>> ADDING MORE tdate TEXT*/

	var append_id_tdate = 1;

	function addNewRFQDeatilLine_tdate(id_tdate = 0) {
		append_id_tdate++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_tdate' ?>",
			type: 'post',
			dataType: "json",
			data: { 'id_tdate': id_tdate, 'append_id_tdate': append_id_tdate, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>" },
			success: function (response) {
				$(".RFQDetailBody_tdate").append(response.template);
				set_qe_sub_table_count_tdate();
				set_qe_sub_table_remove_btn_tdate();
				calculate_qe_sub_table_price_tdate();
				set_input_element_functions_tdate();
				// Initialize Summernote
				$('.summernote').summernote({
					<?= _summernote_ ?>
				});
			},
			error: function (request, error) {
				toastrDefaultErrorFunc("Unknown Error. Please Try Again");
			}
		});
	}



	function set_qe_sub_table_count_tdate() {
		let count_tdate = 0;
		$('.qe_sub_table_count_tdate').each(function (index, value) {
			count_tdate++;
			$(this).html(count_tdate + '.');
		});
	}

	function set_qe_sub_table_remove_btn_tdate() {
		$('.qe_sub_table_remove_td_tdate').html('');
		let count_tdate = 0;
		$('.qe_sub_table_remove_td_tdate').each(function (index, value) {
			count_tdate++;
		});
		if (count_tdate > 1) {
			$('.qe_sub_table_remove_td_tdate').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_tdate($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_tdate(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_tdate();
		set_qe_sub_table_count_tdate();
	}


	function del_tdate($video_date_id) {
		if (parseInt($video_date_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "video_date",
						"id_column": "video_date_id",
						'id': $video_date_id,
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}

	/* <<<< ADDING MORE tdate TEXT*/


	/*  >>> ADDING MORE TTC TEXT*/

	var append_id_ttc = 1;

	function addNewRFQDeatilLine_ttc(id_ttc = 0) {
		append_id_ttc++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_ttc' ?>",
			type: 'post',
			dataType: "json",
			data: { 'id_ttc': id_ttc, 'append_id_ttc': append_id_ttc, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>" },
			success: function (response) {
				$(".RFQDetailBody_ttc").append(response.template);
				set_qe_sub_table_count_ttc();
				set_qe_sub_table_remove_btn_ttc();
				calculate_qe_sub_table_price_ttc();
				set_input_element_functions_ttc();
				// Initialize Summernote
				$('.summernote').summernote({
					<?= _summernote_ ?>
				});
			},
			error: function (request, error) {
				toastrDefaultErrorFunc("Unknown Error. Please Try Again");
			}
		});
	}



	function set_qe_sub_table_count_ttc() {
		let count_ttc = 0;
		$('.qe_sub_table_count_ttc').each(function (index, value) {
			count_ttc++;
			$(this).html(count_ttc + '.');
		});
	}

	function set_qe_sub_table_remove_btn_ttc() {
		$('.qe_sub_table_remove_td_ttc').html('');
		let count_ttc = 0;
		$('.qe_sub_table_remove_td_ttc').each(function (index, value) {
			count_ttc++;
		});
		if (count_ttc > 1) {
			$('.qe_sub_table_remove_td_ttc').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_ttc($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_ttc(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_ttc();
		set_qe_sub_table_count_ttc();
	}


	function del_ttc($things_to_carry_id) {
		if (parseInt($things_to_carry_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "things_to_carry",
						"id_column": "things_to_carry_id",
						'id': $things_to_carry_id,
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}

	/* <<<< ADDING MORE TTC TEXT*/



	/*  >>> ADDING MORE PLAN TEXT*/

	var append_id_plan = 1;

	function addNewRFQDeatilLine_plan(id_plan = 0) {
		append_id_plan++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_plan' ?>",
			type: 'post',
			dataType: "json",
			data: { 'id_plan': id_plan, 'append_id_plan': append_id_plan, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>" },
			success: function (response) {
				$(".RFQDetailBody_plan").append(response.template);
				set_qe_sub_table_count_plan();
				set_qe_sub_table_remove_btn_plan();
				calculate_qe_sub_table_price_plan();
				set_input_element_functions_plan();
				// Initialize Summernote
				$('.summernote').summernote({
					<?= _summernote_ ?>
				});
			},
			error: function (request, error) {
				toastrDefaultErrorFunc("Unknown Error. Please Try Again");
			}
		});
	}



	function set_qe_sub_table_count_plan() {
		let count_plan = 0;
		$('.qe_sub_table_count_plan').each(function (index, value) {
			count_plan++;
			$(this).html(count_plan + '.');
		});
	}

	function set_qe_sub_table_remove_btn_plan() {
		$('.qe_sub_table_remove_td_plan').html('');
		let count_plan = 0;
		$('.qe_sub_table_remove_td_plan').each(function (index, value) {
			count_plan++;
		});
		if (count_plan > 1) {
			$('.qe_sub_table_remove_td_plan').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_plan($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_plan(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_plan();
		set_qe_sub_table_count_plan();
	}


	function del_plan($video_plan_id) {
		if (parseInt($video_plan_id) > 0) {
			var s = confirm('You want to delete this record?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "video_plan",
						"id_column": "video_plan_id",
						'id': $video_plan_id,
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}

	/* <<<< ADDING MORE PLAN TEXT*/


</script>
<script>
	require(['bootstrap-multiselect'], function (purchase) {
		$('#mySelect').multiselect();
	});
</script>

<script>
	$(document).ready(function () {
		$("#google_map_address").each(function () {
			var target = this;
			var $collapse = $(this).parents('.form-group').next('.collapse');
			var $map = $collapse.find('.another-map-class');
			var placepicker = $(this).placepicker({

				map: $map.get(0),
				placeChanged: function (place) {
					console.log(place);
					if (place.url != undefined && place.url != '') {
						$('#google_map_url').val(place.url);
					}
					console.log("place changed: ", place.formatted_address, this.getLocation());
				}
			}).data('placepicker');
		});

	});


</script>

<script>
</script>