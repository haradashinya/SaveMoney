define(["zepto","underscore","backbone"],function($,_,Backbone){
	var Drink = Backbone.Model.extend({
		url:function(){
			return "/drinks/"
		},
		initialize:function(){
			this.bind("destroy",function(){
				alert("destroy");
			});
		}



	});
	return Drink;
});