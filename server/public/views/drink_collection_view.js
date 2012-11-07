define(["zepto","underscore","backbone"],function($,_,Backbone){
	var DrinkCollectionView = Backbone.View.extend({
		el: "#content",
		initialize:function(){
			console.log("init drinkCollectionView");

		}
	});

	return DrinkCollectionView;
});