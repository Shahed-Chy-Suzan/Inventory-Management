 <template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">All Employee / View</li>
        </ol>
        <!-- Icon Cards-->
       <div class="row card container ml-3 border-primary shadow mb-3">
          <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
            <i class="fas fa-chart-area"></i>
            Employee Salary Deatils
          </div>
          <div class="card-body">
            <div class="card-body">
              <div class="table-responsive">
                <label class="d-inline">Search : </label>
               <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px;" placeholder="Search by name"> <br><br>
                <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">
                  <thead>
                    <tr class="bg-info text-white">
                      <th>Name</th>
                      <th>Month</th>
                      <th>Amount</th>
                      <th>Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr v-for="salary in filtersearch" :key="salary.id">
                      <td>{{ salary.name }}</td>
                      <td>{{ salary.salary_month }}</td>
                      <td>{{ salary.amount }}</td>
                       <td>{{ salary.salary_date }}</td>
                      <td>
                        <router-link :to="{name: 'edit-salary', params:{id: salary.id} }" class="btn btn-sm btn-info">Edit Salary</router-link>
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
          this.viewSalary();
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
            // return salary.name.match(this.searchTerm)
            return salary.name.toLowerCase().match(this.searchTerm.toLowerCase())
           })
         }
       },
        methods:{
          viewSalary(){
            let id = this.$route.params.id
    		axios.get('/api/salary/view/'+id)
    		.then(({data}) => (this.salaries = data))
    		.catch(error => this.errors = error.response.data.errors)
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
