define(["zepto","underscore","backbone"],function($,_,Backbone){
	var Drink = Backbone.Model.extend({
		initialize:function(){
			_.bindAll(this,"removeDrink");
			this.on("destroy",this.removeDrink);
		},
		removeDrink:function(){
			console.log("fire");
			$.ajax({
				type:"DELETE",
				url:"http://localhost:9393/drinks/33",
				success:function(data){
					console.log(data);
				}

			})

		}



	});
	return Drink;
});