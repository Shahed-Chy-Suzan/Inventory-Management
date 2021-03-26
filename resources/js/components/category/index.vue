<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">All Category</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row card container ml-3 border-primary shadow mb-3">
            <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
                <i class="fas fa-chart-area"></i>
                All Category
                <router-link to="/store-category" class="btn btn-primary" id="add_new"> Add New</router-link>
            </div>
            <div class="card-body pt-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <label class="d-inline">Search : </label>
                        <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px;" placeholder="Search by name"><br><br>
                        <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">

                            <thead>
                            <tr class="bg-info text-white">
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr v-for="category in filtersearch" :key="category.id">
                                <td>{{ category.category_name }}</td>
                                <td>
                                    <router-link :to="{name: 'edit-category', params:{id: category.id} }" class="btn btn-sm btn-info">Edit</router-link>
                                    <!-- <router-link :to="'/edit-category/'+category.id" class="btn btn-warning mr-1">Edit</router-link> --> <!--or, -->
                                    <!-- <router-link :to="`/edit-category/${category.id}`" class="btn btn-sm btn-primary text-white">Edit</router-link> -->
                                    <a @click="deleteCategory(category.id)" class="btn btn-sm btn-danger text-white">Delete</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
        created(){
            this.allCategory();
        },
        data(){
            return{
                categories:[],
                searchTerm:'',
            }
        },
        computed:{
            filtersearch(){
                return this.categories.filter(category => {
                    //return category.category_name.match(this.searchTerm)
                    return category.category_name.toLowerCase().match(this.searchTerm.toLowerCase())
                    // let searchLowerCase = category.name.toLowerCase()
                    // return searchLowerCase.match(this.searchTerm.toLowerCase())
                })
            }
        },
        methods:{
            allCategory(){
                axios.get('/api/category/')
                    .then(({data}) => (this.categories = data))
                    .catch()
            },
            deleteCategory(id){
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        axios.delete('/api/category/'+id)
                            .then(()=>{
                                this.categories = this.categories.filter(category =>{
                                    return category.id !=id
                                })
                            })
                            .catch(()=>{
                                this.$router.push({name: 'category'})
                            })
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                    }
                })
            }
        },
    }
</script>


<style>
    #add_new{
        float: right;
    }
</style>
