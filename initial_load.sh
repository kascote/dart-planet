
echo 'reddit'
dart run bin/dart_planet.dart add -u 'https://www.reddit.com/r/dartlang/.rss' -a dart-reddit -b 'https://reddit.com'

echo 'youtube'
dart run bin/dart_planet.dart add -u 'https://www.youtube.com/feeds/videos.xml?playlist_id=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG' -a fwotd -b 'https://youtube.com'

echo 'medium dartlang'
dart run bin/dart_planet.dart add -u 'https://medium.com/feed/dartlang' -a medium-dart -b 'https://medium.com'

echo 'github weekly'
dart run bin/dart_planet.dart add -u 'https://mshibanami.github.io/GitHubTrendingRSS/weekly/dart.xml' -a gh-weekly -b 'https://github.com'

echo 'medium flutter'
dart run bin/dart_planet.dart add -u 'https://medium.com/feed/flutter' -a medium-flutter -b 'https://medium.com'

echo 'wiki updates'
dart run bin/dart_planet.dart add -u 'https://github.com/dart-lang/sdk/wiki.atom' -a dart-wiki -b 'https://github.com'

echo 'dart announce google group'
dart run bin/dart_planet.dart add -u 'https://bridge.easter.fr/?action=display&bridge=GoogleGroupsBridge&group=announce&account=dartlang.org&format=Atom' -a dart-announce -b 'https://groups.google.com/a/dartlang.org/g/announce'

echo 'flutter reddit'
dart run bin/dart_planet.dart add -u 'https://www.reddit.com/r/FlutterDev/.rss' -a flutter-reddit -b 'https://reddit.com'

echo 'dart stackoverlow'
dart run bin/dart_planet.dart add -u 'https://stackoverflow.com/feeds/tag/dart%20-flutter' -a dart-stackoverflow -b 'https://stackoverflow.com/tags/dart%20-flutter'

echo 'flutter stackoverlow'
dart run bin/dart_planet.dart add -u 'https://stackoverflow.com/feeds/tag/flutter' -a flutter-stackoverflow -b 'https://stackoverflow.com/tags/flutter'