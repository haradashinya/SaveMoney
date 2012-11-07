define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html","drink_collection","drink"],
	function($,_,Backbone,template,DrinkCollection,Drink){


		var DrinkCollectionView = Backbone.View.extend({
			el: "#content",
			collection: "",
			initialize:function(){
				_.bindAll(this,"render","update");
				this.collection.fetch({
					success:$.proxy(this.addView,this)
				})

			},
			addView:function(collection,resp){
				var self = this;
				collection.models.forEach(function(item){
					// make new DrinkView like this
//					var drinkView = new DrinkView;
					// self.$el.append(drinkView.render());
				})
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