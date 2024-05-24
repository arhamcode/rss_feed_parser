import 'package:xml/xml.dart';

import '../../util/helpers.dart';
import 'star_rating.dart';
import 'statistics.dart';
import 'tags.dart';

class Community {
  final StarRating? starRating;
  final Statistics? statistics;
  final Tags? tags;

  const Community({
    this.starRating,
    this.statistics,
    this.tags,
  });

  static Community? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Community(
      starRating:
          StarRating.parse(findElementOrNull(element, 'media:starRating')),
      statistics:
          Statistics.parse(findElementOrNull(element, 'media:statistics')),
      tags: Tags.parse(findElementOrNull(element, 'media:tags')),
    );
  }
}
