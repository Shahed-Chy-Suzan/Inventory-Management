class Token{
    isValid(token){
        const payload = this.payload(token);
        if (payload) {                         //iss mane issu_date bojai
            return payload.iss == "http://127.0.0.1:8000/api/auth/login"  || "http://127.0.0.1:8000/api/auth/register" ? true: false
        }
        return false
    }

    payload(token){
        const payload = token.split('.')[1]  // (2nd value mean) the index after dot(.) of 3 parts of Token (www.jwt.io)
        return this.decode(payload)         //decode is just a variable/(function).
    }

    decode(payload){
        return JSON.parse(atob(payload))  //atob use for encode/decode
    }
}

export default Token = new Token()
