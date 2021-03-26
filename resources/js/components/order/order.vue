 <template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Today Order</li>
        </ol>
        <!-- Icon Cards-->
       <div class="row card container ml-3 border-primary shadow mb-3">
          <div class="card-header text-primary" style="font-size: 20px; font-weight:700;">
            <i class="fas fa-chart-area"></i>
            Today's Order-Table
          </div>
          <div class="card-body pt-0">
            <div class="card-body">
              <div class="table-responsive">
                <label class="d-inline">Search : </label>
               <input type="text" v-model="searchTerm" class="form-control d-inline" style="width:200px;" placeholder="Search by Name"><br><br>
                <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">

                  <thead>
                    <tr class="bg-info text-white">
                      <th>Name</th>
                      <th>Total Amount</th>
                      <th>Pay</th>
                      <th>Due</th>
                      <th>Payby</th>
                      <th>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr v-for="order in filtersearch" :key="order.id">
                      <td>{{ order.name }}</td>
                      <td>{{ order.total }}</td>
                      <td>{{ order.pay }}</td>
                      <td>{{ order.due }}</td>
                      <td>{{ order.payby }}</td>
                      <td>
                        <router-link :to="{name: 'view-order', params:{id: order.id} }" class="btn btn-sm btn-info">View</router-link>
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
            this.allOrder();
        },
        data(){
          return{
            orders:[],
            searchTerm:'',
          }
        },
        computed:{
            filtersearch(){
                return this.orders.filter(order => {
                    //return order.name.match(this.searchTerm)
                    return order.name.toLowerCase().match(this.searchTerm.toLowerCase())
                })
            }
        },
        methods:{
          allOrder(){
            axios.get('/api/orders/')
            .then(({data}) => (this.orders = data))
            .catch()
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
