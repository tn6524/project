window.onpageshow = function(event){
	if (event.persisted || (window.performance && window.performance.navigation.type == 2) || event.originalEvent && event.originalEvent.persisted) {
		location.reload();
	}
}