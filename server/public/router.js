define(["zepto","underscore","backbone","drink_collection","drink_collection_view"],
	function($,_,Backbone,DrinkCollection,DrinkCollectionView){
		var Router = Backbone.Router.extend({
			routes: {
				"users/:uuid/drinks/edit": "editDrink",
				"background": "showBackground"
			},

			editDrink:function(uuid){
				var models = new DrinkCollection();
				window.uuid = uuid;
				var drinkCollectionView = new DrinkCollectionView({collection: models});
				$("#content").html(drinkCollectionView.render().$el);

			},
			showBackground:function(){
				alert("called");
			}
		});

	var router = new Router();
	Backbone.history.start();

	return Router;

});

