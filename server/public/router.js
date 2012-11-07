define(["zepto","underscore","backbone"],function($,_,Backbone){
	var Router = Backbone.Router.extend({
			routes: {
				"users/:uuid/drinks/edit": "editDrink"
			},


			editDrink:function(uuid){
				alert(uuid);
				alert("EditDrink");
			}

	});




	var router = new Router();
	Backbone.history.start();






	return Router;

});

