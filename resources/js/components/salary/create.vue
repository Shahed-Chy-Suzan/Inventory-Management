 <template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Salary / Create</li>
        </ol>
        <!-- Icon Cards-->
       <div class="row container">
         <div class="card col-lg-12 border-primary shadow">
          <div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">
            <i class="fas fa-chart-area"></i>
            Pay Salary
            <router-link to="/given-salary" class="btn btn-primary" id="add_new"> All Employee Salary</router-link>
          </div>

          <div class="card-body">
          	  <form @submit.prevent="SalaryPaid" >
                <div class="form-group">
	              <div class="form-row">
	               <div class="col-md-6">
	                <div class="form-label-group">
                      <label for="firstName">Full Name</label>
	                  <input type="text" v-model="form.name" class="form-control" required>
	                  <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
	                </div>
	               </div>
	               <div class="col-md-6">
	                <div class="form-label-group">
                      <label for="lastName">Email Address</label>
	                  <input type="text" id="lastName" v-model="form.email" class="form-control">
	                  <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
	                </div>
	               </div>
	             </div>
	          </div>
	          <div class="form-group">
	              <div class="form-row">
	               <div class="col-md-6">
	                  <div class="form-group">
                        <label>Select Month</label>
					    <select class="form-control" v-model="form.salary_month">
					      <option value="January">January</option>
					      <option value="February">February</option>
					      <option value="March">March</option>
					      <option value="April">April</option>
					      <option value="May">May</option>
					      <option value="June">June</option>
					      <option value="July">July</option>
					      <option value="August">August</option>
					      <option value="September">September</option>
					      <option value="October">October</option>
					      <option value="November">November</option>
					      <option value="December">December</option>
					    </select>
					    <small class="text-danger" v-if="errors.salary_month">{{ errors.salary_month[0] }}</small>
					  </div>
	               </div>
	               <div class="col-md-6">
	                <div class="form-label-group">
                      <label for="lastName">Salary</label>
	                  <input type="text" v-model="form.salary" class="form-control" required>
	                  <small class="text-danger" v-if="errors.salary">{{ errors.salary[0] }}</small>
	                </div>
	               </div>
	             </div>
	          </div>
               <button type="submit" class="btn btn-success">Pay Now</button>
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
        			salary_month:'',
        		},
        		errors:{},
        	}
        },
        created(){
        	let id = this.$route.params.id
        	axios.get('/api/employee/'+id)
        	.then(({data}) => (this.form = data))
        	.catch()
        },
        methods:{
        	SalaryPaid(){
        		let id = this.$route.params.id
        		axios.post('/api/salary/paid/'+id,this.form)
        		.then(() => {
        			this.$router.push({ name: 'given-salary' })
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
