Meteor.methods({
	getMenus: function(){
    var cheerio = Meteor.npmRequire("cheerio")
    var $ = cheerio.load(results);
		var results = Meteor.http.call("GET","https://aspc.pomona.edu/menu/");
    return results;
	}
});
