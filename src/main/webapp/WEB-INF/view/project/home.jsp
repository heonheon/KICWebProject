<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <title>Home</title>
</head>

<body>
  <header class="bg-dark text-white text-center py-5">
    <h1>Unific Workout and Diet Webpage</h1>
    <p>우리 웹사이트를 통해 운동, 식단 기록을 사용자들과 공유해 볼 수 있습니다.</p>
  </header>

  <section class="container my-5">
    <h2 class="text-center mb-4"></h2>
    <div class="row">
        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://kr.imboldn.com/wp-content/uploads/2020/02/Fitness-Feb-2020-main.jpg" class="d-block w-100" alt="Slide 1">
              </div>
              <div class="carousel-item">
                <img src="https://img.marieclairekorea.com/2020/01/mck_5e27a977860df.jpg" class="d-block w-100" alt="Slide 2">
              </div>
              <div class="carousel-item">
                <img src="http://www.sisajournal-e.com/news/photo/202003/215420_77721_2144.jpg" class="d-block w-100" alt="Slide 3">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
      <div class="col-md-12">
        <p>Workout 페이지를 통해서 운동 계획을 만들고 기록으로 남기세요</p>
        <p>Diet 페이지를 통해서 식단을 관리해 앞으로의 식단 방향을 정해보세요</p>
        <p>Profile과 SNS를 이용 다른 사용자들과 기록을 공유해 보세요</p>
        <p></p>
      </div>
    </div>
  </section>

  <footer class="bg-dark text-white text-center py-3">
    &copy; Unific Workout and Diet
  </footer>

</body>

</html>
