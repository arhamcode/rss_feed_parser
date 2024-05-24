import 'package:xml/xml.dart';

import '../util/helpers.dart';
import 'dublin_core/dublin_core.dart';
import 'media/media.dart';
import 'rss_category.dart';
import 'rss_content.dart';
import 'rss_enclosure.dart';
import 'rss_item_itunes.dart';
import 'rss_item_podcast_index.dart';
import 'rss_source.dart';

class RssItem {
  final String? title;
  final String? description;
  final String? link;

  final List<RssCategory> categories;
  final String? guid;
  final String? pubDate;
  final String? author;
  final String? comments;
  final RssSource? source;
  final RssContent? content;
  final Media? media;
  final RssEnclosure? enclosure;
  final DublinCore? dc;
  final RssItemItunes? itunes;
  final RssItemPodcastIndex? podcastIndex;

  const RssItem({
    this.title,
    this.description,
    this.link,
    this.categories = const <RssCategory>[],
    this.guid,
    this.pubDate,
    this.author,
    this.comments,
    this.source,
    this.content,
    this.media,
    this.enclosure,
    this.dc,
    this.itunes,
    this.podcastIndex,
  });

  factory RssItem.parse(XmlElement element) {
    return RssItem(
      title: findElementOrNull(element, 'title')?.innerText,
      description: findElementOrNull(element, 'description')?.innerText,
      link: findElementOrNull(element, 'link')?.innerText,
      categories: element
          .findElements('category')
          .map((element) => RssCategory.parse(element))
          .toList(),
      guid: findElementOrNull(element, 'guid')?.innerText,
      pubDate: findElementOrNull(element, 'pubDate')?.innerText,
      author: findElementOrNull(element, 'author')?.innerText,
      comments: findElementOrNull(element, 'comments')?.innerText,
      source: RssSource.parse(findElementOrNull(element, 'source')),
      content: RssContent.parse(findElementOrNull(element, 'content:encoded')),
      media: Media.parse(element),
      enclosure: RssEnclosure.parse(findElementOrNull(element, 'enclosure')),
      dc: DublinCore.parse(element),
      itunes: RssItemItunes.parse(element),
      podcastIndex: RssItemPodcastIndex.parse(element),
    );
  }
}
