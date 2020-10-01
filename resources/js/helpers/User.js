import AppStorage from './AppStorage'
import Token from './Token'


class User{

    responseAfterLogin(response){   //(token + other's_info) situated in 'data' property
        const access_token = response.data.access_token
        const username = response.data.name
        if (Token.isValid(access_token)) {          //called 'Token' class er isValid method
            AppStorage.store(access_token, username)   //called 'AppStorage' class er store()
        }
    }

    hasToken(){
        const storeToken = localStorage.getItem('token');
        if (storeToken) {                           //called 'Token' class er isValid()
            return Token.isValid(storeToken) ? true:false
        }
        return false
    }

    loggedIn(){
        return this.hasToken()
    }

    // loggout(){
    //     AppStorage.clear()      //called 'AppStorage' class er clear()
    //     window.location('/')    //--file move hocche But Page_reload nichhe,
    //     this.$router.push('/')   //OR--file move hocche & Page_reload Nibe NA,
    // }

    name(){
        if(this.loggedIn()){
            return localStorage.getItem('user')
        }
    }

    id(){
        if (this.loggedIn()) {              //called 'Token' class er payload()
            const payload = Token.payload(localStorage.getItem('token'))
            return payload.sub      //--here,'sub' indicates to 'user's id'[default]
        }
        return false
    }

}

export default User = new User()
