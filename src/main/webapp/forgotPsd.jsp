<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style>
* {
	padding: 0;
	margin: 0;
	color: #1a1f36;
	box-sizing: border-box;
	word-wrap: break-word;
	font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto,
		Helvetica Neue, Ubuntu, sans-serif;
}

body {
	min-height: 100%;
	background-color: #ffffff;
}

h1 {
	letter-spacing: -1px;
}

a {
	color: #5469d4;
	text-decoration: unset;
}

.login-root {
	background: #fff;
	display: flex;
	width: 100%;
	min-height: 100vh;
	overflow: hidden;
}

.loginbackground {
	min-height: 692px;
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	z-index: 0;
	overflow: hidden;
}

.flex-flex {
	display: flex;
}

.align-center {
	align-items: center;
}

.center-center {
	align-items: center;
	justify-content: center;
}

.box-root {
	box-sizing: border-box;
}

.flex-direction--column {
	-ms-flex-direction: column;
	flex-direction: column;
}

.loginbackground-gridContainer {
	display: -ms-grid;
	display: grid;
	-ms-grid-columns: [start] 1fr[left-gutter] (86.6px)[16] [left-gutter] 1fr[end];
	grid-template-columns: [start] 1fr[left-gutter] repeat(16, 86.6px)[left-gutter]
		 1fr[end];
	-ms-grid-rows: [top] 1fr[top-gutter] (64px)[8] [bottom-gutter] 1fr[bottom];
	grid-template-rows: [top] 1fr[top-gutter] repeat(8, 64px)[bottom-gutter]
		 1fr[bottom];
	justify-content: center;
	margin: 0 -2%;
	transform: rotate(-12deg) skew(-12deg);
}

.box-divider--light-all-2 {
	box-shadow: inset 0 0 0 2px #e3e8ee;
}

.box-background--blue {
	background-color: #5469d4;
}

.box-background--white {
	background-color: #ffffff;
}

.box-background--blue800 {
	background-color: #212d63;
}

.box-background--gray100 {
	background-color: #e3e8ee;
}

.box-background--cyan200 {
	background-color: #7fd3ed;
}

.padding-top--64 {
	padding-top: 64px;
}

.padding-top--24 {
	padding-top: 24px;
}

.padding-top--48 {
	padding-top: 48px;
}

.padding-bottom--24 {
	padding-bottom: 24px;
}

.padding-horizontal--48 {
	padding: 48px;
}

.padding-bottom--15 {
	padding-bottom: 15px;
}

.flex-justifyContent--center {
	-ms-flex-pack: center;
	justify-content: center;
}

.formbg {
	margin: 0px auto;
	width: 100%;
	max-width: 448px;
	background: white;
	border-radius: 4px;
	box-shadow: rgba(60, 66, 87, 0.12) 0px 7px 14px 0px, rgba(0, 0, 0, 0.12)
		0px 3px 6px 0px;
}

span {
	display: block;
	font-size: 20px;
	line-height: 28px;
	color: #1a1f36;
}

label {
	margin-bottom: 10px;
}

.reset-pass a, label {
	font-size: 14px;
	font-weight: 600;
	display: block;
}

.reset-pass>a {
	text-align: right;
	margin-bottom: 10px;
}

.grid--50-50 {
	display: grid;
	grid-template-columns: 50% 50%;
	align-items: center;
}

.field input {
	font-size: 16px;
	line-height: 28px;
	padding: 8px 16px;
	width: 100%;
	min-height: 44px;
	border: unset;
	border-radius: 4px;
	outline-color: rgb(84 105 212/ 0.5);
	background-color: rgb(255, 255, 255);
	box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px
		0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.16) 0px
		0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px
		0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}

