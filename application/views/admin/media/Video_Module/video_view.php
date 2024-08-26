<?php

$page_module_name = "Video";

?>
<?
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
                            <?= $video_data->file_title ?>
                        </h3>
                        <div class="float-right">
                            <?php
                            if ($user_access->add_module == 1 && false) {
                                ?>
                                <a href="<?= MAINSITE_Admin . $user_access->class_name ?>/video-edit">
                                    <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Add
                                        New</button></a>
                            <? } ?>
                            <?php
                            if ($user_access->update_module == 1) {
                                ?>
                                <a
                                    href="<?= MAINSITE_Admin . $user_access->class_name ?>/video-edit/<?= $video_data->video_id ?>">
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
                            <?php echo form_open(MAINSITE_Admin . "$user_access->class_name/video-doUpdateStatus", array('method' => 'post', 'id' => 'ptype_list_form', "name" => "ptype_list_form", 'style' => '', 'class' => 'form-horizontal', 'role' => 'form', 'enctype' => 'multipart/form-data')); ?>

                            <table id="" class="table table-bordered table-hover myviewtable responsiveTableNewDesign">
                                <tbody>
                                    <tr>

                                        <td>
                                            <strong class="full">Data Base Id</strong>
                                            <?= $video_data->video_id ?>
                                        </td>
                                        <td colspan="2">
                                        <strong class="full">Video Title</strong>
                                        <span class="text-danger text-bold">
                                        <?php if (!empty($video_data->file_title)): ?>
														<?= $video_data->file_title ?>
													<?php else: ?>
														-
													<?php endif; ?>
                                        </span>
                                       
                                        </td>

                                        <td colspan="2">
                                            <strong class="full">Video Position Number</strong>
                                            <?= $video_data->position ?>
                                        </td>

                                     

                                     
                                    </tr>

                                    <tr>
                                    
                                        <td colspan="5">
                                            <strong class="full">Video Code</strong><? if (!empty($video_data->file)) { ?>
                                                <?= $video_data->file ?>
                                            <? } else { ?>
                                                -
                                            <? } ?>
                                            <? if (!empty($video_data->file)) { ?>
                                                <div class="video-item">
            <iframe width="400" height="350" src="https://www.youtube.com/embed/<?= $video_data->file ?>"
              title="False ceiling design for Home" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
          </div>
                                            <? } else { ?>
                                                -
                                            <? } ?>
                                        </td>
                                        

                                    </tr>
                                  

                                    

                                   

                                    
                                   

                  
                    <tr>
                        <td>
                            <strong class="full">Added On</strong>
                            <?= date("d-m-Y h:i:s A", strtotime($video_data->added_on)) ?>
                        </td>
                        <td>
                            <strong class="full">Added By</strong>
                            <?= $video_data->added_by_name ?>
                        </td>
                        <td>
                            <strong class="full">Updated On</strong>
                            <? if (!empty($video_data->updated_on)) {
                                echo date("d-m-Y h:i:s A", strtotime($video_data->updated_on));
                            } else {
                                echo "-";
                            } ?>
                        </td>
                        <td>
                            <strong class="full">Updated By</strong>
                            <? if (!empty($video_data->updated_by_name)) {
                                echo $video_data->updated_by_name;
                            } else {
                                echo "-";
                            } ?>
                        </td>
                        <td>
                            <strong class="full">Status</strong>
                            <? if ($video_data->status == 1) { ?> Active <i
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