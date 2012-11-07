define(["zepto","underscore","backbone","drink"],
	function($,_,Backbone,Drink){
		var DrinkCollection = Backbone.Collection.extend({
			url:function(){
				return "http://localhost:9393/users/11/drinks/";
			},
			initialize:function(uuid){
				console.log("fffff");
				var self = this;
				this.fetch({
					success:function(data){
						console.log(data.models);
					}
				})
			},
			setUUID:function(uuid){
				this.uuid = uuid;
				console.log(this.uuid);
			},

		});

		return DrinkCollection;
	});