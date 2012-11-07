define(["zepto","underscore","backbone","drink_collection","drink_collection_view"],
	function($,_,Backbone,DrinkCollection,DrinkCollectionView){
	var Router = Backbone.Router.extend({
			routes: {
				"users/:uuid/drinks/edit": "editDrink"
			},


			editDrink:function(uuid){
				console.log(DrinkCollection);
				console.log("ff");
				console.log(DrinkCollectionView);
			}

	});




	var router = new Router();
	Backbone.history.start();






	return Router;

});

