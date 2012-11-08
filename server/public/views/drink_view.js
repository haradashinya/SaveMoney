define(["zepto","underscore","backbone","lib/text!templates/drink_view.html"],
	function($,_,Backbone,template){
		var DrinkView = Backbone.View.extend({
			initialize:function(){
			},
			render:function(){
				var opts = {
					type: this.model.type,
					_id: this.model._id,
					user_id: this.model.user_id,
					price: this.model.price
				};

				var compiledTemplate = _.template(template,opts);
				console.log(this.model);

				this.$el.html(compiledTemplate);
				return this;
			}
		});



		return DrinkView;
	});
