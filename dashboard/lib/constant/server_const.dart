class ServerConstApis{
static String baseAPI = 'http://127.0.0.1:3000/admins/';

//////////////WorkerPages
static String addWorker='${baseAPI}create-worker';
static String getWorkers='${baseAPI}show-all-workers';



///////////Admin 
static String adminLogin='${baseAPI}login';
static String newAdmin='${baseAPI}newadmin';
 

/////////forImages
static String loadImages='http://127.0.0.1:3000/';


}