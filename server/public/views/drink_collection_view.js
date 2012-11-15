define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html",
				"drink_collection","drink","views/drink_view","lib/text!templates/popup.html"],
	function($,_,Backbone,template,DrinkCollection,Drink,DrinkView,popupTemplate){

		var options = {};
		var compiledTemplate = _.template(template,options);

		var DrinkCollectionView = Backbone.View.extend({
			// look for templates/edit_drink.html
			tagName: "ul",
			className:"list",
			initialize:function(){
				_.bindAll(this,"render","update");
				this.collection.fetch({
					success:$.proxy(this.addView,this),
					error:$.proxy(this.showError,this)
				});

			},
			addView:function(collection,resp){
				var self = this;
				console.log(collection.models);
				collection.models.forEach(function(item){
					var drink = new Drink(item.toJSON());
					var drinkView = new DrinkView({model: drink});
					this.$el.append(drinkView.render().$el);
				},this)
				this.render();
			},
			render:function(){
				return this;
			},
			showError:function(){
				this.$el.html("<h1>There's no drinks</h1>");
				this.$el.css("text-align",'center');
//				this.$el.css("background","blue");
			},
			update:function(){
				console.log("update");
			}
		});

		return DrinkCollectionView;
	});