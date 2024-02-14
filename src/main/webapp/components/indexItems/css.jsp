*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  max-width: 100vw;
  max-height: 100vh;
}
body{
  background-color: #fff;
  align-items: center;
  justify-conter: center;
  font-family: 'Poppins', sans-serif;
}
#overall_container{
  width: 90%;
  margin: 5%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  gap: 3%;
  transition: flex-wrap 0.5s ease;
}
.element{
  width: 300px;
  height: 200px;
   background-color: #000;
  border-radius: 15px;
  cursor: pointer;
  transition: 0.5s all;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top:10px
}
.element:hover{
  width: 330px;
  height: 230px;
}
.element:hover p{
  display: block;
}
.element p{
  font-size: 1rem;
  background-color: #fff;
  padding: 20px;
  border-radius: 15px;
  display: none;
  transition: 0.5s all;
}
.element p a{
  text-decoration: none;
  color:black;
  font-weight:500px;
}
#first{
  background-image: url(https://img.freepik.com/free-vector/gradient-podium-background_52683-76369.jpg);
  background-repeat: no-repeat;
  background-size: cover;
}
#second{
  background-image: url(https://img.freepik.com/premium-photo/3d-rendering-podium-realistic-background_743950-255.jpg);
  background-repeat: no-repeat;
  background-size: cover;
}
#third{
  background-image: url(https://img.freepik.com/free-vector/realistic-podium-background_52683-77824.jpg);
  background-repeat: no-repeat;
  background-size: cover;
}
.dot {
  height: 100px;
  width: 100px;
  background-color: black;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items:center;
  color:white;
  margin-top:-3em;
  margin-left:9em;
}