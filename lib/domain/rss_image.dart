import 'package:xml/xml.dart';

import '../util/helpers.dart';

class RssImage {
  final String? title;
  final String? url;
  final String? link;

  const RssImage(this.title, this.url, this.link);

  static RssImage? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    final title = findElementOrNull(element, 'title')?.innerText;
    final url = findElementOrNull(element, 'url')?.innerText;
    final link = findElementOrNull(element, 'link')?.innerText;

    return RssImage(title, url, link);
  }
}
