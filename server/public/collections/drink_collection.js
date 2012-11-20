define(["zepto","underscore","backbone","drink"],
	function($,_,Backbone,Drink){
		var DrinkCollection = Backbone.Collection.extend({
			url:function(){
				return "http://localhost:9393/users/" + window.uuid +  "/drinks/";
			},
			initialize:function(uuid){
			},
			calculatePriceByType:function(){
				var drinks = this.drinksByFilteredThisMonth();
			},
			calclateCountByType:function(){
				var drinks = this.drinksByFilteredThisMonth();
				this.typeMap = {};
				// if type is undefined , then inclement count
				drinks.forEach(function(drink){
					if (this.typeMap[drink.type] !== undefined){
						this.typeMap[drink.type] += 1;
					}else{
						this.typeMap[drink.type] = 0;
					}
				},this);
				return this.typeMap;
			},
			drinksByFilteredThisMonth:function(){
				var current = this.currentInfo();
				var items = this.toJSON();
				var filterdArr = items.filter(function(item){
					var year = parseInt(item.created_at.split("-")[0],10);
					var month = parseInt(item.created_at.split("-")[1],10);
					return current.year === year && current.month === month;
				},this);
				return filterdArr;
			},
			// month currentInfo.month
			// year currentInfo.year
			currentInfo:function(){
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				return {year:year,month:month};
			}

		});

		return DrinkCollection;
	});
