define(["zepto","underscore","backbone","lib/text!templates/summary.html"],function($,_,Backbone,template){
	var SummaryView = Backbone.View.extend({
			filteredDrinks:'',
			drinks:[],
			initialize:function(){
				this.drinks = this.collection.calclateCountByType();
				this.renderInit();
				this.renderHeader();
				this.renderList();
			},
			types: ["drip_coffee","cafe_late"],
		  // create base template
			renderInit:function(){

				var tmp = _.template(template);
				this.$el.html(tmp);
				return this;
			},
		// show h1
			renderHeader:function(){
				var opts = {
					year: this.collection.currentInfo().year,
					month: this.collection.currentInfo().month,
					className: "summary-title"
				};
				var hTmpl = "<h1 class='<%= className %>'><%= year %> : <%= month %></h1>";
				// for debug
				if (!hTmpl) hTmpl = "<h1 class='<%= className %>'>2012 : 11</h1>";
				this.$el.find("#summary-header").html(_.template(hTmpl,opts));
			},
		// show each typeMap {drinkType: count}
			renderList:function(){
				var dom = "";
				this.typeMaps().forEach(function(item){
					dom += "<li class='summary-li'>" + item.type + item.count  +  "</li>";
				},this);

				this.$el.find("#summary-list").html(dom);
				return this;
			},
		typeMaps:function(){
			var typeMap = this.collection.calclateCountByType();
			var res = [];
			Object.keys(typeMap).forEach(function(item){
				res.push({type: item,count:typeMap[item]});
			},this);

			return res;
		}

	});


	return SummaryView;
});
