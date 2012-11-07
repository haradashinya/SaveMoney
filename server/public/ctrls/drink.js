function DrinkCtrl($scope,$http){
	var init = function(){
		return	$http.get("http://localhost:9393/drinks/").success(successCallback);
	};

	var successCallback = function(data){

		alert('callled');
	};





	return init();

}
