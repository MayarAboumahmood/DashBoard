import 'package:get/get.dart';

import '../../widget/artist_card.dart';

class EventBinding implements Bindings
{
  @override
  void dependencies() {
 Get.lazyPut(() => ArtistCardController());
  }

}