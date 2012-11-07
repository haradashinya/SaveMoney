define(["zepto","underscore","backbone"],function($,_,Backbone){
	var DrinkCollectionView = Backbone.View.extend({
		el: "#content",
		initialize:function(){
			console.log(this.$el.html);
			_.bindAll(this,"render");

		},
		render:function(){
			this.$el.html("fffffffff");

		}
	});

	return DrinkCollectionView;
});