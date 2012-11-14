define(["zepto","underscore","backbone","lib/text!templates/drink_view.html"],
	function($,_,Backbone,template){
		var DrinkView = Backbone.View.extend({
			tagName: "li",
			url: "http://localhost:9393/drinks/",
			initialize:function(){
				_.bindAll(this,"removeDrink");
			},
			events: {
				"click .remove-drink": "removeDrink"
			},
			render:function(){
				var opts = {
					type: this.model.get("type"),
					_id: this.model.get("_id"),
					user_id: this.model.get("user_id"),
					price: this.model.get("price")
				};

				var compiledTemplate = _.template(template,opts);
				this.$el.html(compiledTemplate);
				return this;
			},
			removeDrink:function(){
				this.$el.remove();
				console.log(this.model.toJSON());
				this.model.destroy();
			}
		});



		return DrinkView;
	});
