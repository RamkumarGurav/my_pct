<!-- Body main wrapper start -->
<main class="main-area fix">
  <section class="bd-breadcrumb-area p-relative fix">

    <!-- breadcrumb background image -->
    <div class="bd-breadcrumb-bg" data-background="<?= IMAGE ?>breadcrumb-bg.png"></div>

    <div class="bd-breadcrumb-wrapper p-relative">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-12">

            <div class=" d-flex align-items-start justify-content-center">
              <div class="bd-breadcrumb-content text-center">
                <h1 class="bd-breadcrumb-title">Activities</h1>
                <div class="bd-breadcrumb-list" style="margin-bottom:50px">
                  <span><a href="<?= MAINSITE ?>"><i class="fa fa-home"></i>Home</a></span>
                  <span>Activities</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="bd-tour-grid-area section-space">
    <div class="container">
      <div class="row gy-24">
        <div class="col-xxl-8 col-xl-8 col-lg-9">
          <div class="row gy-24">
            <?php if (!empty($tour_data)): ?>
              <?php foreach ($tour_data as $item): ?>
                <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                  <div class="tour-wrapper style-one">
                    <div class="p-relative">
                      <div class="tour-thumb image-overly">
                        <a href="<?= MAINSITE ?>activities-details/<?= $item->tour_id ?>"><img
                            src="<?= _uploaded_files_ ?>cover_image/<?= $item->cover_image ?>" alt="image"></a>
                      </div>
                      <div class="trip-tag">
                        <a class="trip-tag-border" href="#"><?= $item->available_slots ?> Slots Available</a>
                      </div>
                      <div class="tour-meta d-flex align-items-center justify-content-between">
                        <!-- <button class="tour-favorite tour-like">
                        <i class="fa-solid fa-heart"></i>
                      </button> -->
                        <div class="tour-location">
                          <span><a href="#">
                              <?php if (!empty($item->duration_day)) {
                                $dayLabel = 'D';
                                echo $item->duration_day . '' . $dayLabel . ' ';
                              }
                              ?>
                              <?php if (!empty($item->duration_night)) {
                                $nightLabel = 'N';
                                echo $item->duration_night . '' . $nightLabel;
                              }
                              ?>

                            </a></span>
                        </div>
                      </div>
                    </div>
                    <div class="tour-content">

                      <h5 class="tour-title fw-5 underline "><a
                          href="<?= MAINSITE ?>activities-details/<?= $item->tour_id ?>"><?= $item->name ?></a>
                      </h5>



                      <?php if (!empty($item->tour_date)): ?>
                        <section>
                          <div class="btn-group" style="width:100%">
                            <button id="dropdownMenuButton" type="button" style="width:100%"
                              class="btn bg-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false">
                              <a class="dropdown-item d-flex justify-content-between align-items-center" href="#" onclick="updateButtonText('<?php echo $item->tour_date[0]->start_date_time; ?>', 
                              '<?php echo formatIndianCurrency($item->tour_date[0]->discounted_price); ?>')">
                                <div class="blog-meta-item">
                                  <span class="meta-icon">
                                    <i class="fa-solid fa-calendar-check"></i>
                                  </span>
                                  <span class="meta-text"><?php echo $item->tour_date[0]->start_date_time; ?></span>
                                </div>
                                <?php if (empty($item->tour_date[0]->is_discount)): ?>
                                  <span style="font-size:1.5rem;font-weight:bold;color: green;">
                                    ₹<?= formatIndianCurrency($item->tour_date[0]->actual_price) ?></span>
                                <?php else: ?>
                                  <div>
                                    <span class="text-muted ">
                                      <del
                                        style="font-size:1.2rem;">₹<?= formatIndianCurrency($item->tour_date[0]->actual_price) ?></del>
                                    </span>
                                    <span class=" font-weight-bold" style="font-size:1.5rem;font-weight:bold;color: green;">
                                      ₹<?= formatIndianCurrency($item->tour_date[0]->discounted_price) ?>
                                    </span>
                                  </div>

                                <?php endif; ?>

                              </a>
                            </button>
                            <div class="dropdown-menu" style="width:100%" aria-labelledby="dropdownMenuButton">
                              <?php foreach ($item->tour_date as $item1): ?>
                                <a class="dropdown-item d-flex justify-content-between align-items-center"
                                  href="<?= MAINSITE ?>activities-details/<?= $item->tour_id ?>?tour_date_id=<?= $item1->tour_date_id ?>"
                                  onclick="updateButtonText('<?php echo $item1->start_date_time; ?>', '<?php echo $item1->discounted_price; ?>')">
                                  <div class="blog-meta-item">
                                    <span class="meta-icon">
                                      <i class="fa-solid fa-calendar-check"></i>
                                    </span>
                                    <span class="meta-text"><?php echo $item1->start_date_time; ?></span>
                                  </div>
                                  <?php if (empty($item1->is_discount)): ?>
                                    <span class="" style="font-size:1.5rem;font-weight:bold;color: green;">
                                      ₹<?= formatIndianCurrency($item1->actual_price) ?></span>
                                  <?php else: ?>
                                    <div>
                                      <span class="text-muted ">
                                        <del style="font-size:1.2rem;">₹<?= formatIndianCurrency($item1->actual_price) ?></del>
                                      </span>
                                      <span class=" font-weight-bold" style="font-size:1.5rem;font-weight:bold;color: green;">
                                        ₹<?= formatIndianCurrency($item1->discounted_price) ?>
                                      </span>
                                    </div>

                                  <?php endif; ?>
                                </a>
                              <?php endforeach; ?>
                            </div>
                          </div>
                        </section>
                      <?php endif; ?>




                    </div>
                  </div>
                </div>
              <?php endforeach; ?>
            <?php endif; ?>













          </div>
        </div>
        <div class="col-xxl-4 col-xl-4 col-lg-3">
          <aside class="sidebar-wrapper sidebar-sticky">
            
            <div class="sidebar-widget-banner p-relative">
              <div class="sidebar-widget-thumb p-relative">
                <img src="<?= IMAGE ?>sidebar-img.png" alt="img">
              </div>
              <div class="sidebar-widget-content">
                <span class="bd-play-btn pulse-white mb-40"><i class="fa fa-phone"></i></span>
                <p class="b3 mb-0">Free Call</p>
                <h5 class="mb-25"><a href="tel:+919980808500">99808 08500</a></h5>
                <div class="sidebar-btn">
                  <a class="bd-text-btn style-two" href="<?= MAINSITE ?>contact">Contact
                    <span class="icon__box">
                      <i class="fa-light fa-angle-right icon__first"></i>
                      <i class="fa-light fa-angle-right icon__second"></i>
                    </span>
                  </a>
                </div>
              </div>
            </div>
          </aside>
        </div>
      </div>
      
    </div>
  </section>
</main> <!-- cta area end -->
<!-- Ensure you include the necessary Bootstrap 4 JS and jQuery files -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>