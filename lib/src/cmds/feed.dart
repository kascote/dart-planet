import 'package:args/command_runner.dart';

import './add_feed.dart';
import './clear_errors.dart';
import './disable_feed.dart';
import './feed_list.dart';
import './purge_feeds.dart';
import './update_feed.dart';

class FeedCmd extends Command<int> {
  @override
  final name = 'feed';

  @override
  final description = 'feed handling commands';

  FeedCmd() {
    addSubcommand(AddFeedCmd());
    addSubcommand(UpdateFeedCmd());
    addSubcommand(ClearErrorsCmd());
    addSubcommand(FeedListCmd());
    addSubcommand(DisableCmd());
    addSubcommand(PurgeFeedsCmd());
  }
}
