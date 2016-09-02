$(document).ready(function(){
	$("#regular").click(function(){
		$("#container>div").remove();
		var number =prompt("How many squares per side?")
		
		var square_size = $("#container").width()/number -2;
			
				for(var i = 1; i<=number*number; i++){
			$("#container").append("<div></div>")
			}
			
		$("#container>div").css("height",square_size)
		$("#container>div").css("width",square_size)
		
		
		
		$("#container>div").hover(function(){
				$(this).css("background-color","black");

	})
	})

	$("#random").click(function(){
		$("#container>div").remove();
		var number =prompt("How many squares per side?")
		
		var square_size = $("#container").width()/number -2;
			
				for(var i = 1; i<=number*number; i++){
			$("#container").append("<div></div>")
			}
			
		$("#container>div").css("height",square_size)
		$("#container>div").css("width",square_size)
		
		
		
		$("#container>div").mouseenter(function(){
				var x = Math.floor(Math.random()*256);
				
				var y = Math.floor(Math.random()*256)
				
				var z = Math.floor(Math.random()*256)
				
				$(this).css("background-color", "rgb("+x+","+y+","+z+")");

	})
	})

	

	$("#erase").click(function(){
		$("#container>div").css("background-color","#d0d0d0")

	})
})
