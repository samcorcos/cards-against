Meteor.methods({
	getMenus: function(){
		var results = Meteor.http.call("GET","https://aspc.pomona.edu/menu/");
		// console.log('RESPONSE ',results)
		console.log('ARGUMENTS', '\n', '\n',arguments)
	}
});

