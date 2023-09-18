<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>หน้าหลัก</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Squadfree
    * Updated: Jul 27 2023 with Bootstrap v5.3.1
    * Template URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<style>
    #main_header_hero {
        width: 100%;
        height: 100vh;
        background: linear-gradient(rgba(55, 142, 181, 0.5), rgba(55, 142, 181, 0.2)), url("${pageContext.request.contextPath}/assets/img/it3.jpg") top center;
        background-size: cover;
        position: relative;
        margin-bottom: -90px;
    }

    #main_header_hero .hero-container {
        position: absolute;
        bottom: 0;
        top: 0;
        left: 0;
        right: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        text-align: center;
    }

    #main_header_hero h1 {
        margin: 0 0 10px 0;
        font-size: 64px;
        font-weight: 700;
        line-height: 56px;
        text-transform: uppercase;
        color: #fff;
        text-shadow: -1px 0 2px #2f4d5a;
    }

    #main_header_hero h2 {
        color: #fff;
        margin-bottom: 50px;
        font-size: 20px;
        text-transform: uppercase;
        font-weight: 700;
        text-shadow: -1px 0 2px #2f4d5a;
    }

    #main_header_hero .btn-get-started {
        font-size: 36px;
        display: inline-block;
        padding: 4px 0;
        border-radius: 50px;
        transition: 0.3s ease-in-out;
        margin: 10px;
        width: 64px;
        height: 64px;
        text-align: center;
        border: 2px solid #fff;
        color: #fff;
    }

    #main_header_hero .btn-get-started:hover {
        padding-top: 8px;
        background: rgba(255, 255, 255, 0.15);
    }

    @media (min-width: 1024px) {
        #main_header_hero {
            background-attachment: fixed;
        }
    }

    @media (max-width: 768px) {
        #main_header_hero h1 {
            font-size: 28px;
            line-height: 36px;
        }

        #main_header_hero h2 {
            font-size: 18px;
            line-height: 24px;
            margin-bottom: 30px;
        }
    }
    #header {
        transition: all 0.5s;
        z-index: 997;
        transition: all 0.5s;
        padding: 24px 0;
        background: #990D28;
    }

    #header.header-transparent {
        background: transparent;
    }

    #header.header-scrolled {
        background: #990D28;
        padding: 12px;
    }
    .about .content .about-btn {
        display: inline-block;
        background: #990D28;
        padding: 6px 44px 8px 30px;
        color: #fff;
        border-radius: 50px;
        transition: 0.3s;
        position: relative;
    }
</style>
<body>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/>

<!-- ======= Hero Section ======= -->
<section id="main_header_hero">
    <div class="hero-container" data-aos="fade-up">
        <h1>Welcome to ITSCIMJU</h1>
        <h2>We learn to Design, Build and Test IT Solutions for Tomorrow</h2>
        <a href="#about" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
    </div>
</section><!-- End Hero -->

<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container">

            <div class="row no-gutters">
                <div class="content col-xl-5 d-flex align-items-stretch" data-aos="fade-up">
                    <div class="content">
                        <h3>"Design, Build and Test IT"</h3>
                        <p>
                            สาขาวิชาเทคโนโลยีสารสนเทศของเรามีคำขวัญที่ว่า “We learn to Design, Build and Test IT Solutions for Tomorrow.”
                            ซึ่งหมายความว่า พวกเราเรียนรู้ที่จะออกแบบ สร้าง และทดสอบการแก้ปัญหาทางไอทีเพื่ออนาคต และสิ่งนี้เองคือหัวใจสำคัญในการผลิตบัณฑิตที่มีคุณภาพออกสู่สังคมในการพัฒนาสายงานเทคโนโลยีเพื่อการพัฒนาที่ยั่งยืน
                        </p>
                        <a href="#" class="about-btn">About us <i class="bx bx-chevron-right"></i></a>
                    </div>
                </div>
                <div class="col-xl-7 d-flex align-items-stretch">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
                                <i class="bx bx-receipt"></i>
                                <h4>Corporis voluptates sit</h4>
                                <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
                                <i class="bx bx-cube-alt"></i>
                                <h4>Ullamco laboris nisi</h4>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
                                <i class="bx bx-images"></i>
                                <h4>Labore consequatur</h4>
                                <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
                                <i class="bx bx-shield"></i>
                                <h4>Beatae veritatis</h4>
                                <p>Expedita veritatis consequuntur nihil tempore laudantium vitae denat pacta</p>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>

        </div>
    </section><!-- End About Section -->

    <!-- ======= Testimonials Section ======= -->
