<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Supplier / Edit</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row container">
            <div class="card col-lg-12 border-primary shadow">
                <div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">
                    <i class="fas fa-chart-area"></i>
                    Supplier Update
                    <router-link to="/supplier" class="btn btn-primary" id="add_new"> All Supplier</router-link>
                </div>
                <div class="card-body">
                    <form @submit.prevent="supplierUpdate" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                    <div class="form-label-group">
                                        <input type="text" v-model="form.name" class="form-control" required>
                                        <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <label>Email Address</label>
                                        <input type="text" v-model="form.email" class="form-control">
                                        <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <label>Address</label>
                                        <input type="text" v-model="form.address" class="form-control" required>
                                        <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <label >Shop Name</label>
                                        <input type="text" v-model="form.shopname" class="form-control" required>
                                        <small class="text-danger" v-if="errors.shopname">{{ errors.shopname[0] }}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-label-group">
                                        <label >Phone Number</label>
                                        <input type="text" v-model="form.phone" class="form-control" required="">
                                        <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="file" class="btn btn-info" @change="onFileselected">
                                        <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <img :src="'/'+form.photo" style="height:40px; width: 40px;">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        mounted(){
            if (!User.loggedIn()) {
                this.$router.push({ name:'/' })
            }
        },
        data(){
            return{
                form:{
                    name :'',
                    email :'',
                    salary:'',
                    address:'',
                    photo :'',
                    newphoto:'',
                    phone:'',
                    nid : '',
                    joining_date:''
                },
                errors:{},
            }
        },
        created(){
            let id = this.$route.params.id
            axios.get('/api/supplier/'+id)
                .then(({data}) => (this.form = data))
                .catch()
        },
        methods:{
            onFileselected(event){
                let file=event.target.files[0];
                if (file.size > 1048770) {
                    Notification.image_validation()
                }else{
                    let reader = new FileReader();
                    reader.onload = event => {
                        this.form.newphoto = event.target.result
                    };
                    reader.readAsDataURL(file);
                }
            },
            supplierUpdate(){
                let id = this.$route.params.id
                axios.patch('/api/supplier/'+id,this.form)
                    .then(() => {
                        this.$router.push({ name: 'supplier' })
                        Notification.success()
                    })
                    .catch(error => this.errors = error.response.data.errors)
            },
        }
    }
</script>


<style>
    #add_new{
        float: right;
    }
</style>
