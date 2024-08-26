<?php

$page_module_name = "Domestic & Int Tours";

?>
<?
$name = "";
$admin_user_id = 0;
$status = 1;
$record_action = "Add New Record";




?>
<!-- /.navbar -->

<!-- Main Sidebar Container -->


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">
                        <?= $page_module_name ?> <small>Details</small>
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
                        <li class="breadcrumb-item active">Details</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <? ?>
    <section class="content">
        <div class="row">
            <div class="col-12">

                <div class="card ">

                    <div class="card-header">
                        <h3 class="card-title">
                            <?= $di_tour_data->name ?>
                        </h3>
                        <div class="float-right">
                            <?php
                            if ($user_access->add_module == 1 && false) {
                                ?>
                                <a href="<?= MAINSITE_Admin . $user_access->class_name ?>/di-tour-edit">
                                    <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Add
                                        New</button></a>
                            <? } ?>
                            <?php
                            if ($user_access->update_module == 1) {
                                ?>
                                <a
                                    href="<?= MAINSITE_Admin . $user_access->class_name ?>/di-tour-edit/<?= $di_tour_data->di_tour_id ?>">
                                    <button type="button" class="btn btn-success btn-sm"><i class="fas fa-edit"></i>
                                        Update</button>
                                </a>
                            <? } ?>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <?php
                    if ($user_access->view_module == 1) {
                        ?>
                        <div class="card-body card-primary card-outline">
                            <?php echo form_open(MAINSITE_Admin . "$user_access->class_name/di-tour-doUpdateStatus", array('method' => 'post', 'id' => 'ptype_list_form', "name" => "ptype_list_form", 'style' => '', 'class' => 'form-horizontal', 'role' => 'form', 'enctype' => 'multipart/form-data')); ?>

                            <table id="" class="table table-bordered table-hover myviewtable responsiveTableNewDesign">
                                <tbody>
                                    <tr>

                                        <td>
                                            <strong class="full">Data Base Id</strong>
                                            <?= $di_tour_data->di_tour_id ?>
                                        </td>
                                        <td>
                                        <strong class="full">Tour Variant</strong>
                                        <span class="text-danger text-bold">
                                        <?php if ($di_tour_data->di_tour_variant == 1): ?>
														Domestic Tours
													<?php elseif ($di_tour_data->di_tour_variant == 2): ?>
														International Tours

													<?php else: ?>
														-
													<?php endif; ?>
                                       
                                        </td>

                                        <td>
                                            <strong class="full">Tour Name</strong>
                                            <?= $di_tour_data->name ?>
                                        </td>

                                        <td>
                                            <strong class="full">Duration</strong>
                                            <?php if (!empty($di_tour_data->duration_day)) {
                                                $dayLabel = ($di_tour_data->duration_day == 1) ? 'Day' : 'Days';
                                                echo $di_tour_data->duration_day . ' ' . $dayLabel . ' ';
                                            }
                                            ?>
                                            <?php if (!empty($di_tour_data->duration_night)) {
                                                $nightLabel = ($di_tour_data->duration_night == 1) ? 'Night' : 'Nights';
                                                echo $di_tour_data->duration_night . ' ' . $nightLabel;
                                            }
                                            ?>
                                        </td>

                                        <!-- <td>
                                            <strong class="full">Available Slots</strong>
                                            <?= $di_tour_data->available_slots ?>
                                        </td> -->
                                       
                                    </tr>

                                    <tr>
                                    <td>
                                            <strong class="full">Minimum Age</strong>
                                            <?= $di_tour_data->minimum_age ?>
                                        </td>
                                        <td>
                                            <strong class="full">Tour Type</strong>
                                            <?= $di_tour_data->tour_type ?>
                                        </td>
                                        <td >
                                            <strong class="full">Location </strong>
                                            <div>
                                                <h6>
                                                    <?= $di_tour_data->location ?>
                                                </h6>
                                            </div>

                                            <div class="map-container">
                                                <iframe
                                                    src="https://maps.google.com/maps?q=<?= $di_tour_data->google_map_address ?>&output=embed"
                                                    class="" width="200" height="150" style="border:0;" allowfullscreen=""
                                                    loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                            </div>

                                        </td>
                                        <td>
                                            <strong class="full">Banner Image</strong>
                                            <? if (!empty($di_tour_data->banner_image)) { ?>
                                                <span class="pip">
                                                    <a target="_blank"
                                                        href="<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>">
                                                        <img class="imageThumb"
                                                            src="<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>" />
                                                    </a>
                                                </span>
                                            <? } else { ?>
                                                <span class="pip">
                                                    <img class="imageThumb" src="<?= MAINSITE ?>assets/images/no_image.jpg" />
                                                </span>
                                            <? } ?>
                                        </td>
                                        <td>
                                            <strong class="full">Cover Image</strong>
                                            <? if (!empty($di_tour_data->cover_image)) { ?>
                                                <span class="pip">
                                                    <a target="_blank"
                                                        href="<?= _uploaded_files_ . 'di_tour_cover_image/' . $di_tour_data->cover_image ?>">
                                                        <img class="imageThumb"
                                                            src="<?= _uploaded_files_ . 'di_tour_cover_image/' . $di_tour_data->cover_image ?>"
                                                            style="max-width:320px;" />
                                                    </a>
                                                </span>
                                            <? } else { ?>
                                                <span class="pip">
                                                    <img class="imageThumb" src="<?= MAINSITE ?>assets/images/no_image.jpg" />
                                                </span>
                                            <? } ?>
                                        </td>

                                    </tr>
                                    <tr>
                                    <td>
                                            <strong class="full">Is There Discount?</strong>
                                          <?php if(!empty($di_tour_data->is_discount)): ?>
                                            <span style="font-weight:bold;color:green;">YES</span>
                                           <?php else: ?>
                                            <span style="font-weight:bold;color:red;">No</span>
                                          <?php endif; ?>
                                        </td>
                                        <td >
                                            <strong class="full">Actual Price</strong>
                                            <span style="font-weight:bold;font-size:1.2rem;">₹ <?= formatIndianCurrency($di_tour_data->actual_price) ?></span>
                                         
                                        </td>
                                        <td colspan="3">
                                            <strong class="full">Discounted Price</strong>
                                            <span style="font-weight:bold;font-size:1.2rem;">₹ <?= formatIndianCurrency($di_tour_data->discounted_price) ?></span>
                                        </td>
                                        

                                    </tr>
                                    <tr>

                                        <td colspan="5">
                                            <strong class="full">Tour Description</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->description)) { ?>
                                                    <?= $di_tour_data->description ?>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>



                                    </tr>

                                    <tr>
                                        <td colspan="5">
                                            <strong class="full">Inclusion</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->inclusion)) { ?>
                                                    <?= $di_tour_data->inclusion ?>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td colspan="5">
                                            <strong class="full">Exclusion</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->exclusion)) { ?>
                                                    <?= $di_tour_data->exclusion ?>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>



                                    </tr>

                                    <tr>
                                        <td colspan="5">
                                            <strong class="full">Important Notes</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->important_notes)) { ?>
                                                    <?= $di_tour_data->important_notes ?>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td colspan="5">
                                            <strong class="full">Additonal Info</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->additional_info)) { ?>
                                                    <?= $di_tour_data->additional_info ?>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>



                                    </tr>

                                    <tr>
                                       

                                        <td colspan="5">
                                            <strong class="full">Things to Carry</strong>
                                            <div>
                                                <?php if (!empty($di_tour_data->di_tour_things_to_carry)) { ?>
                                                    <ol type="1" class="list-styled">
                                                        <?php foreach ($di_tour_data->di_tour_things_to_carry as $ttc) { ?>
                                                            <li>
                                                                <?= $ttc->name ?>
                                                            </li>
                                                        <?php } ?>
                                                    </ol>
                                                <?php } else { ?>
                                                    <p>-</p>
                                                <?php } ?>
                                            </div>
                                        </td>


                                    </tr>

                                    <tr>
                                        <td colspan="5">

                                            <div class="row">

                                                <div class="card " style="width:100%;">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Tour Plan</h3>
                                                    </div>

                                                    <div class="card-body" style="width:100%;">
                                                        <?php for ($i = 0; $i < count($di_tour_data->di_tour_plan); $i++) { ?>
                                                            <div id="accordion" style="width:100%;">
                                                                <div class="card " style="width:100%;">
                                                                    <div class="card-header ">
                                                                        <a class="card-title w-100" data-toggle="collapse"
                                                                            href="#collapse<?= $i ?>" aria-expanded="true">
                                                                            <span>Day
                                                                                <?= $di_tour_data->di_tour_plan[$i]->day_number ?>
                                                                                :</span>
                                                                            <span class=" inline-block ">
                                                                                <?= $di_tour_data->di_tour_plan[$i]->day_name ?>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                    <div id="collapse<?= $i ?>" class="collapse "
                                                                        data-parent="#accordion" style="">
                                                                        <div class="card-body">
                                                                            <?= $di_tour_data->di_tour_plan[$i]->day_plan ?>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td colspan="5">
                                            <div class="row" style="width:100%;">

                                                <?php if (!empty($di_tour_data->di_tour_carousel_image)): ?>
                                                    <div class="card card-primary" style="width:100%;">

                                                        <div class=" d-flex justify-content-between p-2 " style="width:100%;">
                                                            <strong class="full">Carousel Images</strong>
                                                            <h6 class="">Total Images:


                                                                <?= count($di_tour_data->di_tour_carousel_image) ?>
                                                            </h6>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="filter-container p-0 row">
                                                                <?php foreach ($di_tour_data->di_tour_carousel_image as $di_tour_carousel_image): ?>


                                                                    <div class="filtr-item col-sm-3 mb-1"
                                                                        data-category="<?= "1 ,4" ?>" data-sort="white sample"
                                                                        style="width:100%;height:180px;">
                                                                        <a href="<?= _uploaded_files_ . 'di_tour_carousel_image/' . $di_tour_carousel_image->file ?>"
                                                                            data-toggle="lightbox" data-title=""
                                                                            style="height:100%;width:100%;">
                                                                            <img src="<?= _uploaded_files_ . 'di_tour_carousel_image/' . $di_tour_carousel_image->file ?>"
                                                                                class="img-fluid mb-2" alt="" aria-label=""
                                                                                style="height:100%;width:100%;object-fit:cover;" />
                                                                        </a>


                                                                    </div>
                                                                <?php endforeach; ?>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            <?php else: ?>
                                                <div class=" d-flex justify-content-between p-2 " style="width:100%;">
                                                    <strong class="full">Carousel Images</strong>

                                                </div>
                                                <p class="text-center pl-2">-</p>
                                            <?php endif; ?>

                        </div>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div class="row" style="width:100%;">

                                    <?php if (!empty($di_tour_data->di_tour_gallery_image)): ?>
                                        <div class="card card-primary" style="width:100%;">

                                            <div class=" d-flex justify-content-between p-2 " style="width:100%;">
                                                <strong class="full">Gallery Images</strong>
                                                <h6 class="">Total Images:


                                                    <?= count($di_tour_data->di_tour_gallery_image) ?>
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="filter-container p-0 row">
                                                    <?php foreach ($di_tour_data->di_tour_gallery_image as $di_tour_gallery_image): ?>


                                                        <div class="filtr-item col-sm-3 mb-1" data-category="<?= "1 ,4" ?>"
                                                            data-sort="white sample" style="width:100%;height:180px;">
                                                            <a href="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_gallery_image->file ?>"
                                                                data-toggle="lightbox" data-title=""
                                                                style="height:100%;width:100%;">
                                                                <img src="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_gallery_image->file ?>"
                                                                    class="img-fluid mb-2" alt="" aria-label=""
                                                                    style="height:100%;width:100%;object-fit:cover;" />
                                                            </a>


                                                        </div>
                                                    <?php endforeach; ?>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                <?php else: ?>
                                    <div class=" d-flex justify-content-between p-2 " style="width:100%;">
                                        <strong class="full">Gallery Images</strong>

                                    </div>
                                    <p class="text-center pl-2">-</p>
                                <?php endif; ?>

                    </div>
                    </td>
                    </tr>
                    <tr>

                    </tr>

                    <tr>
                        <td>
                            <strong class="full">Added On</strong>
                            <?= date("d-m-Y h:i:s A", strtotime($di_tour_data->added_on)) ?>
                        </td>
                        <td>
                            <strong class="full">Added By</strong>
                            <?= $di_tour_data->added_by_name ?>
                        </td>
                        <td>
                            <strong class="full">Updated On</strong>
                            <? if (!empty($di_tour_data->updated_on)) {
                                echo date("d-m-Y h:i:s A", strtotime($di_tour_data->updated_on));
                            } else {
                                echo "-";
                            } ?>
                        </td>
                        <td>
                            <strong class="full">Updated By</strong>
                            <? if (!empty($di_tour_data->updated_by_name)) {
                                echo $di_tour_data->updated_by_name;
                            } else {
                                echo "-";
                            } ?>
                        </td>
                        <td>
                            <strong class="full">Status</strong>
                            <? if ($di_tour_data->status == 1) { ?> Active <i
                                    class="fas fa-check btn-success btn-sm "></i>
                            <? } else { ?> Block <i class="fas fa-ban btn-danger btn-sm "></i>
                            <? } ?>
                        </td>
                    </tr>

                    </tbody>
                    </table>



                </div>

                <?php echo form_close() ?>
            </div>
        <? } else {
                        $this->data['no_access_flash_message'] = "You Dont Have Access To View " . $page_module_name;
                        $this->load->view('admin/template/access_denied', $this->data);
                    } ?>
        <!-- /.card-body -->
</div>
</div>
</div>


</section>
<? ?>
</div>

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>