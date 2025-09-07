<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dog Profile</title>
<style>
  body {
    background-color: #73c7ae;
    font-family: 'Poppins', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
  }

  .dog-form-container {
    background-color: #ffffff;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    max-width: 500px;
    width: 100%;
  }

  h1 {
    text-align: center;
    color: #2d5242;
    margin-bottom: 25px;
  }

  label {
    font-weight: 500;
    display: block;
    margin-top: 12px;
    margin-bottom: 5px;
  }

  input[type="text"],
  input[type="number"],
  select,
  textarea,
  input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
    font-size: 1rem;
  }

  textarea {
    resize: vertical;
  }

  .form-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
  }

  input[type="submit"],
  input[type="reset"] {
    padding: 10px 20px;
    font-size: 1rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
  }

  input[type="submit"] {
    background-color: #2d5242;
    color: white;
  }

  input[type="reset"] {
    background-color: #ccc;
    color: black;
  }

  input[type="submit"]:hover {
    background-color: #244437;
  }

  input[type="reset"]:hover {
    background-color: #b3b3b3;
  }
</style>
</head>
<body>
  <div class="dog-form-container">
    <h1>Post Your Dog's Profile</h1>
    <form action="DogController" method="post" enctype="multipart/form-data">
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" required>

      <label for="breed">Breed:</label>
      <input type="text" name="breed" id="breed">

      <label for="size">Size:</label>
      <select name="size" id="size">
        <option value="SMALL">Small</option>
        <option value="MEDIUM">Medium</option>
        <option value="LARGE">Large</option>
      </select>

      <label for="age">Age:</label>
      <input type="number" name="age" id="age" min="0">

      <label for="basic_info">Basic Info:</label>
      <textarea name="basic_info" id="basic_info" rows="3" placeholder="Temperament, favorite toy, allergies, etc."></textarea>

      <label for="photo">Upload a Photo:</label>
      <input type="file" name="photo" id="photo" accept="image/*">

      <div class="form-buttons">
        <input type="submit" value="Submit">
        <input type="reset" value="Reset">
      </div>
    </form>
  </div>
</body>
</html>