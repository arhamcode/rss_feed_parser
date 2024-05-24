import 'package:xml/xml.dart';

/// Conveys information about a category associated with an entry or feed.
/// This specification assigns no meaning to the content (if any) of this
/// element.
class AtomCategory {
  /// a string that identifies the category to  which the entry or feed belongs.
  final String? term;

  /// an IRI that identifies a categorization scheme.
  final String? scheme;

  /// provides a human-readable label for display in end-user applications.
  /// The content of the "label" attribute is Language-Sensitive.
  /// Entities such as "&amp;" and "&lt;" represent their corresponding
  /// characters ("&" and "<", respectively), not markup.
  final String? label;

  const AtomCategory(this.term, this.scheme, this.label);

  factory AtomCategory.parse(XmlElement element) {
    final term = element.getAttribute('term');
    final scheme = element.getAttribute('scheme');
    final label = element.getAttribute('label');
    return AtomCategory(term, scheme, label);
  }
}
