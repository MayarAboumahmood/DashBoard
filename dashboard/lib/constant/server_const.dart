class ServerConstApis{
static String baseAPI = 'http://127.0.0.1:3000/admins/';
static String getWorkers='${baseAPI}show-all-workers';/// that needs to edit 

//////////////AddPages
static String addWorker='${baseAPI}create-worker';



///////////Admin 
static String adminLogin='${baseAPI}login';
static String newAdmin='${baseAPI}newadmin';


}