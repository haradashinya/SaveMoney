define(["zepto","underscore","backbone","drink_collection","drink_collection_view","lib/text!templates/popup.html"],
	function($,_,Backbone,DrinkCollection,DrinkCollectionView,popupTemplate){
		var Router = Backbone.Router.extend({
			routes: {
				"users/:uuid/drinks/edit": "editDrink",
				"background": "showBackground",
				"users/:uuid/drinks/:drink_id/popup": "showPopup",
				"popup": "showPopup"
			},

			editDrink:function(uuid){
				var models = new DrinkCollection();
				window.uuid = uuid;
				var drinkCollectionView = new DrinkCollectionView({collection: models});
				$("#content").html(drinkCollectionView.render().$el);

			},
			showBackground:function(){
				alert("called");
			},
			showPopup:function(){
				var tmpl = _.template(popupTemplate,{});
				$("body").html("hello world");
			}
		});

	var router = new Router();
	Backbone.history.start();

	return Router;

});

