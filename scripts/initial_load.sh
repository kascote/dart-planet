#!/usr/bin/bash

CWD="$(dirname "${BASH_SOURCE}")"
source "$CWD/_global.sh"

echo 'reddit'
$CWD/$BIN/$EXEC feed add -u 'https://www.reddit.com/r/dartlang/.rss' -j dart-reddit -b 'https://reddit.com'

echo 'youtube'
$CWD/$BIN/$EXEC feed add -u 'https://www.youtube.com/feeds/videos.xml?playlist_id=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG' -j flutter-wotw -b 'https://youtube.com'

echo 'medium dartlang'
$CWD/$BIN/$EXEC feed add -u 'https://medium.com/feed/dartlang' -j dart-blog -b 'https://medium.com'

echo 'github weekly'
$CWD/$BIN/$EXEC feed add -u 'https://mshibanami.github.io/GitHubTrendingRSS/weekly/dart.xml' -j dart-ghw -b 'https://github.com'

echo 'medium flutter'
$CWD/$BIN/$EXEC feed add -u 'https://medium.com/feed/flutter' -j flutter-blog -b 'https://medium.com'

echo 'wiki updates'
$CWD/$BIN/$EXEC feed add -u 'https://github.com/dart-lang/sdk/wiki.atom' -j dart-wiki -b 'https://github.com'

echo 'dart announce google group'
$CWD/$BIN/$EXEC feed add -u 'https://bridge.easter.fr/?action=display&bridge=GoogleGroupsBridge&group=announce&account=dartlang.org&format=Atom' -j dart-announce -b 'https://groups.google.com/a/dartlang.org/g/announce'

echo 'flutter reddit'
$CWD/$BIN/$EXEC feed add -u 'https://www.reddit.com/r/FlutterDev/.rss' -j flutter-reddit -b 'https://reddit.com'

echo 'dart stackoverlow'
$CWD/$BIN/$EXEC feed add -u 'https://stackoverflow.com/feeds/tag/dart%20-flutter' -j dart-so -b 'https://stackoverflow.com/tags/dart%20-flutter'

echo 'flutter stackoverlow'
$CWD/$BIN/$EXEC feed add -u 'https://stackoverflow.com/feeds/tag/flutter' -j flutter-so -b 'https://stackoverflow.com/tags/flutter'
