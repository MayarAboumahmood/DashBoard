class ServerConstApis {
  static String baseAPI = 'https://culter-house-backend.onrender.com/';
//////////////WorkerPages
  static String addWorker = '${baseAPI}worker/create';
  static String getWorkers = '${baseAPI}worker/show-all';
  static String deleteWorkers = '${baseAPI}worker/delete';
  static String detailesWorkers = '${baseAPI}worker/show-worker-details';

///////////Admin
  static String adminLogin = '${baseAPI}admins/login';
  static String newAdmin = '${baseAPI}admins/signup';
  static String showAllAdmins = '${baseAPI}admins/show-all';
  static String showStates = '${baseAPI}admins/stats';
  static String getActions = '${baseAPI}admins/getActions';

//////event
  static String showAllEvents = '${baseAPI}events/show-all';
  static String showEventForAdmin = '${baseAPI}events/show-event-for-admin';
  static String addEvent = '${baseAPI}events/create';
  static String deleteEvent = '${baseAPI}events/delete';
  static String confirmWorkers = '${baseAPI}admins/addWorkersToEvent';

////stock
  static String showAllDrinks = '${baseAPI}drinks';
  static String showDrink = '${baseAPI}drinks/view';
  static String addDrink = '${baseAPI}drinks/add';
  static String updateDrink = '${baseAPI}drinks/update';
  static String deleteDrink = '${baseAPI}drinks/delete';

//////// artist
  static String addArtist = '${baseAPI}artist/create';
  static String showArtist = '${baseAPI}artist/show-all';
  static String deleteArtist = '${baseAPI}artist/delete';

////////reservation

  static String newadminreservation = '${baseAPI}admins/make-reservation';
  static String showAdminReservations = '${baseAPI}admins/make-reservation';

/////////forImages
  static String loadImages = baseAPI;
}
