import 'package:opmlparser/util/xml.dart';
import 'package:xml/xml.dart';

// item class for Opml i.e. the feed details
class OpmlItem {
  final String title;
  final String text;
  final String description;
  final String type;
  final String version;
  final String xmlUrl;
  final String htmlUrl;
  final String language;
  final List<OpmlItem> nesteditems;

  OpmlItem(
      {this.title,
      this.text,
      this.description,
      this.type,
      this.version,
      this.xmlUrl,
      this.htmlUrl,
      this.language,
      this.nesteditems});

  // parses [element] into a OpmlItem from its attributes
  factory OpmlItem.parse(XmlNode element) {
    return OpmlItem(
        title: element.getAttribute('title'),
        text: element.getAttribute('text'),
        description: element.getAttribute('description'),
        type: element.getAttribute('type'),
        version: element.getAttribute('version'),
        xmlUrl: element.getAttribute('xmlUrl'),
        htmlUrl: element.getAttribute('htmlUrl'),
        language: element.getAttribute('language'),
        nesteditems: element
            .findAllElements('outline')
            .map((e) => OpmlItem.parseWithoutNested(e))
            .toList());
  }

  factory OpmlItem.parseWithoutNested(XmlNode element) {
    return OpmlItem(
      title: element.getAttribute('title'),
      text: element.getAttribute('text'),
      description: element.getAttribute('description'),
      type: element.getAttribute('type'),
      version: element.getAttribute('version'),
      xmlUrl: element.getAttribute('xmlUrl'),
      htmlUrl: element.getAttribute('htmlUrl'),
      language: element.getAttribute('language'),
    );
  }
}
