define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html",
				"drink_collection","drink","views/drink_view"],
	function($,_,Backbone,template,DrinkCollection,Drink,DrinkView){


		var DrinkCollectionView = Backbone.View.extend({
			el: "#content",
			initialize:function(){
				_.bindAll(this,"render","update");
				this.collection.fetch({
					success:$.proxy(this.addView,this)
				})

			},
			addView:function(collection,resp){
				var self = this;
				collection.models.forEach(function(item){
					var drinkView = new DrinkView({uuid: 33,
						model: item.toJSON()});
					this.$el.append(drinkView.render().$el);
				},this)
			},
			render:function(uuid){
				var data = {
					name: "hello world"
				};
				var compiledTemplate = _.template(template,data);
				this.$el.html(compiledTemplate);
			},
			update:function(){
				console.log("update");
			}
		});

		return DrinkCollectionView;
	});