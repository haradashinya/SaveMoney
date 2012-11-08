define(["zepto","underscore","backbone"],function($,_,Backbone){
	var DrinkView = Backbone.View.extend({
		initialize:function(){

		},
		render:function(){
			this.$el.html("<li>hello world</li>")
			return this;
		}

	});


	return DrinkView;
});