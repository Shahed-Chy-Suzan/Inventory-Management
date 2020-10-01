class AppStorage{

    storeToken(token){      //--To store the 'token' in browser's "Application > Local Storage"
        localStorage.setItem('token',token);
    }

    storeUser(user){       //----To store user's all info-----
        localStorage.setItem('user',user);
    }

    store(token, user){ 
        this.storeToken(token)
        this.storeUser(user)
    }

    clear(){              //-------for logout-----
        localStorage.removeItem('token')
        localStorage.removeItem('user')
    }

    getToken(){
        localStorage.getItem('token');
    }

    getUser(){
        localStorage.getItem('user');
    }

}

export default AppStorage = new AppStorage();
