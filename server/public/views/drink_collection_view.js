define(["zepto","underscore","backbone","lib/text!templates/edit_drink.html"],function($,_,Backbone,template){


	var DrinkCollectionView = Backbone.View.extend({
		el: "#content",
		initialize:function(){
			console.log(this.$el.html);
			console.log(template);
			_.bindAll(this,"render");

		},
		render:function(){
			var data = {
				name: "hello world"
			};
			var compiledTemplate = _.template(template,data);
			this.$el.html(compiledTemplate);
		}
	});

	return DrinkCollectionView;
});