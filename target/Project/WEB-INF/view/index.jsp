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
    .about .content .about-btn i {
        font-size: 18px;
        position: absolute;
        right: 18px;
        top: 9px;
    }

    .about .content .about-btn:hover {
        background: #656464;
    }
    .about .icon-boxes .icon-box i {
        font-size: 40px;
        color: #990D28;
        margin-bottom: 10px;
    }

    .circle-image {
        width: 420px;  /* ปรับขนาดตามที่คุณต้องการ */
        height: 415px; /* ปรับขนาดตามที่คุณต้องการ */
        /*border-radius: 50%; !* สร้างเส้นรอบวงที่ทำให้รูปภาพเป็นวงกลม *!*/
        overflow: hidden; /* ซ่อนส่วนที่เกินขอบของวงกลม */
    }
</style>
<body style="background-color: #fcfaf1;">
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
<%--                <div class="col-xl-7 d-flex align-items-stretch">--%>
<%--                    <div class="icon-boxes d-flex flex-column justify-content-center">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">--%>
<%--                                <i class="bx bx-receipt"></i>--%>
<%--                                <h4>Corporis voluptates sit</h4>--%>
<%--                                <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">--%>
<%--                                <i class="bx bx-cube-alt"></i>--%>
<%--                                <h4>Ullamco laboris nisi</h4>--%>
<%--                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">--%>
<%--                                <i class="bx bx-images"></i>--%>
<%--                                <h4>Labore consequatur</h4>--%>
<%--                                <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">--%>
<%--                                <i class="bx bx-shield"></i>--%>
<%--                                <h4>Beatae veritatis</h4>--%>
<%--                                <p>Expedita veritatis consequuntur nihil tempore laudantium vitae denat pacta</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div><!-- End .content-->--%>
<%--                </div>--%>
            </div>

        </div>
    </section><!-- End About Section -->


    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2 style="font-family: 'Prompt', sans-serif">บุคลากรของหลักสูตร</h2>
            </div>

            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher1.png" class="img-fluid" alt=""></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.ดร.จักรกฤช เตโช</h4>
                            <span style="font-family: 'Prompt', sans-serif">ประธานอาจารย์ผู้รับผิดชอบหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="150">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher2.png" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">ผศ.ดร.สายัณห์ อุ่นนันกาศ</h4>
                            <span style="font-family: 'Prompt', sans-serif">รองประธานอาจารย์ผู้รับผิดชอบหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher3.jpg" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.ดร.วรรณวิมล นาดี</h4>
                            <span style="font-family: 'Prompt', sans-serif">เลขานุการอาจารย์ผู้รับผิดชอบหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher4.png" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.ดร.ภรต รัตนปิณฑะ</h4>
                            <span style="font-family: 'Prompt', sans-serif">อาจารย์ผู้รับผิดชอบหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher5.png" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.ดร.วัชรินทร์ สาระไชย</h4>
                            <span style="font-family: 'Prompt', sans-serif">อาจารย์ผู้รับผิดชอบหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher6.png" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.ดร.จิราวรรณ รอนราญ</h4>
                            <span style="font-family: 'Prompt', sans-serif">อาจารย์ประจำหลักสูตร</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="member" data-aos="fade-up" data-aos-delay="300">
                        <div class="circle-image"><img src="${pageContext.request.contextPath}/assets/img/personal/teacher7.png" class="img-fluid" alt="" ></div>
                        <div class="member-info">
                            <h4 style="font-family: 'Prompt', sans-serif">อ.พิชชยานิดา คำวิชัย</h4>
                            <span style="font-family: 'Prompt', sans-serif">ลาศึกษาต่อ</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->

    <div class="section-title">
        <h2 style="font-family: 'Prompt', sans-serif">ติดต่อสอบถาม</h2>
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





