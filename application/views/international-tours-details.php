<style>
  input.parsley-success,
  select.parsley-success,
  textarea.parsley-success {
    color: #468847;
    background-color: #dff0d8;
    border: 1px solid #d6e9c6;
  }

  input.parsley-error,
  select.parsley-error,
  textarea.parsley-error {
    color: #b94a48;
    background-color: #f2dede;
    border: 1px solid #eed3d7;
  }

  .parsley-errors-list {
    margin: 2px 0 3px;
    padding: 0;
    list-style-type: none;
    font-size: 0.9em;
    line-height: 0.9em;
    opacity: 0;
    transition: all 0.3s ease-in;
    -o-transition: all 0.3s ease-in;
    -moz-transition: all 0.3s ease-in;
    -webkit-transition: all 0.3s ease-in;
    color: #ff0000;
  }

  .parsley-errors-list.filled {
    opacity: 1;
  }

  input[type="number"] {
    -moz-appearance: textfield;
  }

  ul.parsley-errors-list {
    order: 2;
    width: 100%;
    margin-top: 8px;
    margin-bottom: 0;
  }
</style>


<!-- Body main wrapper start -->
<main class="main-area fix">
  <section class="bd-breadcrumb-area p-relative fix">
    <!-- breadcrumb background image -->
    <div class="bd-breadcrumb-bg"
      data-background="<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>"
      style="background-image: url(&quot;<?= _uploaded_files_ . 'di_tour_banner_image/' . $di_tour_data->banner_image ?>&quot;);">
    </div>
    <div class="bd-breadcrumb-wrapper p-relative">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-12">
            <div class=" d-flex align-items-center justify-content-center">
              <div class="bd-breadcrumb-content text-center">
                <h1 class="bd-breadcrumb-title"><?= $di_tour_data->name ?></h1>
                <div class="bd-breadcrumb-list" style="margin-bottom:50px;">
                  <span><a href="<?= MAINSITE ?>"><i class="fa fa-home"></i>Home</a></span>
                  <span><?= $di_tour_data->name ?></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


  <section class="bd-destinations-details-area section-space">
    <div class="container">
      <div class="row gy-24">
        <div class="col-xxl-8 col-xl-8 col-lg-8">
          <div class="tour-details-wrapper">
            <div class="tour-details mb-25">
              <?php if (!empty($di_tour_data->di_tour_carousel_image)): ?>
                <div class="destinations-details-slider details-slide p-relative mb-30">
                  <div
                    class="swiper details-slide-activation swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
                    <div class="swiper-wrapper" id="swiper-wrapper-a76d7374f56fc2a4" aria-live="polite"
                      style="transform: translate3d(0px, 0px, 0px);">
                      <?php foreach ($di_tour_data->di_tour_carousel_image as $item): ?>
                        <div class="swiper-slide swiper-slide-active" role="group" aria-label="1 / 3"
                          style="width: 856px; margin-right: 24px;">
                          <img src="<?= _uploaded_files_ . 'di_tour_carousel_image/' . $item->file ?>" alt="image">
                        </div>
                      <?php endforeach; ?>


                    </div>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                  </div>
                  <div class="details-slide-navigation btn-navigation">
                    <button class="tourigo-navigation-prev swiper-button-disabled" disabled="" tabindex="-1"
                      aria-label="Previous slide" aria-controls="swiper-wrapper-a76d7374f56fc2a4" aria-disabled="true"><i
                        class="fa-regular fa-angle-left"></i></button>
                    <button class="tourigo-navigation-next" tabindex="0" aria-label="Next slide"
                      aria-controls="swiper-wrapper-a76d7374f56fc2a4" aria-disabled="false"><i
                        class="fa-regular fa-angle-right"></i></button>
                  </div>
                </div>
              <?php endif; ?>

              <div class="tour-details-content">
                <!-- <div class="tour-details-badge d-flex gap--5 mb-10">
                  <span class="bd-badge warning fw-5">Featured</span>
                  <span class="bd-badge danger fw-5">15% Off</span>
                </div> -->
                <h3 class="tour-details-title mb-15"><?= $di_tour_data->name ?></h3>
                <div class="tour-details-meta d-flex flex-wrap gap-10 align-items-center justify-content-between mb-20">
                  <div class="tour-details-price">
                    <h4 class="price-title">International Tours<span></span></h4>
                  </div>
                  <!-- <div
                    class="tour-details-meta-right d-flex flex-wrap gap-10 align-items-center justify-content-between">
                    <div class="rating-badge border-badge"><span><i class="fa fa-star"></i>4.4</span></div>
                    <div class="theme-social">
                      <a href="#"><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                          xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                          viewBox="0 0 24 24">
                          <path fill-rule="evenodd"
                            d="M13.135 6H15V3h-1.865a4.147 4.147 0 0 0-4.142 4.142V9H7v3h2v9.938h3V12h2.021l.592-3H12V6.591A.6.6 0 0 1 12.592 6h.543Z"
                            clip-rule="evenodd"></path>
                        </svg></a>
                      <a href="#"><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                          xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                          viewBox="0 0 24 24">
                          <path fill-rule="evenodd"
                            d="M22 5.892a8.178 8.178 0 0 1-2.355.635 4.074 4.074 0 0 0 1.8-2.235 8.343 8.343 0 0 1-2.605.981A4.13 4.13 0 0 0 15.85 4a4.068 4.068 0 0 0-4.1 4.038c0 .31.035.618.105.919A11.705 11.705 0 0 1 3.4 4.734a4.006 4.006 0 0 0 1.268 5.392 4.165 4.165 0 0 1-1.859-.5v.05A4.057 4.057 0 0 0 6.1 13.635a4.192 4.192 0 0 1-1.856.07 4.108 4.108 0 0 0 3.831 2.807A8.36 8.36 0 0 1 2 18.184 11.732 11.732 0 0 0 8.291 20 11.502 11.502 0 0 0 19.964 8.5c0-.177 0-.349-.012-.523A8.143 8.143 0 0 0 22 5.892Z"
                            clip-rule="evenodd"></path>
                        </svg></a>
                      <a href="#"><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                          xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                          viewBox="0 0 24 24">
                          <path fill-rule="evenodd"
                            d="M12.51 8.796v1.697a3.738 3.738 0 0 1 3.288-1.684c3.455 0 4.202 2.16 4.202 4.97V19.5h-3.2v-5.072c0-1.21-.244-2.766-2.128-2.766-1.827 0-2.139 1.317-2.139 2.676V19.5h-3.19V8.796h3.168ZM7.2 6.106a1.61 1.61 0 0 1-.988 1.483 1.595 1.595 0 0 1-1.743-.348A1.607 1.607 0 0 1 5.6 4.5a1.601 1.601 0 0 1 1.6 1.606Z"
                            clip-rule="evenodd"></path>
                          <path d="M7.2 8.809H4V19.5h3.2V8.809Z"></path>
                        </svg></a>
                      <a href="#"><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                          xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                          viewBox="0 0 24 24">
                          <path fill-rule="evenodd"
                            d="M21.7 8.037a4.26 4.26 0 0 0-.789-1.964 2.84 2.84 0 0 0-1.984-.839c-2.767-.2-6.926-.2-6.926-.2s-4.157 0-6.928.2a2.836 2.836 0 0 0-1.983.839 4.225 4.225 0 0 0-.79 1.965 30.146 30.146 0 0 0-.2 3.206v1.5a30.12 30.12 0 0 0 .2 3.206c.094.712.364 1.39.784 1.972.604.536 1.38.837 2.187.848 1.583.151 6.731.2 6.731.2s4.161 0 6.928-.2a2.844 2.844 0 0 0 1.985-.84 4.27 4.27 0 0 0 .787-1.965 30.12 30.12 0 0 0 .2-3.206v-1.516a30.672 30.672 0 0 0-.202-3.206Zm-11.692 6.554v-5.62l5.4 2.819-5.4 2.801Z"
                            clip-rule="evenodd"></path>
                        </svg></a>
                    </div>
                  </div> -->
                </div>
                <div class="tour-details-destination-wrapper">
                  <div class="tour-details-destination-info">
                    <div class="search-icon-bg is-big">
                      <span><i class="fa-light fa-clock"></i></span>
                    </div>
                    <div class="tour-details-destination-info-title">
                      <p class="tour-details-destination-info-top mb-0">Duration</p>
                      <span class="tour-details-destination-info-bottom small">
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
                      </span>
                    </div>
                  </div>
                  <div class="tour-details-destination-info">
                    <div class="search-icon-bg is-big">
                      <span><i class="fa-light fa-user"></i></span>
                    </div>
                    <div class="tour-details-destination-info-title">
                      <p class="tour-details-destination-info-top mb-0">Min Age</p>
                      <span class="tour-details-destination-info-bottom small"><?= $di_tour_data->minimum_age ?></span>
                    </div>
                  </div>
                  <div class="tour-details-destination-info">
                    <div class="search-icon-bg is-big">
                      <span><i class="fa-sharp fa-light fa-moped"></i></span>
                    </div>
                    <div class="tour-details-destination-info-title">
                      <p class="tour-details-destination-info-top mb-0">Tour Type</p>
                      <span class="tour-details-destination-info-bottom small"><?= $di_tour_data->tour_type ?></span>
                    </div>
                  </div>
                  <div class="tour-details-destination-info">
                    <div class="search-icon-bg is-big">
                      <span><i class="fa-light fa-location-dot"></i></span>
                    </div>
                    <div class="tour-details-destination-info-title">
                      <p class="tour-details-destination-info-top mb-0">Location</p>
                      <span class="tour-details-destination-info-bottom"><?= $di_tour_data->location ?></span>
                    </div>
                  </div>
                </div>

                <?php if (!empty($di_tour_data->description)): ?>
                  <?= $di_tour_data->description ?>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->di_tour_plan)): ?>
                  <div class="tour-details-faq mb-35">
                    <h4 class="mb-20">Tour Plan</h4>
                    <div class="accordion-wrapper faq-style-3">
                      <div class="accordion" id="accordionExampleThree">

                        <?php if (!empty($di_tour_data->di_tour_plan)): ?>
                          <?php foreach ($di_tour_data->di_tour_plan as $item): ?>
                            <div class="accordion-item">
                              <h6 class="accordion-header" id="heading<?= $item->day_number ?>">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                  data-bs-target="#collapse<?= $item->day_number ?>" aria-expanded="true"
                                  aria-controls="collapse<?= $item->day_number ?>">
                                  <span>Day <?= $item->day_number ?>:</span> <?= $item->day_name ?>
                                </button>
                              </h6>
                              <div id="collapse<?= $item->day_number ?>" class="accordion-collapse collapse "
                                aria-labelledby="heading<?= $item->day_number ?>" data-bs-parent="#accordionExampleThree">
                                <div class="accordion-body">
                                  <div class="accordion-body-list">
                                    <?= $item->day_plan ?>
                                  </div>
                                </div>
                              </div>
                            </div>
                          <?php endforeach; ?>
                        <?php else: ?>

                          <p>-</p>
                        <?php endif; ?>



                      </div>
                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->di_tour_gallery_image)): ?>
                  <div class="tour-details-gallery mb-35">
                    <h4 class="mb-20">Tour Galley</h4>
                    <div class="row gy-24">
                      <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                        <a class="fancybox-buttons" data-fancybox-group="button" class="thumbnail"
                          href="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[0]->file ?>">
                          <div class="tour-details-gallery-thumb image-hover-effect-two position-relative h-100">
                            <img class="h-100 w-100"
                              src="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[0]->file ?>"
                              alt="image">
                          </div>
                        </a>
                      </div>
                      <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                        <div class="row gy-24">
                          <div class="col-xxl-12">
                            <a class="fancybox-buttons" data-fancybox-group="button" class="thumbnail" target="_blank"
                              href="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[1]->file ?>">
                              <div class="tour-details-gallery-thumb image-hover-effect-two position-relative">
                                <img
                                  src="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[1]->file ?>"
                                  alt="image">
                              </div>
                            </a>
                          </div>
                          <div class="col-xxl-12">
                            <a class="fancybox-buttons" data-fancybox-group="button" class="thumbnail"
                              href="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[2]->file ?>">
                              <div class="tour-details-gallery-thumb image-hover-effect-two position-relative">
                                <img
                                  src="<?= _uploaded_files_ . 'di_tour_gallery_image/' . $di_tour_data->di_tour_gallery_image[2]->file ?>"
                                  alt="image">
                              </div>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->di_tour_things_to_carry)): ?>
                  <div class="tour-details-list-wrap mb-35">
                    <h4 class="mb-20">Things to Carry</h4>
                    <div class="tour-details-list-box">
                      <div class="tour-details-list-include">
                        <ul>
                          <?php foreach ($di_tour_data->di_tour_things_to_carry as $item): ?>
                            <li>
                              <span class="list-icon success">
                                <i class="fa-solid fa-check"></i>
                              </span>
                              <?= $item->name ?>
                            </li>
                          <?php endforeach; ?>



                        </ul>
                      </div>

                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->inclusion)): ?>
                  <div class="tour-details-list-wrap mb-35">
                    <h4 class="mb-20">Inclusion</h4>
                    <div style="padding-left:30px;">
                      <?= $di_tour_data->inclusion ?>

                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->exclusion)): ?>
                  <div class="tour-details-list-wrap mb-35">
                    <h4 class="mb-20">Exclusion</h4>
                    <div style="padding-left:30px;">
                      <?= $di_tour_data->exclusion ?>

                    </div>
                  </div>

                <?php endif; ?>

                <?php if (!empty($di_tour_data->important_notes)): ?>
                  <div class="tour-details-list-wrap mb-35">
                    <h4 class="mb-20">Important Notes</h4>
                    <div style="padding-left:30px;">

                      <?= $di_tour_data->important_notes ?>
                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->additional_info)): ?>
                  <div class="tour-details-list-wrap mb-35">
                    <h4 class="mb-20">Additional Info</h4>
                    <div style="padding-left:30px;">
                      <?= $di_tour_data->additional_info ?>

                    </div>
                  </div>
                <?php endif; ?>

                <?php if (!empty($di_tour_data->google_map_address)): ?>
                  <div class="tour-details-location mb-35">
                    <h4 class="mb-20">Tour Location</h4>
                    <div class="tour-details-location-map">
                      <iframe src="https://maps.google.com/maps?q=<?= $di_tour_data->google_map_address ?>&output=embed"
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                  </div>
                <?php endif; ?>



              </div>
            </div>
          </div>

        </div>
        <div class="col-xxl-4 col-xl-4 col-lg-4">
          <aside class="sidebar-wrapper sidebar-sticky">
            <div class="sidebar-widget-wrapper mb-30">

              <div class="sidebar-widget widget">
                <h6 class="sidebar-widget-title small mb-15">Contact for Booking</h6>
                <div class="sidebar-booking">
                  <div id="enquiry-form" class="sidebar-booking-form">
                    <form name="bookingform" id="bookingForm"
                      action="<?= MAINSITE . 'ajax_insert_di_tour_booking_enquiry' ?>" onsubmit="submitForm(event)"
                      novalidate="novalidate" accept-charset="utf-8" autocomplete="off" enctype="multipart/form-data"
                      method="POST" data-parsley-validate>
                      <input type="hidden" name="di_tour_id" id="di_tour_id" value="<?= $di_tour_data->di_tour_id ?>" />
                      <input type="hidden" name="subject" id="subject" value="international tours booking" />
                      <input type="hidden" name="page" id="page"
                        value="international-tours-details/<?= $di_tour_data->di_tour_id ?>" />



                      <div class=" input-box">
                        <label for="">Joining Date</label>
                        <input type="date" id="start_date_time" name="start_date_time"
                          style="padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px;width:100%">
                      </div>

                      <div class=" input-box">
                        <input type="text" class="" id="name" name="name" attern="(?=.*[A-Za-z])[A-Za-z\s]*"
                          required="required" data-parsley-required-message="Name is required" placeholder="Name" />
                        <div class="help-block with-errors"></div>
                      </div>
                      <div class="input-box">
                        <input type="text" class="inputText" id="contactno" name="contactno" maxlength="10"
                          pattern="[0-9\\s]{10,10}" required="required"
                          data-parsley-required-message="Contact number is required" data-parsley-type="integer"
                          data-parsley-type-message="Please enter valid contact number" placeholder="Contact Number" />
                        <div class="help-block with-errors"></div>
                      </div>
                      <div class="input-box">
                        <input type="email" class="inputText" id="email" name="email" required
                          data-parsley-required-message="E-mail address is required" data-parsley-type="email"
                          data-parsley-type-message="Please enter valid e-mail address" placeholder="Email" />

                        <div class="help-block with-errors"></div>
                      </div>
                      <div class="input-box">
                        <textarea class="textareaText" id="description" name="description" required=""
                          data-parsley-required-message="Message is required" data-parsley-minlength="10"
                          data-parsley-trigger="keyup"
                          data-parsley-minlength-message="You need to enter at least a 10 character message.."
                          placeholder="Enter Your Message"></textarea>
                        <div class="help-block with-errors"></div>

                      </div>
                      <!-- localhost sitekey: 6LezxwUqAAAAAC7iAfqFV_2G8Q6upDtpVxHnTKQx -->
                      <div class="booking-btn">

                        <button class="g-recaptcha bd-btn btn-style radius-4 w-100" data-callback="onSubmit"
                          style="pointer-events: all; cursor: pointer;"
                          data-sitekey="<?= _google_recaptcha_site_key_ ?>" data-action="submit">Book
                          Now<span><i class="fa-regular fa-arrow-right"></i></span></button>

                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <!-- <div class="sidebar-widget widget">
                <h6 class="sidebar-widget-title small mb-15">Contact for Booking</h6>
                <div class="sidebar-booking">
                  <div id="enquiry-form" class="sidebar-booking-form">
                    <input type="hidden" name="di_tour_id" id="di_tour_id" value="<?= $di_tour_data->di_tour_id ?>" />

                    


                    <div class=" input-box">
                      <label for="">Joining Date</label>
                      <input type="date" id="start_date_time" name="start_date_time"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px;width:100%">
                    </div>

                    <div class=" input-box">
                      <input required type="text" placeholder="Name" name="name" id="name">
                    </div>
                    <div class="input-box">
                      <input required type="text" placeholder="Contact Number" name="contactno" id="contactno">
                    </div>
                    <div class="input-box">
                      <input required type="email" placeholder="Email" name="email" id="email">
                    </div>
                    <div class="input-box">
                      <textarea required cols="30" rows="10" placeholder="Type Comment here" name="description"
                        id="description"></textarea>
                    </div>
                    <div class="booking-btn">
                      <button onclick="ajax_insert_di_tour_booking_enquiry()"
                        class="bd-btn btn-style radius-4 w-100">Book
                        Now<span><i class="fa-regular fa-arrow-right"></i></span></button>
                    </div>
                  </div>
                </div>
              </div> -->

            </div>
            <div class="sidebar-widget-banner p-relative">
              <div class="sidebar-widget-thumb p-relative">
                <img src="<?= IMAGE ?>sidebar-img.png" alt="img">
              </div>
              <div class="sidebar-widget-content">
                <span class="bd-play-btn pulse-white mb-40"><i class="fa fa-phone"></i></span>
                <p class="b3 mb-0">Free Call</p>
                <h5 class="mb-25"><a href="tel:+919980808500">99808 08500</a></h5>
                <div class="offer-btn">
                  <a href="<?= MAINSITE ?>contact"
                    class="bd-primary-btn btn-style has-arrow is-bg btn-tertiary is-white radius-60">
                    <span class="bd-primary-btn-arrow arrow-right"><i class="fa-regular fa-arrow-right"></i></span>
                    <span class="bd-primary-btn-text">contact</span>
                    <span class="bd-primary-btn-circle"></span>
                    <span class="bd-primary-btn-arrow arrow-left"><i class="fa-regular fa-arrow-right"></i></span>
                  </a>

                </div>

              </div>
            </div>
          </aside>
        </div>
      </div>
    </div>
  </section>






