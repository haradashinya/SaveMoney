define(["zepto","underscore","backbone","lib/text!templates/drink_view.html","lib/text!templates/popup.html"],
	function($,_,Backbone,template,popupTemplate){
		var DrinkView = Backbone.View.extend({
			tagName: "li",
			initialize:function(){
				_.bindAll(this,"removeDrink","updateDrink","render");
				this.model.bind("change",this.changed,this);
			},
			events: {
				"click li .remove-drink": "removeDrink",
				"click .update-drink": "updateDrink"
			},
			render:function(){
				var opts = {
					uuid: window.uuid,
					type: this.model.get("type"),
					_id: this.model.get("_id"),
					user_id: this.model.get("user_id"),
					price: this.model.get("price"),
					date: this.formatDate(this.model.get("created_at"))
				};

				var compiledTemplate = _.template(template,opts);
				this.$el.html(compiledTemplate);
				return this;
			},
			formatDate:function(date){
				return date.split("T")[0];
			},
			removeDrink:function(){
				this.$el.remove();
				this.model.destroy();
			},
			updateDrink:function(){
				this.model.set({type: "nobi"});
				this.model.trigger("update");
			},
			changed:function(){
				this.render();
			}

		});



		return DrinkView;
	});
