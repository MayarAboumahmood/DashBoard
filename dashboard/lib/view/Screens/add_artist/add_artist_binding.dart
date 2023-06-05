import 'package:dashboard/view/Screens/add_artist/add_artist_controller.dart';
import 'package:get/get.dart';

class AddArtistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddArtistController());
  }
}
