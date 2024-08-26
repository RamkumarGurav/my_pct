<script src="https://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<style>
	.placepicker-map {
		width: 98%;
		height: 300px;
	}

	.another-map-class {
		width: 98%;
		height: 300px;
	}

	.pac-container {
		border-radius: 5px;
	}
</style>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?&sensor=false&libraries=places&key=AIzaSyAldYzpqTa00-GOjaz3_TTlawRJ2B8Isu4"></script>
<script src="<?php echo MAINSITE; ?>map/src/js/jquery.placepicker.js"></script>
<?php
$page_module_name = "Domestic & Int Tours";
?>
<?
$record_action = "Add New Record";
$di_tour_id = 0;
$di_tour_variant = 0;
$name = $description = $inclusion = $exclusion = $important_notes = $additional_info = $minimum_age = $tour_type = $location = $google_map_address = $google_map_url = $banner_image = $cover_image = "";
$duration_day = 0;
$duration_night = 0;
$total_days = 0;
$is_discount = true;
$actual_price = 0;
$discounted_price = 0;
$available_slots = 0;
$status = 0;
$di_tour_variant_data = [
	(object) ["di_tour_variant" => 1, "di_tour_variant_name" => "Domestic Tour"],
	(object) ["di_tour_variant" => 2, "di_tour_variant_name" => "International Tour"]
];

