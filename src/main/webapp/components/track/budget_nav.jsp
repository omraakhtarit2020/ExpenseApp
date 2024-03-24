<style media="screen">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

* {
	font-family: "Poppins", sans-serif;
}

.dot-h1 {
	color: white;
	font-size: 30px;
	font-weight: 500;
}

.side-bar {
	background:  rgba(84, 105, 212, 0.2);
	backdrop-filter: blur(15px);
	width: 350px;
	height: 100vh;
	position: fixed;
	top: 0;
	right: -350px;
	overflow-x: auto;
	transition: 0.5s ease;
	transition-property: right;
	z-index: 1000;
}

.side-bar::-webkit-scrollbar {
	width: 0px;
}

.side-bar.active {
	right: 0;
}

.exp {
	padding-top: 33px;
	text-align: center;
	font-weight: 550;
	font-size: 32px;
	font-family: sans-serif;
	letter-spacing: 2px;
}

.side-bar .menu {
	width: 100%;
}

.side-bar .menu .item {
	position: relative;
	cursor: pointer;
}

.side-bar .menu .item a {
	color: rgb(3, 5, 94);
	font-size: 16px;
	text-decoration: none;
	display: block;
	padding: 5px 30px;
	line-height: 60px;
}

.side-bar .menu .item a:hover {
	background: rgba(80, 100, 190,0.4);
	color: white;
    transition: 0.2s ease;
}

.side-bar .menu .item i {
	margin-right: 10px;
}

.side-bar .menu .item a .dropdown {
	position: absolute;
	right: 0;
	margin: 20px;
	transition: 0.3s ease;
}

.side-bar .menu .item .sub-menu {
	background: rgba(75, 96, 200, 0.2);
	display: none;
}

.side-bar .menu .item .sub-menu a {
	padding-left: 80px;
}

.rotate {
	transform: rotate(90deg);
}

.close-btn {
	position: absolute;
	color: #09056c;
	font-size: 30px;
	right: 13px;
	margin: 5px;
	cursor: pointer;
	transition: 0.3s ease;
}

.menu-btn {
	position: absolute;
	top: 10px;
	right: 30px;
	/* Adjust this value as needed */
	color: rgb(37, 7, 107);
	font-size: 30px;
	cursor: pointer;
	transition: all 0.8s ease;
}

.menu-btn:hover {
	transform: rotate(90deg);
}

header {
	background: rgba(84, 105, 212,0.2);
	height: 60px;
}

.navbar {
	background-color: rgba(250, 250, 250,0.6);
	color: #09056c;
	width: auto;
	height: 60px;
	font-size: 30px;
}

span .itemExe {
	font-weight: 550;
	margin-bottom: 25px;
	padding: 15px;
}

.modal-body {
	color: #09056c;
}
.h-6 {
  height: 3rem;
}
.mr-3 {
  margin-right: 0.75rem;
}
.self-center {
  align-self: center;
}
.whitespace-nowrap {
  white-space: nowrap;
}
.text-xl {
  font-size: 1.25rem;
  line-height: 1.75rem;
  font-weight: 600;
}
.dark .dark\:text-white {
  --tw-text-opacity: 1;
  color: rgb(255 255 255 / var(--tw-text-opacity));
}
.navbar .container-fluid {
    display: flex;
    align-items: center;
}

.logo-container {
    display: flex;
    align-items: center;
}

</style>

<nav class="navbar">
    <div class="container-fluid">
        <div class="logo-container">
            <img src="images/favicon-16x16.png" class="h-6 mr-3 sm:h-9" alt="logo" />
            <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Expense-Tastic</span>
        </div>
    </div>
</nav>

	</nav>

	<div class="menu-btn">
		<i class="fas fa-bars"></i>
	</div>


	<div class="side-bar">

		<header>

			<div class="close-btn">

				<i class="fas fa-times"></i>
			</div>
			<!--h1 class="exp">Expense-Tastic</h1-->
		</header>
		<div class="menu">
			<div class="item">
				<a href="home.jsp"><i class="fas fa-desktop"></i>Dash-board</a>
			</div>
			<div class="item">
				<a class="sub-btn"><i class="fas fa-th-large"></i> Features <i
					class="fas fa-angle-right dropdown"></i></a>
				<div class="sub-menu">
					<a href="split.jsp" class="sub-item"><i class="far fa-handshake"></i>
						Split-Wiser</a> <a href="goal.jsp" class="sub-item"><i
						class="fas fa-calculator"></i> Calculators</a> <a href="exchange.jsp"
						class="sub-item"><i class="fas fa-university"></i> Lend/Borrow</a>
				</div>
			</div>
			<div class="item">
				<a href="budgetPlanning.jsp"><i class="fas fa-robot"></i>
					BudgetGPT</a>
			</div>
			<div class="item">
				<a href="./logout"><i class="fas fa-sign-out-alt"></i>Log-Out</a>
			</div>
		</div>
	</div>

	

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		charset="utf-8"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			//jquery for toggle sub menus
			$('.sub-btn').click(function() {
				$(this).next('.sub-menu').slideToggle();
				$(this).find('.dropdown').toggleClass('rotate');
			});

			//jquery for expand and collapse the sidebar
			$('.menu-btn').click(function() {
				$('.side-bar').addClass('active');
				$('.menu-btn').css("visibility", "hidden");
			});

			$('.close-btn').click(function() {
				$('.side-bar').removeClass('active');
				$('.menu-btn').css("visibility", "visible");
			});
		});
	</script>
