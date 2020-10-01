<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Category / Edit</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row container">
            <div class="card col-lg-12  border-primary shadow">
                <div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">
                    <i class="fas fa-chart-area"></i>
                    Category Update
                    <router-link to="/category" class="btn btn-primary" id="add_new"> All Category</router-link>
                </div>
                <div class="card-body">
                    <form @submit.prevent="caetgoryUpdate">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-label-group">
                                        <label>Category Name : </label>
                                        <input type="text" v-model="form.category_name" class="form-control"   required="">
                                        <small class="text-danger" v-if="errors.category_name">{{ errors.category_name[0] }}</small>
                                    </div>
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
                    category_name :''

                },
                errors:{},
            }
        },
        created(){
            let id = this.$route.params.id
            axios.get('/api/category/'+id)
                .then(({data}) => (this.form = data))
                .catch()
        },
        methods:{
            caetgoryUpdate(){
                let id = this.$route.params.id
                axios.patch('/api/category/'+id,this.form)
                    .then(() => {
                        this.$router.push({ name: 'category' })
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
