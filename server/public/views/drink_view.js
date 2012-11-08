define(["zepto","underscore","backbone","lib/text!templates/drink_view.html"],
	function($,_,Backbone,template){
		var DrinkView = Backbone.View.extend({
			tagName: "li",
			initialize:function(){
				_.bindAll(this,"removeDrink");
			},
			events: {
				"click .remove": "removeDrink"
			},
			render:function(){
				var attributes = this.model.toJSON();
				var opts = {
					type: attributes.type,
					_id: attributes._id,
					user_id: attributes.user_id,
					price: attributes.price
				};

				var compiledTemplate = _.template(template,opts);
				this.$el.html(compiledTemplate);
				return this;
			},
			removeDrink:function(){
				var m = this.model.toJSON();


//				object.trigger("alert", "an event");

				this.model.destroy();
			}
		});



		return DrinkView;
	});
