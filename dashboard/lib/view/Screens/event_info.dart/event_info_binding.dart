import 'package:dashboard/view/Screens/event_page/event_controller.dart';
import 'package:dashboard/view/widget/artist_card.dart';
import 'package:get/get.dart';

import '../add_artist/add_artist_controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => AddArtistController());
    Get.lazyPut(() => ArtistCardController());
  }
}
