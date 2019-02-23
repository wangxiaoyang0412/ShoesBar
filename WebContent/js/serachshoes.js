function search_shoes(){
	var shoes=document.getElementById("search").value;
	if(shoes==""){
		window.alert("please insert some key words of what you want");
		return false;
	}
	else{
		document.getElementById("fm").action="./search";
		document.getElementById("fm").submit();
	}
}