var apiKey = "4a0001fa46f1416e9b43ffc96652dc43";
// Get the current top headlines for a country or category
var headlineAPI = "https://newsapi.org/v2/top-headlines?country=us&apiKey=" + apiKey;

getCateroryNews(category) {
  var categoryNews =
      "https://newsapi.org/v2/everything?q=${category}&from=2022-02-19&sortBy=popularity&apiKey=" +
          apiKey;
  return categoryNews;
}

searchNews(key) {
  var api =
      "https://newsapi.org/v2/everything?q=${key}&from=2022-02-19&sortBy=popularity&apiKey=" +
          apiKey;
  return api;
}

var newsBanners = "https: //newsapi.org/v2/everything?q=cryptocurrency&from=2022-02-19&sortBy=popularity&apiKey=" + apiKey;