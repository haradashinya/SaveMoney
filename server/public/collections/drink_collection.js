define(["zepto","underscore","backbone","drink"],
	function($,_,Backbone,Drink){
		var DrinkCollection = Backbone.Collection.extend({
			url:function(){
				return "http://localhost:9393/users/" + this.uuid +  "/drinks/";
			},
			initialize:function(uuid){
			},
			setUUID:function(uuid){
				this.uuid = uuid;
			}

		});

		return DrinkCollection;
	});