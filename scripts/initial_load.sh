#!/bin/sh

CWD="$(dirname "${BASH_SOURCE}")"
source "$CWD/_global.sh"

echo 'reddit'
$CWD/$BIN/$EXEC add -u 'https://www.reddit.com/r/dartlang/.rss' -a dart-reddit -b 'https://reddit.com'

echo 'youtube'
$CWD/$BIN/$EXEC add -u 'https://www.youtube.com/feeds/videos.xml?playlist_id=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG' -a fwotd -b 'https://youtube.com'

echo 'medium dartlang'
$CWD/$BIN/$EXEC add -u 'https://medium.com/feed/dartlang' -a medium-dart -b 'https://medium.com'

echo 'github weekly'
$CWD/$BIN/$EXEC add -u 'https://mshibanami.github.io/GitHubTrendingRSS/weekly/dart.xml' -a gh-weekly -b 'https://github.com'

echo 'medium flutter'
$CWD/$BIN/$EXEC add -u 'https://medium.com/feed/flutter' -a medium-flutter -b 'https://medium.com'

echo 'wiki updates'
$CWD/$BIN/$EXEC add -u 'https://github.com/dart-lang/sdk/wiki.atom' -a dart-wiki -b 'https://github.com'

echo 'dart announce google group'
$CWD/$BIN/$EXEC add -u 'https://bridge.easter.fr/?action=display&bridge=GoogleGroupsBridge&group=announce&account=dartlang.org&format=Atom' -a dart-announce -b 'https://groups.google.com/a/dartlang.org/g/announce'

echo 'flutter reddit'
$CWD/$BIN/$EXEC add -u 'https://www.reddit.com/r/FlutterDev/.rss' -a flutter-reddit -b 'https://reddit.com'

echo 'dart stackoverlow'
$CWD/$BIN/$EXEC add -u 'https://stackoverflow.com/feeds/tag/dart%20-flutter' -a dart-stackoverflow -b 'https://stackoverflow.com/tags/dart%20-flutter'

echo 'flutter stackoverlow'
$CWD/$BIN/$EXEC add -u 'https://stackoverflow.com/feeds/tag/flutter' -a flutter-stackoverflow -b 'https://stackoverflow.com/tags/flutter'