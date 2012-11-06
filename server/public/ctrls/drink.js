function DrinkCtrl($scope,$http){
	var isAlreadyCalled = false;
	var init = function(){
		alert("init");
		return	$http.get("http://localhost:9393/drinks/").success(successCallback);
	};


	var successCallback = function(data){
		if (isAlreadyCalled){
			alert('already called');
			return;
		}

		alert('callled');
		isAlreadyCalled = true;
	};





	return init();

}
