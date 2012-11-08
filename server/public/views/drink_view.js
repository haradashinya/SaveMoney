define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html"],
	function($,_,Backbone,template){
		var DrinkView = Backbone.View.extend({
			initialize:function(){
			},
			render:function(){
				console.log(this.model);
				console.log(template);
				this.$el.html("<li>hello world</li>")
				return this;
			}

		});


		return DrinkView;
	});