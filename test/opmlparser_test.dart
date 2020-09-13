import 'dart:io';

import 'package:test/test.dart';
import 'package:opmlparser/opmlparser.dart';
import 'package:opmlparser/util/datetime.dart';

void main() {
  test('parse example.opml', () {
    String opmlString = File('test/opml/example.opml').readAsStringSync();

    Opml opml = Opml.parse(opmlString);

    expect(opml.title, 'mySubscriptions.opml');
    expect(opml.dateCreated, parseDateTime('Sat, 18 Jun 2005 12:11:52 GMT'));
    expect(opml.dateModified, parseDateTime('Tue, 02 Aug 2005 21:42:48 GMT'));
    expect(opml.ownerName, 'Dave Winer');
    expect(opml.ownerEmail, 'dave@scripting.com');
    expect(opml.expansionState, '');
    expect(opml.vertScrollState, '1');
    expect(opml.windowTop, '61');
    expect(opml.windowLeft, '304');
    expect(opml.windowBottom, '562');
    expect(opml.windowRight, '842');

    expect(opml.items.length, 13);

    expect(opml.items.first.text, 'CNET News.com');
    expect(opml.items.first.description,
        'Tech news and business reports by CNET News.com. Focused on information technology, core topics include computers, hardware, software, networking, and Internet media.');
    expect(opml.items.first.htmlUrl, 'http://news.com.com/');
    expect(opml.items.first.language, 'unknown');
    expect(opml.items.first.title,
        'CNET News.com'); //Mon, 26 Mar 2018 14:00:00 PDT
    expect(opml.items.first.type, 'rss');
    expect(opml.items.first.version, 'RSS2');
    expect(opml.items.first.xmlUrl, 'http://news.com.com/2547-1_3-0-5.xml');
  });

  test('parse nestedExample.opml', () {
    String opmlString = File('test/opml/nestedExample.opml').readAsStringSync();

    Opml opml = Opml.parse(opmlString);
    expect(opml.title, 'RSS');
    expect(opml.items.length, 2);
    expect(opml.items.first.title, 'Golang');
    expect(opml.items.first.text, 'Golang');
    expect(opml.items.first.nesteditems.length, 5);
    expect(
        opml.items.first.nesteditems.first.htmlUrl, 'https://golangcode.com/');
    expect(opml.items.first.nesteditems.first.xmlUrl,
        'https://golangcode.com/index.xml');
    expect(opml.items.first.nesteditems.first.type, 'rss');
    expect(opml.items.first.nesteditems.first.title, 'GolangCode');
    expect(opml.items.first.nesteditems.first.text, 'GolangCode');
  });
}
