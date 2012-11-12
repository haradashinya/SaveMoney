define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html",
				"drink_collection","drink","views/drink_view"],
	function($,_,Backbone,template,DrinkCollection,Drink,DrinkView){

		var options = {};
		var compiledTemplate = _.template(template,options);

		var DrinkCollectionView = Backbone.View.extend({
			// look for templates/edit_drink.html
			tagName: "ul",
			className:"list inset",
			initialize:function(){
				_.bindAll(this,"render","update");
				this.collection.fetch({
					success:$.proxy(this.addView,this)
				});

			},
			addView:function(collection,resp){
				var self = this;
				collection.models.forEach(function(item){
					console.log(item);
					var drink = new Drink(item.toJSON());
					var drinkView = new DrinkView({model: drink});
					this.$el.append(drinkView.render().$el);
				},this)
				this.render();
			},
			render:function(){
				return this;
			},
			update:function(){
				console.log("update");
			}
		});

		return DrinkCollectionView;
	});