if (!empty($di_tour_data)) {

	$record_action = "Update";
	$di_tour_id = $di_tour_data->di_tour_id;
	$di_tour_variant = $di_tour_data->di_tour_variant;
	$name = $di_tour_data->name;
	$description = $di_tour_data->description;
	$inclusion = $di_tour_data->inclusion;
	$exclusion = $di_tour_data->exclusion;
	$important_notes = $di_tour_data->important_notes;
	$additional_info = $di_tour_data->additional_info;
	$minimum_age = $di_tour_data->minimum_age;
	$tour_type = $di_tour_data->tour_type;
	$location = $di_tour_data->location;
	$google_map_address = $di_tour_data->google_map_address;
	$google_map_url = $di_tour_data->google_map_url;
	$banner_image = $di_tour_data->banner_image;
	$cover_image = $di_tour_data->cover_image;
	$duration_day = $di_tour_data->duration_day;
	$duration_night = $di_tour_data->duration_night;
	$is_discount = $di_tour_data->is_discount;
	$actual_price = $di_tour_data->actual_price;
	$discounted_price = $di_tour_data->discounted_price;
	$total_days = $duration_day + $duration_night;
	$available_slots = $di_tour_data->available_slots;
	$status = $di_tour_data->status;


}





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
						<? if (!empty($di_tour_data)) { ?>
							<li class="breadcrumb-item"><a
									href="<?= MAINSITE_Admin . $user_access->class_name . "/di-tour-view/" . $di_tour_id ?>">View</a>
							</li>
						<? } ?>
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
							<?= $name ?> <small>
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
								MAINSITE_Admin . "$user_access->class_name/diTourDoEdit",
								array(
									'method' => 'post',
									'id' => 'di_tour_form',
									"name" => "di_tour_form",
									'style' => '',
									'class' => 'form-horizontal',
									'role' => 'form',
									'enctype' => 'multipart/form-data'
								)
							); ?>
							<input type="hidden" name="di_tour_id" id="di_tour_id" value="<?= $di_tour_id ?>" />
							<input type="hidden" name="redirect_type" id="redirect_type" value="" />



							<div class="form-group row">
								<div class=" col-md-4 col-sm-6">
									<label for="inputEmail3" class="col-sm-12 label_content px-2 py-0">Tour Variant <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<select type="text" class="form-control form-control-sm" required id="di_tour_variant"
											name="di_tour_variant">
											<option value="">Select Tour Date</option>
											<? foreach ($di_tour_variant_data as $item) {
												$selected = "";
												if ($item->di_tour_variant == $di_tour_variant) {
													$selected = "selected";
												}
												?>
												<option value="<?= $item->di_tour_variant ?>" <?= $selected ?>> <?= $item->di_tour_variant_name ?>

												</option>
											<? } ?>
										</select>

									</div>
								</div>

								<div class="col-md-8 col-sm-6">
									<label for="name" class="col-sm-12 label_content px-2 py-0">Tour Name <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="text" class="form-control form-control-sm" required id="name" name="name"
											value="<?= $name ?>" placeholder="Tour Name">
									</div>
								</div>


							</div>

							<div class="form-group row">
								<div class="col-md-4 col-sm-6">
									<label for="duration_day" class="col-sm-12 label_content px-2 py-0">Days <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="number" class="form-control form-control-sm" id="duration_day" name="duration_day"
											value="<?= $duration_day ?>" placeholder="Days" min="0" step="1">

									</div>
								</div>
								<div class="col-md-4 col-sm-6">
									<label for="duration_night" class="col-sm-12 label_content px-2 py-0">Nights <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="number" class="form-control form-control-sm" id="duration_night" name="duration_night"
											value="<?= $duration_night ?>" placeholder="Nights" min="0" step="1">

									</div>
								</div>
								<!-- <div class="col-md-4 col-sm-6">
									<label for="available_slots" class="col-sm-12 label_content px-2 py-0">Available Slots <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="number" class="form-control form-control-sm" id="available_slots" name="available_slots"
											value="<?= $available_slots ?>" placeholder="Available Slots" min="0" step="1">

									</div>

								</div> -->
							</div>

							<div class="form-group row">

								<div class="col-md-4 col-sm-6">
									<label for="actual_price" class="col-sm-12 label_content px-2 py-0">Is Discount ? <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div>

									</div>
									<div class="px-4">
										<label>
											<input type="radio" name="is_discount" id="is_discount_yes" value="1" checked <?php if ($is_discount == 1) {
												echo "checked";
											} ?> onchange="toggleDiscountFields()"
												style="transform: scale(1.5); margin-right: 10px;"> Yes
										</label>
										<label class="pl-4">
											<input type="radio" name="is_discount" id="is_discount_no" value="0" <?php if ($is_discount != 1) {
												echo "checked";
											} ?> onchange="toggleDiscountFields()"
												style="transform: scale(1.5); margin-right: 10px;"> No
										</label>
									</div>
								</div>

								<div class="col-md-4 col-sm-6">
									<label for="actual_price" class="col-sm-12 label_content px-2 py-0">Actual Price <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="number" class="form-control form-control-sm" id="actual_price" name="actual_price"
											value="<?= $actual_price ?>" placeholder="Actual Price" min="0" step="1">
									</div>

								</div>
								<div class="col-md-4 col-sm-6">
									<label for="discounted_price" class="col-sm-12 label_content px-2 py-0">Discounted Price <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="number" class="form-control form-control-sm" id="discounted_price"
											name="discounted_price" value="<?= $discounted_price ?>" placeholder="Discounted Price" min="0"
											step="1">
									</div>

								</div>


							</div>




							<div class="form-group row">


								<div class="col-lg-3 col-md-4 col-sm-6">
									<label for="minimum_age" class="col-sm-12 label_content px-2 py-0">Minimum Age<span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="text" class="form-control form-control-sm" required id="minimum_age" name="minimum_age"
											value="<?= $minimum_age ?>" placeholder="Minimum Age">
									</div>
								</div>
								<div class="col-lg-3 col-md-4 col-sm-6">
									<label for="tour_type" class="col-sm-12 label_content px-2 py-0">Tour Type <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="text" class="form-control form-control-sm" required id="tour_type" name="tour_type"
											value="<?= $tour_type ?>" placeholder="Tour Type">
									</div>
								</div>
								<div class="col-md-3 col-sm-6">
									<label for="location" class="col-sm-12 label_content px-2 py-0">Upload Banner Image <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>

									<div class="col-sm-12 d-flex">
										<div class="input-group" style="width:90%">
											<div class="custom-file">
												<input type="file" name="banner_image" class="custom-file-input" id="banner_image" <? if (empty($di_tour_data->banner_image)) { ?> required <? } ?>>
												<label class="custom-file-label form-control-sm" for="banner_image"></label>

											</div>

										</div>
										<div class="custom-file-display custom-file-display0">
											<? if (!empty($banner_image)) { ?>
												<span class="pip pip0">
													<a target="_blank"
														href="<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>">
														<img class="imageThumb imageThumb0"
															src="<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>" />
													</a>
												</span>
											<? } else { ?>
												<span class="pip pip0">
													<img class="imageThumb imageThumb0" src="<?= _uploaded_files_ ?>no-img.png" />
												</span>
											<? } ?>
										</div>
									</div>
								</div>

								<div class="col-md-3 col-sm-6">
									<label for="location" class="col-sm-12 label_content px-2 py-0">Upload Cover Image <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12 d-flex">
										<div class="input-group" style="width:90%">
											<div class="custom-file">
												<input type="file" name="cover_image" class="custom-file-input" id="cover_image" <? if (empty($di_tour_data->cover_image)) { ?> required <? } ?>>
												<label class="custom-file-label form-control-sm" for="cover_image"></label>

											</div>

										</div>
										<div class="custom-file-display custom-file-display1">
											<? if (!empty($cover_image)) { ?>
												<span class="pip pip1">
													<a target="_blank"
														href="<?= _uploaded_files_ . 'di_tour_cover_image/' . $di_tour_data->cover_image ?>">
														<img class="imageThumb imageThumb1"
															src="<?= _uploaded_files_ . 'di_tour_cover_image/' . $di_tour_data->cover_image ?>" />
													</a>
												</span>
											<? } else { ?>
												<span class="pip pip1">
													<img class="imageThumb imageThumb1" src="<?= _uploaded_files_ ?>no-img.png" />
												</span>
											<? } ?>
										</div>

									</div>
								</div>

							</div>




							<div class="row">
								<div class="col-lg-3 col-md-4 col-sm-6">
									<label for="location" class="col-sm-12 label_content px-2 py-0">Location Name <span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="text" class="form-control form-control-sm" required id="location" name="location"
											value="<?= $location ?>" placeholder="Location Name">
									</div>
								</div>
								<div class="col-md-8 row">
									<label for="inputEmail3" class="col-sm-12 label_content px-2 py-0 ">Google MAP Address<span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span></label>
									<div class="col-sm-12">
										<input type="hidden" name="google_map_url" id="google_map_url" value="<? echo $google_map_url ?>" />
										<input type="text" name="google_map_address" class="form-control form-control-sm" width="90%"
											data-map-container-id="collapseTwo" id="google_map_address" required placeholder="Place or Location"
											value="<?php echo $google_map_address; ?>">

										<!-- <div id="" class="" style="display:block">
											<div class="another-map-class thumbnail"></div>
										</div> -->
									</div>
								</div>
							</div>


							<div class="form-group">

								<div class="col-md-12">
									<label for="description" class="col-sm-12 label_content px-2 py-0"> Tour Description<span
											style="color:#f00;font-size: 22px;margin-top: 3px;">*</span>
										<span class="required"></span>
									</label>

									<textarea class="search_textbox ckeditor" name="description" id="description" required
										style="width: 576px; height: 200px;"><? echo $description; ?></textarea>

									<span class="field-validation-valid" data-valmsg-for="description" data-valmsg-replace="true"></span>

								</div>

							</div>

							<div class="form-group">

								<div class="col-md-12">
									<label for="inclusion" class="col-sm-12 label_content px-2 py-0"> Inclusion
										<span class="required"></span>
									</label>

									<textarea class="search_textbox ckeditor" name="inclusion" id="inclusion" required
										style="width: 576px; height: 200px;"><? echo $inclusion; ?></textarea>

									<span class="field-validation-valid" data-valmsg-for="inclusion" data-valmsg-replace="true"></span>

								</div>

							</div>

							<div class="form-group">

								<div class="col-md-12">
									<label for="exclusion" class="col-sm-12 label_content px-2 py-0"> Exclusion

									</label>

									<textarea class="search_textbox ckeditor" name="exclusion" id="exclusion" required
										style="width: 576px; height: 200px;"><? echo $exclusion; ?></textarea>

									<span class="field-validation-valid" data-valmsg-for="exclusion" data-valmsg-replace="true"></span>

								</div>

							</div>

							<div class="form-group">

								<div class="col-md-12">
									<label for="important_notes" class="col-sm-12 label_content px-2 py-0"> Important Notes

									</label>

									<textarea class="search_textbox ckeditor" name="important_notes" id="important_notes" required
										style="width: 576px; height: 200px;"><? echo $important_notes; ?></textarea>

									<span class="field-validation-valid" data-valmsg-for="important_notes"
										data-valmsg-replace="true"></span>

								</div>

							</div>

							<div class="form-group">

								<div class="col-md-12">
									<label for="additional_info" class="col-sm-12 label_content px-2 py-0">Additional Info

									</label>

									<textarea class="search_textbox ckeditor" name="additional_info" id="additional_info" required
										style="width: 576px; height: 200px;"><? echo $additional_info; ?></textarea>

									<span class="field-validation-valid" data-valmsg-for="additional_info"
										data-valmsg-replace="true"></span>

								</div>

							</div>

							<div class="form-group row">
								<div class=" col-sm-12">
									<label for="asdf" class="col-sm-12 label_content px-2 py-0">Tour Plan </label>
									<div class="card-body py-0 px-2">
										<table class="table table-sm">
											<thead>
												<tr>
													<th width="2%">#</th>
													<th width="10%">Day Number</th>
													<th width="20%">Title</th>
													<th width="60%">Plan</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="RFQDetailBody_plan">
												<? $this->load->view('admin/catalog/Tour_Module/template/text_line_add_more_plan', $this->data); ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="9"><button type="button" onclick="addNewRFQDeatilLine_plan(0)"
															class="btn btn-block btn-default">Add New Line</button>
													<td>
												</tr>
											</tfoot>
										</table>
										<?php if (!empty($di_tour_data->di_tour_plan)) { ?>
											<div class="card-body p-0 " style="width:90% !important">
												<table class="table table-sm">
													<thead>
														<tr>
															<th colspan="2" style="padding: 10px 5px;"><a data-target="#uploadImg_plan"
																	data-toggle="collapse" class="collapsed uploadImgClick uploadImgClick1">Uploaded Tour
																	Plans
																	<span class="bg-primary fa fa-chevron-down"></span></a></th>
														</tr>
													</thead>
													<tbody class="collapse" id="uploadImg_plan">
														<?php foreach ($di_tour_data->di_tour_plan as $plan) {
															?>
															<tr id="quotation_enquiry_file_<?= $plan->di_tour_plan_id ?>">
																<td>
																	<div id="accordion" style="width:100%;">
																		<div class="card " style="width:100%;">
																			<div class="card-header ">
																				<a class="card-title w-100" data-toggle="collapse"
																					href="#collapseOne<?= $plan->di_tour_plan_id ?>" aria-expanded="true">
																					<span>Day
																						<?= $plan->day_number ?>
																						:</span>
																					<span class=" inline-block ">
																						<?= $plan->day_name ?>
																					</span>
																				</a>
																			</div>
																			<div id="collapseOne<?= $plan->di_tour_plan_id ?>" class="collapse show"
																				data-parent="#accordion" style="">
																				<div class="card-body">
																					<?= $plan->day_plan ?>
																				</div>
																			</div>
																		</div>
																	</div>

																</td>
																<td><button class="btn btn-outline-danger btn-xs"
																		onclick="return del_plan('<?= $plan->di_tour_plan_id ?>')" title="remove"><i
																			class="fas fa-trash"></i></button></td>
															</tr>
														<?php } ?>
														<tr>
															<td colspan="2"></td>
														</tr>
													</tbody>
												</table>
											</div>
										<?php } ?>
									</div>

								</div>
							</div>

							<div class="form-group row">
								<div class=" col-sm-12">
									<label for="available_slots" class="col-sm-12 label_content px-2 py-0">Things To Carry </label>
									<div class="card-body py-0 px-2">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>#</th>
													<th width="70%">Things to Carry</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="RFQDetailBody_ttc">
												<? $this->load->view('admin/catalog/Tour_Module/template/text_line_add_more_ttc', $this->data); ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="9"><button type="button" onclick="addNewRFQDeatilLine_ttc(0)"
															class="btn btn-block btn-default">Add New Line</button>
													<td>
												</tr>
											</tfoot>
										</table>
										<?php if (!empty($di_tour_data->di_tour_things_to_carry)) { ?>
											<div class="card-body p-0 " style="width:90% !important">
												<table class="table table-sm">
													<thead>
														<tr>
															<th colspan="2" style="padding: 10px 5px;"><a data-target="#uploadImg_ttc"
																	data-toggle="collapse" class="collapsed uploadImgClick uploadImgClick1">Uploaded Things to
																	carry <span class="bg-primary fa fa-chevron-down"></span></a></th>
														</tr>
													</thead>
													<tbody class="collapse" id="uploadImg_ttc">
														<?php foreach ($di_tour_data->di_tour_things_to_carry as $ttc) { ?>
															<tr id="quotation_enquiry_file_<?= $ttc->di_tour_things_to_carry_id ?>">
																<td>

																	<?= $ttc->name ?>

																</td>
																<td><button class="btn btn-outline-danger btn-xs"
																		onclick="return del_ttc('<?= $ttc->di_tour_things_to_carry_id ?>')" title="remove"><i
																			class="fas fa-trash"></i></button></td>
															</tr>
														<?php } ?>
														<tr>
															<td colspan="2"></td>
														</tr>
													</tbody>
												</table>
											</div>
										<?php } ?>
									</div>

								</div>
							</div>

							<div class="form-group row">

								<div class="col-lg-6 col-md-12 col-sm-6">
									<label for="asdf" class="col-sm-12 label_content px-2 py-0">Carousel Images </label>
									<div class="pl-4">
										<span class="instruction-text" style="color:red; font-size:.8rem;">
											(Preferred Image Dimensions: Width: 892px, Height: 489px)
										</span>
										<br>
										<span class="instruction-text" style="color:red; font-size:.8rem;">
											(Images appear in descending order of position.Higher position means the image appears first.)
										</span>
									</div>
									<div class="card-body py-0 px-2">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>#</th>
													<th width="25%">Position No.</th>
													<th>Image</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="RFQDetailBody_carousel">
												<? $this->load->view('admin/catalog/Tour_Module/template/file_line_add_more_carousel', $this->data); ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="9"><button type="button" onclick="addNewRFQDeatilLine_carousel(0)"
															class="btn btn-block btn-default">Add New Line</button>
													<td>
												</tr>
											</tfoot>
										</table>
										<?php if (!empty($di_tour_data->di_tour_carousel_image)) { ?>
											<div class="card-body p-0 " style="width:90% !important">
												<table class="table table-sm">
													<thead>
														<tr>
															<th colspan="2" style="padding: 10px 5px;"><a data-target="#uploadImg_carousel"
																	data-toggle="collapse" class="collapsed uploadImgClick">Uploaded Images <span
																		class="bg-primary fa fa-chevron-down"></span></a></th>
														</tr>
													</thead>
													<tbody class="collapse" id="uploadImg_carousel">
														<?php foreach ($di_tour_data->di_tour_carousel_image as $item) { ?>
															<tr id="gi<?= $item->di_tour_carousel_image_id ?>">
																<td><?= !empty($item->position) ? $item->position : 1 ?></td>
																<td><span class="">
																		<a target="_blank"
																			href="<?= _uploaded_files_ . 'di_tour_carousel_image/' . $item->file ?>">
																			<img class="imageThumb "
																				src="<?= _uploaded_files_ . 'di_tour_carousel_image/' . $item->file ?>" />
																		</a>
																	</span></td>
																<td><button class=" btn btn-outline-danger btn-xs"
																		onclick="return del_carousel('<?= $item->di_tour_carousel_image_id ?>')" title="remove"><i
																			class="fas fa-trash"></i></button></td>
															</tr>
														<?php } ?>
														<tr>
															<td colspan="2"></td>
														</tr>
													</tbody>
												</table>
											</div>
										<?php } ?>
									</div>

								</div>

								<div class="col-lg-6 col-md-12 col-sm-6">
									<label for="asdf" class="col-sm-12 label_content px-2 py-0">Gallery Images </label>
									<div class="pl-4">
										<span class="instruction-text" style="color:red; font-size:.8rem;">
											(Preferred Image Dimensions: Width: 892px, Height: 489px)
										</span>
										<br>
										<span class="instruction-text" style="color:red; font-size:.8rem;">
											(Images appear in descending order of position.Higher position means the image appears first.)
										</span>
									</div>
									<div class="card-body py-0 px-2">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>#</th>
													<th width="25%">Position No.</th>
													<th>Image</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="RFQDetailBody_gallery">
												<? $this->load->view('admin/catalog/Tour_Module/template/file_line_add_more_gallery', $this->data); ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="9"><button type="button" onclick="addNewRFQDeatilLine_gallery(0)"
															class="btn btn-block btn-default">Add New Line</button>
													<td>
												</tr>
											</tfoot>
										</table>
										<?php if (!empty($di_tour_data->di_tour_gallery_image)) { ?>
											<div class="card-body p-0 " style="width:90% !important">
												<table class="table table-sm">
													<thead>
														<tr>
															<th colspan="2" style="padding: 10px 5px;"><a data-target="#uploadImg_gallery"
																	data-toggle="collapse" class="collapsed uploadImgClick uploadImgClick2">Uploaded Images
																	<span class="bg-primary fa fa-chevron-down"></span></a></th>
														</tr>
													</thead>
													<tbody class="collapse" id="uploadImg_gallery">
														<?php foreach ($di_tour_data->di_tour_gallery_image as $item) { ?>
															<tr id="gi<?= $item->di_tour_gallery_image_id ?>">
																<td><?= !empty($item->position) ? $item->position : 1 ?></td>
																<td><span class="">
																		<a target="_blank"
																			href="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $item->file ?>">
																			<img class="imageThumb imageThumb2"
																				src="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $item->file ?>" />
																		</a>
																	</span></td>
																<td><button class=" btn btn-outline-danger btn-xs"
																		onclick="return del_gallery('<?= $item->di_tour_gallery_image_id ?>')" title="remove"><i
																			class="fas fa-trash"></i></button></td>
															</tr>
														<?php } ?>
														<tr>
															<td colspan="2"></td>
														</tr>
													</tbody>
												</table>
											</div>
										<?php } ?>
									</div>

								</div>

							</div>

							<div class="form-group row">

								<div class="col-lg-2 col-md-4 col-sm-6">
									<label for="radioSuccess1" class="col-sm-12 label_content px-2 py-0">Status <span
											style="color:#f00;font-size: 22px;margin-top: 3px;"> </span></label>
									<div class="col-sm-12">
										<div class="form-check" style="margin-top:12px">
											<div class="form-group clearfix">
												<div class="icheck-success d-inline">
													<input type="radio" name="status" <? if ($status == 1) {
														echo "checked";
													} ?> value="1"
														id="radioSuccess1">
													<label for="radioSuccess1"> Active
													</label>
												</div>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<div class="icheck-danger d-inline">
													<input type="radio" name="status" <? if ($status != 1) {
														echo "checked";
													} ?> value="0"
														id="radioSuccess2">
													<label for="radioSuccess2"> Block
													</label>
												</div>
											</div>
										</div>
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


