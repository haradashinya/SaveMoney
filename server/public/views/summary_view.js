define(["zepto","underscore","backbone","lib/text!templates/summary.html"],function($,_,Backbone,template){
	var SummaryView = Backbone.View.extend({
			
			filteredDrinks:'',
			initialize:function(){
				this.collection.calclateCountByType();
				this.render();
			},
			render:function(){
				var tmp = _.template(template,{});
				this.$el.html(tmp);
				return this;
			}
	});


	return SummaryView;
});
