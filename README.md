# OPML Parser

[![Build Status](https://travis-ci.org/abhinavmarwaha/opmlparser.svg?branch=master)](https://travis-ci.org/abhinavmarwaha/opmlparser)
[![Pub](https://img.shields.io/pub/v/opmlparser.svg)](https://pub.dartlang.org/packages/opmlparser)

A dart package for parsing OPML.

### Installing

Add this line into your `pubspec.yaml`
```
opmlparser: ^0.0.1
```

Import the package into your dart code using:
```
import 'package:opmlparser/opmlparser.dart';
```

### Example

To parse string into `Opml` object use:
```
Opml opml = Opml.parse(xmlString);
```

### Preview

**OPML**
```
opml.title
opml.dateCreated
opml.dateModified
opml.ownerName
opml.ownerEmail
opml.ownerId
opml.docs
opml.expansionState
opml.vertScrollState
opml.windowTop
opml.windowLeft
opml.windowBottom
opml.windowRight

OpmlItem item = opml.items.first;
item.title
item.text
item.description
item.type
item.version
item.xmlURL
item.httpURL
item.language
item.nestedItems
```

## License

OpmlParser is licensed under the GPLv3 License - see the [LICENSE.md](LICENSE.md) file for details.
