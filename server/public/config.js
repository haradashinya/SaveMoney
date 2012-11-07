require.config({
		paths: {
			zepto: "lib/zepto.min",
			underscore: "lib/underscore-min",
			backbone: "lib/backbone-min",
			drink_collection:"collections/drink_collection",
			drink_collection_view:"views/drink_collection_view",
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
			},
			"drink_collection":{
				exports: "DrinkCollection"
			},
			"drink_collection_view":{
				exports: "DrinkCollectionView"
			}
		}
});
