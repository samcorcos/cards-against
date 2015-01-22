Meteor.methods({
	getMenus: function(){
		var results = Meteor.http.get("https://aspc.pomona.edu/menu/", {timeout: 30000});
    var html = results.content;
    $ = cheerio.load(html)

		// These values are hard-coded
		var meals = ["Breakfast", "Lunch", "Dinner"];

		// These will be the IDs we will iterate over to get the menu items.
		var diningHalls = ["frank_menu", "frary_menu", "oldenborg_menu", "cmc_menu", "scripps_menu", "pitzer_menu", "mudd_menu"];

    var table = $("#meal_header>th").text();
    console.log(table);


		var parseMenu = function(diningHalls) {
			
		}




    return html;
	}
});