<%--    <section id="testimonials" class="testimonials section-bg">--%>
<%--        <div class="container">--%>

<%--            <div class="section-title" data-aos="fade-in" data-aos-delay="100">--%>
<%--                <h2>Testimonials</h2>--%>
<%--                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>--%>
<%--            </div>--%>

<%--            <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">--%>
<%--                <div class="swiper-wrapper">--%>

<%--                    <div class="swiper-slide">--%>
<%--                        <div class="testimonial-item">--%>
<%--                            <p>--%>
<%--                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>--%>
<%--                                Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.--%>
<%--                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>--%>
<%--                            </p>--%>
<%--                            <img src="${pageContext.request.contextPath}/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">--%>
<%--                            <h3>Saul Goodman</h3>--%>
<%--                            <h4>Ceo &amp; Founder</h4>--%>
<%--                        </div>--%>
<%--                    </div><!-- End testimonial item -->--%>

<%--                    <div class="swiper-slide">--%>
<%--                        <div class="testimonial-item">--%>
<%--                            <p>--%>
<%--                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>--%>
<%--                                Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.--%>
<%--                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>--%>
<%--                            </p>--%>
<%--                            <img src="${pageContext.request.contextPath}/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">--%>
<%--                            <h3>Sara Wilsson</h3>--%>
<%--                            <h4>Designer</h4>--%>
<%--                        </div>--%>
<%--                    </div><!-- End testimonial item -->--%>

<%--                    <div class="swiper-slide">--%>
<%--                        <div class="testimonial-item">--%>
<%--                            <p>--%>
<%--                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>--%>
<%--                                Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.--%>
<%--                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>--%>
<%--                            </p>--%>
<%--                            <img src="${pageContext.request.contextPath}/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">--%>
<%--                            <h3>Jena Karlis</h3>--%>
<%--                            <h4>Store Owner</h4>--%>
<%--                        </div>--%>
<%--                    </div><!-- End testimonial item -->--%>

<%--                    <div class="swiper-slide">--%>
<%--                        <div class="testimonial-item">--%>
<%--                            <p>--%>
<%--                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>--%>
<%--                                Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.--%>
<%--                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>--%>
<%--                            </p>--%>
<%--                            <img src="${pageContext.request.contextPath}/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">--%>
<%--                            <h3>Matt Brandon</h3>--%>
<%--                            <h4>Freelancer</h4>--%>
<%--                        </div>--%>
<%--                    </div><!-- End testimonial item -->--%>

<%--&lt;%&ndash;                    <div class="swiper-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="testimonial-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img src="${pageContext.request.contextPath}/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <h3>John Larson</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <h4>Entrepreneur</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div><!-- End testimonial item -->&ndash;%&gt;--%>

<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="swiper-pagination"></div>&ndash;%&gt;--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </section><!-- End Testimonials Section -->--%>

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>บุคลากรของหลักสูตร</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up">
                        <div class="pic"><img src="${pageContext.request.contextPath}/assets/img/team/team-1.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                            <h4>Walter White</h4>
                            <span>Chief Executive Officer</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="150">
                        <div class="pic"><img src="${pageContext.request.contextPath}/assets/img/team/team-2.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                            <h4>Sarah Jhonson</h4>
                            <span>Product Manager</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="pic"><img src="${pageContext.request.contextPath}/assets/img/team/team-3.jpg" class="img-fluid" alt=""></div>
                        <div class="member-info">
                            <h4>William Anderson</h4>
                            <span>CTO</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->

    <div class="section-title">
        <h2>Contact</h2>
    </div>

    <jsp:include page="/WEB-INF/view/layout/footer.jsp"/>

    </section><!-- End Contact Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


</body>
</html>





