define(["zepto","underscore","backbone","drink_collection","drink_collection_view","lib/text!templates/popup.html","header_view","summary_view"],
	function($,_,Backbone,DrinkCollection,DrinkCollectionView,popupTemplate,HeaderView,SummaryView){
		var drinks = new DrinkCollection();
		var Router = Backbone.Router.extend({
			routes: {
				"users/:uuid/drinks/edit": "editDrink",
				"users/:uuid/drinks/summary":"showSummary"
			},

			editDrink:function(uuid){
				window.uuid = uuid;
				var drinkCollectionView = new DrinkCollectionView({collection: drinks});
				$("#content").html(drinkCollectionView.$el);
			},
			showSummary:function(){
				var summaryView = new SummaryView({collection: drinks});
				$("#content").html(summaryView.el);
			}
		});

	var router = new Router();
	Backbone.history.start();

	return Router;

});

