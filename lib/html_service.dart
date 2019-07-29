class HtmlService {
  HtmlService();
  
  String mapHTML(html) {
    Map<String, String> map = {
      "[date_of_order]": "28.01.2019",
      "[name]": "Natalia Kuczma",
      "[country/city]": "Norway, Oslo"
    };
    return map.entries.fold(html, (prev, e) => prev.replaceAll(e.key, e.value));
  }

}