</main>
<!-- Body main wrapper end -->
<section class="bd-cta-section theme-bg fix p-relative">
  <div class="cta-shape-bg" data-background="<?= IMAGE ?>cta/cta-img-2-bg.png">
  </div>
  <div class="container">
    <div class="cta-three-shape">
      <div class="cta-three-shape-one p-absolute">
        <img src="<?= IMAGE ?>shapes/cta-star.png" alt="shape">
      </div>
      <div class="cta-three-shape-two p-absolute">
        <img src="<?= IMAGE ?>shapes/cta-eye.png" alt="shape">
      </div>
      <div class="cta-three-shape-three p-absolute">
        <img src="<?= IMAGE ?>shapes/cta-x.png" alt="shape">
      </div>
      <div class="cta-three-shape-four p-absolute">
        <img src="<?= IMAGE ?>shapes/cta-star.png" alt="shape">
      </div>
      <div class="cta-three-shape-six p-absolute">
        <img src="<?= IMAGE ?>shapes/cta-x.png" alt="shape">
      </div>
    </div>
    <div class="row align-items-center">
      <div class="col-xl-6 col-lg-4 order-lg-0 order-1 wow fadeInLeft">
        <div class="cta-thumb-wrap cta-style-two p-relative">
          <div class="cta-thumb-two">
            <img src="<?= IMAGE ?>cta/cta-img-2.png" alt="image">
          </div>
        </div>
      </div>
      <div class="col-xl-5 col-lg-6 order-lg-1 order-0">
        <div class="cta-wrapper cta-style-two">
          <div class="section-title-wrapper mb-35">
            <h2 class="section-title small white-text mb-15">Subscribe To Our Mailing List & Stay Up To Date
            </h2>
            <p class="white-text">Share the core values and principles that drive your company Emphasize a
              commitment to customer satisfaction</p>
            <div class="cta-form">
              <form action="#">
                <div class="cta-input white-button">
                  <input type="text" placeholder="Your email address">
                  <button type="submit" class="bd-primary-btn btn-style has-arrow is-bg radius-8">
                    <span class="bd-primary-btn-arrow arrow-right"><i class="fa-regular fa-arrow-right"></i></span>
                    <span class="bd-primary-btn-text">Subscribe Now</span>
                    <span class="bd-primary-btn-circle"></span>
                    <span class="bd-primary-btn-arrow arrow-left"><i class="fa-regular fa-arrow-right"></i></span>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- cta area end -->





