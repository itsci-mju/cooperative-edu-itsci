<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  #font{
      font-size: 17px;
      font-weight: bold;
  }
</style>
