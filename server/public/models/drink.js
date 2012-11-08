define(["zepto","underscore","backbone"],function($,_,Backbone){
	var Drink = Backbone.Model.extend({
		url:function(){
			return "/drinks/";
		},
		initialize:function(){
			console.log("initialie");
			this.on("removeDrink",function(){
				alert("fff");
			});
			this.bind("destroy",function(){
				alert("destroy");
			});
		},
		removeDrink:function(){
			alert("fffffff");

		}



	});
	return Drink;
});