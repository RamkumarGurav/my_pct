<!-- Body main wrapper start -->
<main class="main-area fix">

  <!-- Banner area start -->
  <section class="bd-breadcrumb-area p-relative fix">
    <!-- breadcrumb background image -->
    <div class="bd-breadcrumb-bg" data-background="<?= IMAGE ?>breadcrumb-bg.png"
      style="background-image: url(&quot;<?= IMAGE ?>breadcrumb-bg.png&quot;);"></div>
    <div class="bd-breadcrumb-wrapper p-relative">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-12">
            <div class=" d-flex align-items-center justify-content-center">
              <div class="bd-breadcrumb-content text-center">
                <h1 class="bd-breadcrumb-title">Gallery</h1>
                <div class="bd-breadcrumb-list" style="margin-bottom:50px;">
                  <span><a href="<?= MAINSITE ?>"><i class="fa fa-home"></i>Home</a></span>
                  <span>Gallery</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


  <section class="gallery-area section-space">
    <div class="container">
      <div class="row gy-24 align-items-center justify-content-between section-title-space">
        <!--  <div class="col-lg-8 col-md-8">
                        <div class="section-title-wrapper section-space1">
                            <span class="section-subtitle mb-10">Memories</span>
                            <h2 class="section-title ">Our Gallery</h2>
                        </div>
                    </div> -->

      </div>
      <div class="row section-space">
        <?php if (!empty($gallery_data)): ?>
          <?php foreach ($gallery_data as $item): ?>
            <div class="col-lg-4">
              <a class="fancybox-buttons" data-fancybox-group="button" class="thumbnail"
                href="<?= _uploaded_files_ . 'main_gallery/' . $item->file ?>">
                <div class="gal-item">
                  <img src="<?= _uploaded_files_ . 'main_gallery/' . $item->file ?>">
                </div>
              </a>
            </div>
          <?php endforeach; ?>
        <?php endif; ?>



      </div>
    </div>
  </section>


  <!-- cta area start -->
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



</main>
<!-- Body main wrapper end -->