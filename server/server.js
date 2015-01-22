Meteor.methods({
	getMenus: function(){
		var results = Meteor.http.get("https://aspc.pomona.edu/menu/", {timeout: 30000});
    var html = results.content;

    $ = cheerio.load(html)

    var table = $("#meal_header");
    console.log(table);

    return html;
	}
});
