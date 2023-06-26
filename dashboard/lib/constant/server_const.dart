class ServerConstApis {
  static String baseAPI = 'http://127.0.0.1:3000/admins/';

//////////////WorkerPages
static String addWorker='${baseAPI}create-worker';
static String getWorkers='${baseAPI}show-all-workers';
static String deleteWorkers='${baseAPI}delete-worker';




///////////Admin
  static String adminLogin = '${baseAPI}login';
  static String newAdmin = '${baseAPI}signup';
  static String showAllAdmins = '${baseAPI}show-all-admins';

//////event
  static String showAllEvents = '${baseAPI}show-all-events';
  static String addEvent = '${baseAPI}create-event';

////stock
   static String showAllDrinks='${baseAPI}show-all-drinks';
   static String addDrink='${baseAPI}create-drink';

/////////forImages
  static String loadImages = 'http://127.0.0.1:3000/';
}