input[type="submit"] {
	background-color: rgb(84, 105, 212);
	box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px
		0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, rgb(84, 105, 212) 0px
		0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px
		0px 0px 0px, rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.field-checkbox input {
	width: 20px;
	height: 15px;
	margin-right: 5px;
	box-shadow: unset;
	min-height: unset;
}

.field-checkbox label {
	display: flex;
	align-items: center;
	margin: 0;
}

a.ssolink {
	display: block;
	text-align: center;
	font-weight: 600;
}

.footer-link span {
	font-size: 14px;
	text-align: center;
}

.listing a {
	color: #697386;
	font-weight: 600;
	margin: 0 10px;
}

.animationRightLeft {
	animation: animationRightLeft 2s ease-in-out infinite;
}

.animationLeftRight {
	animation: animationLeftRight 2s ease-in-out infinite;
}

.tans3s {
	animation: animationLeftRight 3s ease-in-out infinite;
}

.tans4s {
	animation: animationLeftRight 4s ease-in-out infinite;
}

@
keyframes animationLeftRight { 0% {
	transform: translateX(0px);
}

50
%
{
transform
:
translateX(
1000px
);
}
100
%
{
transform
:
translateX(
0px
);
}
}
@
keyframes animationRightLeft { 0% {
	transform: translateX(0px);
}
50
%
{
transform
:
translateX(
-1000px
);
}
100
%
{
transform
:
translateX(
0px
);
}
}
</style>
<body>

	<div class="login-root">
		<div class="box-root flex-flex flex-direction--column"
			style="min-height: 100vh; flex-grow: 1;">
			<div class="loginbackground box-background--white padding-top--64">
				<div class="loginbackground-gridContainer">
					<div class="box-root flex-flex" style="grid-area: top/start/8/end;">
						<div class="box-root"
							style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
						</div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 4/2/auto/5;">
						<div
							class="box-root box-divider--light-all-2 animationLeftRight tans3s"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 6/start/auto/2;">
						<div class="box-root box-background--blue800"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 7/start/auto/4;">
						<div class="box-root box-background--blue animationLeftRight"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 8/4/auto/6;">
						<div
							class="box-root box-background--gray100 animationLeftRight tans3s"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 2/15/auto/end;">
						<div
							class="box-root box-background--cyan200 animationRightLeft tans4s"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 3/14/auto/end;">
						<div class="box-root box-background--blue animationRightLeft"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 4/17/auto/20;">
						<div
							class="box-root box-background--gray100 animationRightLeft tans4s"
							style="flex-grow: 1;"></div>
					</div>
					<div class="box-root flex-flex" style="grid-area: 5/14/auto/17;">
						<div
							class="box-root box-divider--light-all-2 animationRightLeft tans3s"
							style="flex-grow: 1;"></div>
					</div>
				</div>
			</div>
			<div
				class="box-root padding-top--24 flex-flex flex-direction--column"
				style="flex-grow: 1; z-index: 9;">
				<div
					class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
					<h1>
						<a href="#" rel="#">Forgot PIN</a>
					</h1>
				</div>
				<div class="formbg-outer">
					<div class="formbg">
						<div class="formbg-inner padding-horizontal--48">
							<form action="updateMpin" method="POST" id="stripe-login"
								autocomplete="off">
								<div class="field padding-bottom--24">
									<label for="mpin"><i class="fa-solid fa-lock lock"></i>
										Enter New PIN </label> <input id="mpin" type="number"
										placeholder="****" name="mpin">
								</div>
								<div class="field padding-bottom--24">
									<label for="mpin"> Confirm New PIN </label> <input id="mpin"
										type="password" placeholder="****" name="confMpin">
								</div>
								<div class="field padding-bottom--24">
									<input id="update" type="submit" name="update"
										value="Update MPIN">
								</div>
							</form>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded',function() {
			// Get the form element
			var form = document.getElementById('stripe-login');

			// Add an event listener for form submission
			form.addEventListener('submit',function(event) {
				// Get the values of mpin and confMpin fields
			    var mpin = document.getElementById('mpin').value;
				var confMpin = document.getElementById('confMpin').value;

				// Check if mpin and confMpin are the same
				if (mpin !== confMpin) {
				// If they are not the same, prevent form submission and show an alert
					event.preventDefault();
					alert('Please enter the same MPIN in both fields.');
				}
			});
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>


</body>
</html>