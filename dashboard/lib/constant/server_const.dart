class ServerConstApis {
  static String baseAPI = 'http://127.0.0.1:3000/';

//////////////WorkerPages
static String addWorker='${baseAPI}worker/create';
static String getWorkers='${baseAPI}worker/show-all';
static String deleteWorkers='${baseAPI}worker/delete';
static String detailesWorkers='${baseAPI}worker/show-worker-details';




///////////Admin
  static String adminLogin = '${baseAPI}admins/login';
  static String newAdmin = '${baseAPI}admins/signup';
  static String showAllAdmins = '${baseAPI}admins/show-all';

//////event
  static String showAllEvents = '${baseAPI}events/show-all';
  static String addEvent = '${baseAPI}events/create';

////stock
   static String showAllDrinks='${baseAPI}drinks';
   static String addDrink='${baseAPI}drinks/add';
   static String updateDrink='${baseAPI}drinks/update';
   static String deleteDrink='${baseAPI}drinks/delete';


//////// artist
static String addArtist='${baseAPI}artist/create';
static String showArtist='${baseAPI}artist/show-all';
static String deleteArtist='${baseAPI}artist/delete';

/////////forImages
  static String loadImages = 'http://127.0.0.1:3000/';
}
