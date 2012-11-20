define(["zepto","underscore","backbone","drink_collection","drink_collection_view","lib/text!templates/popup.html","header_view"],
	function($,_,Backbone,DrinkCollection,DrinkCollectionView,popupTemplate,HeaderView){
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

				// render #header view
				var headerView = new HeaderView();
				// $("#content").find("#header").html(headerView.render().$el);
				$("#content").find("#header").html(headerView.render().$el);


				// render #main view
				var drinkCollectionView = new DrinkCollectionView({collection: models});
				$("#content").find("#main").html(drinkCollectionView.render().$el);

			},
			showBackground:function(){
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

