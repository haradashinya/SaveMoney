define(["zepto","underscore","backbone","lib/text!templates/summary.html"],function($,_,Backbone,template){
	var SummaryView = Backbone.View.extend({
			filteredDrinks:'',
			drinks:[],
			initialize:function(){
				this.drinks = this.collection.calclateCountByType();
				this.render();
				this.renderHeader();
				this.renderList();
			},
			types: ["drip_coffee","cafe_late"],
			render:function(){
				var typeMap = this.collection.calclateCountByType();
				var res = [];
				Object.keys(typeMap).forEach(function(item){
					res.push({type: item,count:typeMap[item]});
				},this);
				var tmp = _.template(template);
				this.$el.html(tmp);
				return this;
			},
			renderHeader:function(){

				var opts = {
					year: this.collection.currentInfo().year,
					month: this.collection.currentInfo().month
				};
				var hTmpl = "<h1><%= year %> : <%= month %></h1>";
				this.$el.find("#summary-header").html(_.template(hTmpl,opts));
			},
			renderList:function(){
				this.$el.find("#summary-list").html("this is a summary list");
				return this;
			}

	});


	return SummaryView;
});
