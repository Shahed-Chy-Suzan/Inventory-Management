<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">    <!-----f----->
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">All Employee</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row card container ml-3 border-primary shadow mb-3">  <!-----f----->
            <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
                <i class="fas fa-chart-area"></i>
                All Employee
                <router-link to="/store-employee" class="btn btn-primary" id="add_new"> Add Employee</router-link>  <!-----f----->
            </div>
            <div class="card-body pt-0">       <!-----f----->
                <div class="card-body">
                    <div class="table-responsive">
                        <label class="d-inline">Search : </label>   <!-----f----->
                        <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px" placeholder="Search by name"><br> <br>    <!-----f----->
                        <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">  <!-----f----->

                            <thead>
                            <tr class="bg-info text-white"> <!-----f----->
                                <th>Name</th>
                                <th>Photo</th>
                                <th>Phone</th>
                                <th>Salary</th>
                                <th>Joining Date</th>
                                <th>Action</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr v-for="employee in filtersearch" :key="employee.id">    <!-------------------------->
                                <td>{{ employee.name }}</td>
                                <td><img :src="employee.photo" id="em_photo"></td>   <!--bind(:) korle R {{}} lage na-->
                                <td>{{ employee.phone }}</td>
                                <td>{{ employee.salary }}</td>
                                <td>{{ employee.joining_date }}</td>
                                <td>
                                    <router-link :to="{name: 'edit-employee', params:{id: employee.id} }" class="btn btn-sm btn-info">Edit</router-link>    <!----it will dynamic thats why applied bind(:to)---->
                                    <!-- <router-link :to="'/edit-category/'+category.id" class="btn btn-warning mr-1">Edit</router-link> --> <!--or, -->
                                    <!-- <router-link :to="`/edit-category/${category.id}`" class="btn btn-sm btn-primary text-white">Edit</router-link> -->
                                    <a @click="deleteEmployee(employee.id)" class="btn btn-sm btn-danger text-white">Delete</a>
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

        created(){          //--immediately showing data_table after opening file
            this.allEmployee();
        },

        data(){
            return{
                employees:[],
                searchTerm:'',
            }
        },
        computed:{                      //----search + show-------
            filtersearch(){
                return this.employees.filter(employee => {
                    //return employee.phone.match(this.searchTerm)
                    return employee.name.toLowerCase().match(this.searchTerm.toLowerCase())
                    // let searchLowerCase = employee.name.toLowerCase()
                    // return searchLowerCase.match(this.searchTerm.toLowerCase())
                })
            }
        },
        methods:{
            allEmployee(){
                axios.get('/api/employee/')        //--'get' will auto call index()_mathod in controller
                    .then(({data}) => this.employees = data)
                    .catch()
            },
            deleteEmployee(id){
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Delete it!'
                }).then((result) => {
                    if (result.value) {
                        axios.delete('/api/employee/'+id)               //------------delete-------------
                            .then(()=>{
                                this.employees = this.employees.filter(employee =>{
                                    return employee.id !=id
                                })
                            })
                            .catch(()=>{
                                this.$router.push({name: 'employee'})
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
    #em_photo{
        height: 40px;
        width: 40px;
    }
</style>
