define(["zepto","underscore","backbone","lib/text!templates/summary.html"],function($,_,Backbone,template){
	var SummaryView = Backbone.View.extend({
			initialize:function(){
				this.renderInit();
				this.renderHeader();
				this.fetchDrinks();
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
			renderList:function(data){
				//add for debug
				var dom = "";
				if (data.length === 0){
					dom += "<li>hello world</li>";
				}else{
				data.forEach(function(item){
					dom += "<li class='summary-li'>" + item.type + item.count   + "</li>";
				},this);
				}


				this.$el.find("#summary-list").html(dom);
				return this;
			},
		fetchDrinks:function(){
			var self = this;
			var typeMap = this.collection.incCountByType();
			var res = [];

			var injectItem = function(typeMap){
				Object.keys(typeMap).forEach(function(item){
					res.push({type: item,count:typeMap[item]});
				},this);
			};
			this.collection.fetch({
				success:function(data){
					var typeMap = self.collection.incCountByType();
					injectItem(typeMap);
					self.renderList(res);
				}
			});
			return res;
		}


	});


	return SummaryView;
});
