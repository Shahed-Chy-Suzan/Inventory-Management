 <template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">All Salary / Index</li>
        </ol>
        <!-- Icon Cards-->
       <div class="row card container ml-3 border-primary shadow mb-3">
          <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
            <i class="fas fa-chart-area"></i>
           All Salary Details
          </div>
          <div class="card-body pt-0">
            <div class="card-body">
              <div class="table-responsive">
                <label class="d-inline">Search : </label>
               <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px;" placeholder="Search by month"> <br><br>
                <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">

                  <thead>
                    <tr class="bg-info text-white">
                      <th>Month Name</th>
                      <th>Details</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr v-for="salary in filtersearch" :key="salary.salary_month">
                      <td>{{ salary.salary_month }}</td>
                      <td>
                        <router-link :to="{name: 'view-salary', params:{id: salary.salary_month} }" class="btn btn-sm btn-info">View Salary</router-link>
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
            this.allSalary();
        },
        data(){
          return{
            salaries:[],
            searchTerm:'',
          }
        },
       computed:{
         filtersearch(){
          return this.salaries.filter(salary => {
                //  return salary.salary_month.match(this.searchTerm)
                return salary.salary_month.toLowerCase().match(this.searchTerm.toLowerCase())
           })
         }
       },
        methods:{
          allSalary(){
            axios.get('/api/salary/')
            .then(({data}) => (this.salaries = data))
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
