
require('./bootstrap');

// window.Vue = require('vue'); //or bellow line
import Vue from 'vue'      //--these nxt 3_lines are newly added as we installed vue-router
import VueRouter from 'vue-router'
Vue.use(VueRouter)


//----route imported-------
import {routes} from './routes';


//---import User Class----
import User from './helpers/User';
window.User = User                  //--for 'globally' use


//----import Notification Class-------
import Notification from './helpers/Notification';  //--for 'globally' use
window.Notification = Notification


//----start-----Sweetalert2------
import Swal from 'sweetalert2'
window.Swal = Swal              //--for 'globally' use

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

window.Toast = Toast;       //--for 'globally' use
//----End-----Sweetalert2------------//------


//------Reload-----
window.Reload = new Vue();   //--for reload() method /to instantly reload page


const router = new VueRouter({  //------------
    routes,
    mode: 'history'     //To remove '#' from URL
})

const app = new Vue({
    el: '#app',
    router         //-----------
});
