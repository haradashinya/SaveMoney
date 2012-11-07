require.config({
		paths: {
			zepto: "lib/zepto.min",
			underscore: "lib/underscore-min",
			backbone: "lib/backbone-min",
			router: "router"
		},
		shim: {
			"backbone":{
				deps:["underscore","zepto"],
				exports: "Backbone"
			},
			"underscore":{
				exports: "_"
			},
			"zepto":{
				exports: "$"
			}
		}
});