<script src="https://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<script>
	window.addEventListener('load', function () {
		//add validation for description
		document.getElementById('di_tour_form').addEventListener('submit', function (event) {
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

	function del_carousel($di_tour_carousel_image_id) {
		if (parseInt($di_tour_carousel_image_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_file' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "di_tour_carousel_image",
						"id_column": "di_tour_carousel_image_id",
						'id': $di_tour_carousel_image_id,
						"folder_name": "di_tour_carousel_image",
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
						//alert(response);
						$("#quotation_enquiry_file_" + $di_tour_carousel_image_id).hide();
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



	/*  >>> ADDING MORE GALLERY FILES*/

	var append_id_gallery = 1;

	function addNewRFQDeatilLine_gallery(id_gallery = 0) {
		append_id_gallery++;
		Pace.restart();
		$.ajax({
			url: "<?= MAINSITE_Admin . $user_access->class_name . '/addNewLine_gallery' ?>",
			type: 'post',
			dataType: "json",
			data: { 'id_gallery': id_gallery, 'append_id_gallery': append_id_gallery, "<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>" },
			success: function (response) {
				$(".RFQDetailBody_gallery").append(response.template);
				set_qe_sub_table_count_gallery();
				set_qe_sub_table_remove_btn_gallery();
				calculate_qe_sub_table_price_gallery();
				set_input_element_functions_gallery();
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

	function set_qe_sub_table_count_gallery() {
		var count_gallery = 0;
		$('.qe_sub_table_count_gallery').each(function (index, value) {
			count_gallery++;
			$(this).html(count_gallery + '.');
		});
	}

	function set_qe_sub_table_remove_btn_gallery() {
		$('.qe_sub_table_remove_td_gallery').html('');
		var count_gallery = 0;
		$('.qe_sub_table_remove_td_gallery').each(function (index, value) {
			count_gallery++;
		});
		if (count_gallery > 1) {
			$('.qe_sub_table_remove_td_gallery').html('<button class="btn btn-outline-danger btn-xs" onclick="remove_qe_sub_table_row_gallery($(this))" title="remove"><i class="fas fa-trash"></i></button>');
		}
	}

	function remove_qe_sub_table_row_gallery(row) {
		row.closest('tr').remove();
		set_qe_sub_table_remove_btn_gallery();
		set_qe_sub_table_count_gallery();
	}



	function del_gallery($di_tour_gallery_image_id) {
		if (parseInt($di_tour_gallery_image_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_file' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "di_tour_gallery_image",
						"id_column": "di_tour_gallery_image_id",
						'id': $di_tour_gallery_image_id,
						"folder_name": "di_tour_gallery_image",
						"<?= $csrf['name'] ?>": "<?= $csrf['hash'] ?>"
					},
					success: function (response) {
						toastrDefaultSuccessFunc("Record Deleted Successfully");
						window.location.reload();
						//alert(response);
						$("#quotation_enquiry_file_" + $di_tour_gallery_image_id).hide();
					},
					error: function (request, error) {
						toastrDefaultErrorFunc("Unknown Error. Please Try Again");
					}
				});
			}
		}

		return false;
	}
	/* <<<< ADDING MORE GALLERY FILES*/

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


	function del_tdate($tour_date_id) {
		if (parseInt($tour_date_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "di_tour_date",
						"id_column": "tour_date_id",
						'id': $tour_date_id,
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


	function del_ttc($di_tour_things_to_carry_id) {
		if (parseInt($di_tour_things_to_carry_id) > 0) {
			var s = confirm('You want to delete this file?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "di_tour_things_to_carry",
						"id_column": "di_tour_things_to_carry_id",
						'id': $di_tour_things_to_carry_id,
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


	function del_plan($di_tour_plan_id) {
		if (parseInt($di_tour_plan_id) > 0) {
			var s = confirm('You want to delete this record?');
			if (s) {
				$.ajax({
					url: "<?= MAINSITE_Admin . 'Ajax/del_any_record' ?>",
					type: 'post',
					//dataType: "json",
					data: {
						"table_name": "di_tour_tour_plan",
						"id_column": "di_tour_plan_id",
						'id': $di_tour_plan_id,
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
	document.addEventListener('DOMContentLoaded', function () {

		// Show the discounted price field by default if "Yes" is selected
		toggleDiscountFields();
	});

	function toggleDiscountFields() {
		var isDiscountYes = document.getElementById('is_discount_yes').checked;
		var discountedPriceField = document.getElementById('discounted_price');

		if (isDiscountYes) { // "1" for Yes
			discountedPriceField.style.display = 'block';
			discountedPriceField.removeAttribute('readonly');
		} else { // "0" for No
			discountedPriceField.style.display = 'block';
			discountedPriceField.setAttribute('readonly', true);
			discountedPriceField.value = '0';
		}
	}
</script>