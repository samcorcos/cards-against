
Template.hello.rendered = function(){
	Meteor.call('getMenus',function(err,res){
		if(err){console.log('ERR ',err)}
			else{console.log('RES ',res)}


		// err ? console.log(err) : console.log(res);
	});
}