<script type="text/javascript" src="<?= JS ?>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<?= JS ?>parsley.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script>
  var formCounter = 0;
  function submitForm(event) {
    formCounter++;
    if (formCounter > 1) {
      event.preventDefault();
      return false;
    }
  }

  function onSubmit(token) {
    $("#bookingForm").submit();

    alert($("#bookingForm").parsley().isValid());
    //contactvalidateForm();
    if (!$("#bookingForm").parsley().isValid()) {
      alert("if");
      $("#bookingForm").parsley().validate();
      return false;
    }
    else {
      alert("else");
      $("#bookingForm").submit();
      return true;
    }
  }

</script>




<script>


  // function validateForm() {
  //   var isValid = true;

  //   $('#enquiry-form .input-box input, #enquiry-form .input-box textarea').each(function () {
  //     if ($(this).val() === "" || $(this).val() === null) {
  //       isValid = false;
  //       $(this).css('border-color', 'red');
  //     } else {
  //       $(this).css('border-color', '');
  //     }
  //   });

  //   return isValid;
  // }

  // function clearForm() {
  //   $('#start_date_time').val("");
  //   $('#name').val("");
  //   $('#contactno').val("");
  //   $('#email').val("");
  //   $('#description').val("");
  // }

  // function ajax_insert_di_tour_booking_enquiry() {
  //   if (!validateForm()) {
  //     alert('Please fill in all the fields.');
  //     return;
  //   }

  //   var formData = {
  //     di_tour_id: $('#di_tour_id').val(),
  //     start_date_time: $('#start_date_time').val(),
  //     name: $('#name').val(),
  //     contactno: $('#contactno').val(),
  //     email: $('#email').val(),
  //     subject: "international tours booking",
  //     description: $('#description').val(),
  //   };

  //   $.ajax({
  //     url: "<?= MAINSITE . 'ajax_insert_di_tour_booking_enquiry' ?>",
  //     type: 'post',
  //     data: formData,
  //     success: function (response) {
  //       toastrDefaultSuccessFunc("Booking Success!");
  //       clearForm();


  //     },
  //     error: function (request, error) {
  //       // Handle any errors
  //       toastrDefaultErrorFunc("Unknown Error. Please Try Again");
  //     }
  //   });
  // }




</script>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    setMinDate();
  });


  function setMinDate() {
    var today = new Date().toISOString().split('T')[0];
    document.getElementById('start_date_time').setAttribute('min', today);








  }
</script>