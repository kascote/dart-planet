import 'package:args/command_runner.dart';

import './add_feed.dart';
import './update_feed.dart';

class FeedCmd extends Command<int> {
  @override
  final name = 'feed';

  @override
  final description = 'feed handling commands';

  FeedCmd() {
    addSubcommand(AddFeedCmd());
    addSubcommand(UpdateFeedCmd());
  }
}
