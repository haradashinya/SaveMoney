define(["zepto","underscore","backbone","drink"],
	function($,_,Backbone,Drink){
		var DrinkCollection = Backbone.Collection.extend({
			url:function(){
				console.log(this.uuid);
				return "http://localhost:9393/users/" +"0D20B5EE-87AD-4C60-BD39-B8DFA2A21CC5" +  "/drinks/";
			},
			initialize:function(uuid){
			},
			setUUID:function(uuid){
				this.uuid = uuid;
			}

		});

		return DrinkCollection;
	});