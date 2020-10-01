
class Notification{

    success(){
        new Noty({
            type:'success',
            layout:'topRight',
            text: 'Successfully Done !',
            timeout:1000,
        }).show();
    }

    cart_success(){
        new Noty({
            type: 'success',
            layout: 'topRight',
            text: 'Successfully Added !',
            timeout: 1000,
        }).show();
    }

    alert(){
        new Noty({
            type:'alert',
            layout:'topRight',
            text: 'Are you sure ?',
            timeout:1000,
        }).show();
    }

    error(){
        new Noty({
            type:'error',
            layout:'topRight',
            text: 'Something went wrong !',
            timeout:1000,
        }).show();
    }

    warning(){
        new Noty({
            type:'warning',
            layout:'topRight',
            text: 'Oops! Wrong',
            timeout:1000,
        }).show();
    }

    image_validation(){
        new Noty({
            type:'error',
            layout:'topRight',
            text:'Image should be less than 1MB',
            timeout:1000,
        }).show();
    }
}

export default Notification = new Notification()
