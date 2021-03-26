 <template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">All Employee / Salary</li>
        </ol>
        <!-- Icon Cards-->
       <div class="row card container ml-3 border-primary shadow mb-3">
          <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
            <i class="fas fa-chart-area"></i>
            Employee Salary Pay
          </div>
          <div class="card-body pt-0">
            <div class="card-body">
              <div class="table-responsive">
                <label class="d-inline">Search : </label>
               <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px;" placeholder="Search by name"><br><br>
                <table class="table table-bordered table-striped table-hover table-warning" id="" width="100%" cellspacing="0">

                  <thead>
                    <tr class="bg-info text-white">
                      <th>Name</th>
                      <th>Photo</th>
                      <th>Phone</th>
                      <th>Salary</th>
                      <th>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr v-for="employee in filtersearch" :key="employee.id">
                      <td>{{ employee.name }}</td>
                      <td><img :src="employee.photo" id="em_photo"></td>
                      <td>{{ employee.phone }}</td>
                      <td>{{ employee.salary }}</td>
                      <td>
                        <router-link :to="{name: 'pay-salary', params:{id: employee.id} }" class="btn btn-sm btn-info">Pay Salary</router-link>
                        <!-- <router-link :to="'/pay-salary/'+employee.id" class="btn btn-sm btn-info">Pay Salary</router-link> --> <!--or, -->
                        <!-- <router-link :to="`/pay-salary/${employee.id}`" class="btn btn-sm btn-info">Pay Salary</router-link> -->
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
            this.allEmployee();
        },
        data(){
          return{
            employees:[],
            searchTerm:'',
          }
        },
       computed:{
         filtersearch(){
          return this.employees.filter(employee => {
            //  return employee.name.match(this.searchTerm)
            return employee.name.toLowerCase().match(this.searchTerm.toLowerCase())
           })
         }
       },
        methods:{
          allEmployee(){
            axios.get('/api/employee/')
            .then(({data}) => (this.employees = data))
            .catch()
          },
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
