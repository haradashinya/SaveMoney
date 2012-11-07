define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html","drink_collection"],
	function($,_,Backbone,template,DrinkCollection){


		var DrinkCollectionView = Backbone.View.extend({
			el: "#content",
			collection: "",
			initialize:function(){
				_.bindAll(this,"render");
			},
			render:function(uuid){
				var data = {
					name: "hello world"
				};
				var compiledTemplate = _.template(template,data);
				this.$el.html(compiledTemplate);
			}
		});

		return DrinkCollectionView;
	});