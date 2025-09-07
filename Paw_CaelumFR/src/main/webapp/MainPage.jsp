<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Paw Caelum Intro</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
  body{
  background-color: #73c7ae;
  font-family: 'Poppins', sans-serif;
  }
  .hero-section {
    background: linear-gradient(to right, #56cc9d, #59c3c3);
    color: white;
    padding: 60px 20px;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
  }
    .info-section {
      display: flex;
      gap: 40px;
      justify-content: space-between;
      align-items: flex-start;
      margin: 60px 0;
      flex-wrap: wrap;
    }

    .info-card {
      flex: 1;
    padding: 25px;
    min-width: 300px;
    background-color: rgba(255, 255, 255, 0.75);
    backdrop-filter: blur(8px);
    border: 1px solid #ddd;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    }

    .info-card h4 {
      font-weight: 600;
      color: #444;
      margin-bottom: 10px;
    }

    .info-card p {
      margin-bottom: 0;
      color: #555;
    }

    @media (max-width: 768px) {
      .info-section {
        flex-direction: column;
      }
    }
  </style>
</head>
<body class="container py-4">

  
  <header class="hero-section text-center mb-5" data-aos="zoom-in">
    <h1 class="fw-bold display-4">🐾 Welcome to Paw Caelum</h1>
    <p class="lead text-light">Your trusted place to connect dog owners and walkers</p>
  </header>

  
  <section class="info-section">
    <div class="info-card data-aos="fade-up" data-aos-delay="100">
      <h4>For Dog Owners</h4>
      <p>Post walk requests, manage your dogs, and track your walk history. Choose walkers based on ratings, time, and location.</p>
    </div>
    <div class="info-card data-aos="fade-up" data-aos-delay="200">
      <h4>For Dog Walkers</h4>
      <p>Search for available jobs by ZIP code, duration, and price. Accept jobs, complete walks, and keep notes with ease.</p>
    </div>
  </section>


  <div class="text-center mt-5">
    <a href="register.jsp" class="btn btn-success btn-lg me-3">Create Account</a> 
    <a href="login.jsp" class="btn btn-outline-primary btn-lg">Log In</a>
  </div>
  <section class="container my-5">
  <div class="d-flex flex-wrap align-items-center justify-content-between">
    
   
    <div class="col-md-6 mb-4 mb-md-0">
      <img id = "switchimage" 
      	   src="https://images.pexels.com/photos/1975989/pexels-photo-1975989.jpeg" 
           alt="Dog walk" class="img-fluid rounded-circle shadow">
    </div>

   
   <div class="col-md-5 ms-md-4" data-aos="fade-left">
  <h2 class="mb-4 fw-bold text-dark">
    ✨ How Paw Caelum Works
  </h2>

  <div class="p-3 mb-3 rounded border-start border-4 border-success shadow-sm" data-aos="fade-up" data-aos-delay="100" style="background: transparent;">
    <h5 class="fw-semibold mb-1">🐾 Post a Walk Request</h5>
    <p class="text-muted mb-0">Owners create profiles and schedule walks based on time, location, and dog needs.</p>
  </div>

  <div class="p-3 mb-3 rounded border-start border-4 border-primary shadow-sm" data-aos="fade-up" data-aos-delay="200" style="background: transparent;">
    <h5 class="fw-semibold mb-1">📩 Walker Accepts</h5>
    <p class="text-muted mb-0">Walkers browse requests and accept jobs that fit their schedule and location.</p>
  </div>

  <div class="p-3 mb-3 rounded border-start border-4 border-warning shadow-sm" data-aos="fade-up" data-aos-delay="300" style="background: transparent;">
    <h5 class="fw-semibold mb-1">📡 Stay Updated</h5>
    <p class="text-muted mb-0">Both parties can message and confirm walk progress through the app.</p>
  </div>

  <div class="p-3 rounded border-start border-4 border-danger shadow-sm" data-aos="fade-up" data-aos-delay="400" style="background: transparent;">
    <h5 class="fw-semibold mb-1">⭐ Rate & Review</h5>
    <p class="text-muted mb-0">Leave feedback after the walk to help build trust and accountability.</p>
  </div>
</div>

</div>
   
</section>
<section class="container my-5" data-aos="fade-up">
  <h2 class="text-center mb-5 fw-bold" style="background: linear-gradient(to right, #56cc9d, #59c3c3); -webkit-background-clip: text; color: transparent;">
    🌟 What Our Users Say
  </h2>

  <div class="row g-4">
    <div class="col-md-4">
      <div class="card border-0 shadow-lg h-100 p-4 position-relative hover-zoom" data-aos="zoom-in" data-aos-delay="100" style="border-radius: 20px;">
        <div class="d-flex align-items-center mb-3">
          <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="User" class="rounded-circle me-3" style="width: 60px; height: 60px;">
          <div>
            <h6 class="mb-0 fw-semibold">Sophia L.</h6>
            <small class="text-muted">Dog Owner</small>
          </div>
        </div>
        <div class="text-warning fs-5 mb-2">★★★★★</div>
        <div class="testimonial-text position-relative p-3 rounded" style="background-color: #f9f9f9; font-style: italic;">
          Paw Caelum helped me find the perfect walker for my golden retriever. Easy to use and super reliable!
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card border-0 shadow-lg h-100 p-4 position-relative hover-zoom" data-aos="zoom-in" data-aos-delay="200" style="border-radius: 20px;">
        <div class="d-flex align-items-center mb-3">
          <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User" class="rounded-circle me-3" style="width: 60px; height: 60px;">
          <div>
            <h6 class="mb-0 fw-semibold">Daniel M.</h6>
            <small class="text-muted">Dog Walker</small>
          </div>
        </div>
        <div class="text-warning fs-5 mb-2">★★★★☆</div>
        <div class="testimonial-text position-relative p-3 rounded" style="background-color: #f9f9f9; font-style: italic;">
          I love using this platform to find local walk jobs. The request system and messaging make it easy.
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card border-0 shadow-lg h-100 p-4 position-relative hover-zoom" data-aos="zoom-in" data-aos-delay="300" style="border-radius: 20px;">
        <div class="d-flex align-items-center mb-3">
          <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="User" class="rounded-circle me-3" style="width: 60px; height: 60px;">
          <div>
            <h6 class="mb-0 fw-semibold">Emily R.</h6>
            <small class="text-muted">Dog Owner</small>
          </div>
        </div>
        <div class="text-warning fs-5 mb-2">★★★★★</div>
        <div class="testimonial-text position-relative p-3 rounded" style="background-color: #f9f9f9; font-style: italic;">
          Our walker sends great updates and photos! My dog Max always comes home happy. Highly recommend!
        </div>
      </div>
    </div>
  </div>
</section>

<script>
const imageElement = document.getElementById('switchimage');

const images = [
  "https://images.pexels.com/photos/1975989/pexels-photo-1975989.jpeg",
  "https://images.pexels.com/photos/1452717/pexels-photo-1452717.jpeg",
  "https://images.pexels.com/photos/792775/pexels-photo-792775.jpeg"
];

let current = 0;

setInterval(() => {
  current = (current + 1) % images.length;
  imageElement.src = images[current];
}, 3000); 

</script>

  

</body>
</html>
