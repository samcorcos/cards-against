Meteor.methods({
	getMenus: function(){
    var cheerio = Meteor.npmRequire("cheerio");
    console.log(cheerio);

		var results = Meteor.http.call("GET","https://aspc.pomona.edu/menu/");

    var $ = cheerio.html(results);

    return results.content;
	}
});
