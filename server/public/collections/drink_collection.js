define(["zepto","underscore","backbone","drink"],
	function($,_,Backbone,Drink){
		var DrinkCollection = Backbone.Collection.extend({
			url:function(){
				return "http://localhost:9393/users/" + window.uuid +  "/drinks/";
			},
			initialize:function(uuid){
			}

		});

		return DrinkCollection;
	});