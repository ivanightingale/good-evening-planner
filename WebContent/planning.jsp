<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Good Evening</title>
		<link rel="stylesheet" type="text/css" href="planning.css">
	</head>
	<script>
		function submitPlan(){
			console.log("In submitPlan");
			//Error Check Submission Fields
			var error = "false"; 
			var timeError = "false";
			
			//Validate Start and End Time Values
			var eveningStart = document.getElementById("eveningStart").value;
			if(eveningStart == ""){
				document.getElementById("startError").innerHTML = "Please choose a start time.";
				console.log("invalid start time");
				error = "true";
				timeError = "true";
			}
			else{
				console.log("valid start time");
				document.getElementById("endError").innerHTML = "";
				//Format Time
				eveningStart = eveningStart.substring(0,2) + eveningStart.substring(3,5);
			}
			var eveningEnd = document.getElementById("eveningEnd").value;
			if(eveningEnd == ""){
				document.getElementById("endError").innerHTML = "Please choose an end time.";
				console.log("invalid end time");
				error = "true";
				timeError = "true";
			}
			else{
				console.log("valid end time");
				document.getElementById("endError").innerHTML = "";
				//Format Time
				eveningEnd = eveningEnd.substring(0,2) + eveningEnd.substring(3,5);
			}
			//Check for starttime > endtime
			if(parseInt(eveningStart) > parseInt(eveningEnd)){
				eveningEnd = parseInt(eveningEnd) + 2400;
				eveningEnd = eveningEnd.toString();
				console.log(eveningEnd);
			}
			
			//Check Group Size
			
			
			//Check Event Type Values
			var movieTypes = document.getElementsByName('movie');
			var movieType;
			var movie;
			for(var i = 0; i < movieTypes.length; i++){
			    if(movieTypes[i].checked){
			    	movieType = movieTypes[i].value;
			        movie = "movie";
			    }
			}
			if(movieType == ""){
				movie = "";
				movieType ="";
			}	
			
			var exhibitionTypes = document.getElementsByName('exhibition');
			var exhibitionType;
			var exhibition;
			for(var i = 0; i < exhibitionTypes.length; i++){
			    if(exhibitionTypes[i].checked){
			    	exhibitionType = exhibitionTypes[i].value;
			    	exhibition = "exhibition";
			    }
			}
			if(exhibitionType == ""){
				exhibition = "";
				exhibitionType ="";
			}
			
			var restaurantTypes = document.getElementsByName('restaurant');
			var restaurantType;
			var restaurant;
			for(var i = 0; i < restaurantTypes.length; i++){
			    if(restaurantTypes[i].checked){
			        restaurantType = restaurantTypes[i].value;
			        restaurant = "restaurant";
			    }
			}
			if(restaurantType == ""){
				restaurant = "";
				restaurantType ="";
			}
			
			var concertTypes = document.getElementsByName('concert');
			var concertType;
			var concert;
			for(var i = 0; i < concertTypes.length; i++){
			    if(concertTypes[i].checked){
			    	concertType = concertTypes[i].value;
			    	concert = "concert";
			    }
			}
			if(concertType == ""){
				concert = "";
				concertType ="";
			}
			
			var outdoorTypes = document.getElementsByName('outdoor');
			var outdoorType;
			var outdoor;
			for(var i = 0; i < outdoorTypes.length; i++){
			    if(outdoorTypes[i].checked){
			    	outdoorType = outdoorTypes[i].value;
			    	outdoor = "outdoor";
			    }
			}
			if(outdoorType == ""){
				outdoor = "";
				outdoorType ="";
			}
			
			//Check for no events chosen
			if(outdoor == null && restaurant == null && concert == null && exhibition == null && movie == null){
				console.log("Event error");
				error = "true";
				document.getElementById("eventError").innerHTML = "Please choose at least one event type.";
			}
			else{
				document.getElementById("eventError").innerHTML = "";
			}

			//Print error message if true
			if(error == "true"){
				return;
			}
			else{
				//Submit Form
				console.log("Submitting planning form");
				var xhttp = new XMLHttpRequest();
				if(error == "true"){
					console.log("Start Time: " + eveningStart);
					console.log("End Time: " + eveningEnd);
					console.log("Concert: " + concert + " Concert Type: " + concertType);
					console.log("Restaurant: " + restaurant + " Restaurant Type: " + restaurantType);
					console.log("Outdoors: " + outdoor + " Outdoors Type: " + outdoorType);
					console.log("Exhibition: " + exhibition + " Exhibition Type: " + exhibitionType);
					console.log("Movie: " + movie + " Movie Type: " + movieType);
				}
				/* xhttp.open("GET", "Servlet?planning=true&eveningStart="+eveningStart+
						"&eveningEnd="+eveningEnd+"&restaurant="+restaurant+"&restaurantType="+restaurantType+
						"&movie="+movie+"&movieType="+movieType+"&exhibition="+exhibition+"&exhibitionType="+exhibitionType+
						"&concert="+concert+"&concertType="+concertType+"&outdoor="+outdoor+"&outdoorType="+outdoorType, true); */ 
	/* 			xhttp.onreadystatechange = function(){
					errorMessage = this.responseText;
					if(errorMessage.length != 0) {
						console.log(errorMessage)
						if(errorMessage.trim() == "success") {
							window.location.href = "results.jsp";
						} else {
							document.getElementById("planningError").innerHTML = this.responseText;	
						}
						
					}
				}
				xhttp.send(); */
			}
		}
		function highlightButton(num){
			
		}
	</script>
	<body>
		<div id="header">
			<a href="index.jsp"><h1 style="display: inline-block;">Good Evening</h1></a>
		</div>
		<div id="icon">
			<a href="profile.jsp"><img src="user.png" style="width: 50px; padding-right: 50px; margin-bottom: 0px; float: right;"/></a>
		</div>

		<div id="body">
			<div id="goodEvening">
				<div class="quant" style="font-size: 64px;">Let's Plan Your Evening</div>
				<form id="planning"> <!-- action="Servlet" -->
					<div class="quant">
						Start Time: <input type="time" id="eveningStart">
						<p id="startError"></p>
					</div>
					<div class="quant">
						End Time: <input type="time" id="eveningEnd">
						<p id="endError"></p>
					</div>
					<div class="quant">
						Type of Events:
						<p id="eventError"></p>
					</div>
					<div class="quant">
						<button class="accordion" type="button">Concert</button>
						<div class="panel">
							 <h4>Pop <input type="radio" name="concert" value="pop"></h4>
							 <h4>Rock <input type="radio" name="concert" value="rock"></h4>
							 <h4>Jazz <input type="radio" name="concert" value="jazz"></h4>
						</div>
						<button class="accordion" type="button">Outdoors</button>
						<div class="panel">
							 <h4>Hiking <input type="radio" name="outdoor" value="hiking"></h4>
							 <h4>Water <input type="radio" name="outdoor" value="water"> </h4>
							 <h4>Biking <input type="radio" name="outdoor" value="biking"> </h4>
						</div>
						<button class="accordion" type="button">Exhibition</button>
						<div class="panel">
							 <h4>Museums <input type="radio" name="exhibition" value="museums"> </h4>
							 <h4>Theater <input type="radio" name="exhibition" value="theater"></h4>
							 <h4>Art Show <input type="radio" name="exhibition" value="art"></h4>
						</div>
						<button class="accordion" type="button">Movie</button>
						<div class="panel">
							 <h4>Animated <input type="radio" name="movie" value="animated"></h4>
							 <h4>Action <input type="radio" name="movie" value="action"></h4>
							 <h4>Romantic <input type="radio" name="movie" value="romantic"></h4>
							 <h4>Comedy <input type="radio" name="movie" value="comedy"></h4>
						</div>
						<button class="accordion" type="button">Restaurant</button>
						<div class="panel">
							 <h4>Italian <input type="radio" name="restaurant" value="italian"></h4>
							 <h4>Chinese <input type="radio" name="restaurant" value="chinese"></h4>
							 <h4>Korean <input type="radio" name="restaurant" value="korean"></h4>
							 <h4>Mexican <input type="radio" name="restaurant" value="mexican"></h4>
						</div>		
					</div>			
					<div class="quant">
						Group Size:</div>	
						<div class="quant">
							<button class="bbutton2" type="button">Individual (1)</button>
							<button class="bbutton2" type="button">Small (2-4)</button>
							<button class="bbutton2" type="button">Medium (5-8)</button>
							<button class="bbutton2" type="button">Large (8+)</button>
					</div>
					 <div class="quant">
						<button type="button" class="accordion" style="text-align:center;" onclick="submitPlan()">Submit</button>
					</div>
 				</form>

			</div>
			<div id="featuredEvents">
				<h2>Featured Events</h2>
			</div>
			<div id="featuredMovie">
				<h2>Featured Movies</h2>
			</div>
		</div>
		<div id="footer">
			<h6>CSCI201 Final Project</h6>
			<h6>Yinghui (Linda) He, Guancheng “Ivan” Qiu, Cameron Haseyama, Will DuCharme, Gaurav Malhotra</h6>
		</div>
	</body>
	
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
						
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight){
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			} 
			});
		}
		
		var btns = document.getElementsByClassName("bbutton2");
		for (i = 0; i < btns.length; i++) {
			  btns[i].addEventListener("click", function() {
				this.classList.toggle("active");
			  });
		}
		</script>
					    <!-- var current = document.getElementsByClassName("active");
			    current[0].className = current[0].className.replace(" active", "");
			    this.className += " active"; -->
</html>