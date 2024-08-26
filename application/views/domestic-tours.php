<?php



?>

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
                <h1 class="bd-breadcrumb-title">Domestic Tours</h1>
                <div class="bd-breadcrumb-list" style="margin-bottom:50px">
                  <span><a href="<?= MAINSITE ?>"><i class="fa fa-home"></i>Home</a></span>
                  <span>Domestic Tours</span>
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
        <div class="col-xxl-8 col-xl-8 col-lg-7">
          <div class="row gy-24">

            <?php foreach ($di_tour_data as $item): ?>
              <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                <div class="tour-wrapper style-one">
                  <div class="p-relative">
                    <div class="tour-thumb image-overly">
                      <a href="<?= MAINSITE ?>domestic-tours-details/<?= $item->di_tour_id ?>"><img
                          src="<?= _uploaded_files_ ?>di_tour_cover_image/<?= $item->cover_image ?>" alt="image"></a>
                    </div>
                    <!-- <div class="trip-tag">
                      <a class="trip-tag-border" href="#"><?= $item->available_slots ?> Slots Available</a>
                    </div> -->
                    <div class="tour-meta d-flex align-items-center justify-content-between">
                      <!-- <button class="tour-favorite tour-like">
                        <i class="fa-solid fa-heart"></i>
                      </button> -->
                      <span class="tour-price tour-favorite2 text-white">
                        <?php if (empty($item->is_discount)): ?>
                          <span style="color: #FFB700;">
                            ₹<?= formatIndianCurrency($item->actual_price) ?></span>
                        <?php else: ?>
                          <div>
                            <span class="">
                              <del
                                style="font-size:1.2rem;color:#C2C3C2">₹<?= formatIndianCurrency($item->actual_price) ?></del>
                            </span>
                            <span class=" font-weight-bold" style="font-size:1.8rem;font-weight:bold;color: #FFB700;">
                              ₹<?= formatIndianCurrency($item->discounted_price) ?>
                            </span>
                          </div>

                        <?php endif; ?>
                      </span>
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
                        href="<?= MAINSITE ?>domestic-tours-details/<?= $item->di_tour_id ?>"><?= $item->name ?></a></h5>








                  </div>
                </div>
              </div>
            <?php endforeach; ?>

          </div>
        </div>
        <div class="col-xxl-4 col-xl-4 col-lg-5">
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
      <!-- <div class="pagination-wrapper d-flex justify-content-center">
        <div class="basic-pagination">
          <nav>
            <ul>
              <li>
                <a class="current">1</a>
              </li>
              <li>
                <a href="#">2</a>
              </li>
              <li>
                <a href="#">3</a>
              </li>
              <li>
                <a href="#">
                  <i class="fa-light fa-angle-right"></i>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div> -->
    </div>
  </section>
</main> <!-- cta area end -->
<!-- Ensure you include the necessary Bootstrap 4 JS and jQuery files -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>