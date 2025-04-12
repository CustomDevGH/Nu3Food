// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

Future<List<EURssFeedModelStruct>> parseXml() async {
  final response = await http.get(Uri.parse(
      'https://webgate.ec.europa.eu/rasff-window/backend/public/consumer/rss/all/'));

  // Parse the XML data using the xml package
  final document = XmlDocument.parse(response.body);

  // Get the list of items from the XML data
  final items = document.findAllElements('item');

  // Create a list to store the parsed data
  final rssFeeds = <EURssFeedModelStruct>[];

  // Loop through each item and parse the data
  for (final item in items) {
    final title = item.children[1].innerText.split(" - ")[1];
    final link = item.children[3].innerText;

    // Create a new EURssFeedModelStruct object and add it to the list
    rssFeeds.add(EURssFeedModelStruct(title: title, link: link));
  }

  // Return the list of parsed data
  return rssFeeds;
}
