<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Orders / Search Order</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row container">
            <div class="card col-lg-12 border-primary shadow">
                <div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">
                    <i class="fas fa-chart-area"></i>
                    Search Orders
                    <router-link to="/order" class="btn btn-primary" id="add_new"> Today Order</router-link>
                </div>

<!------------Search By Date---------------->
<div class="card-body">
    <div class="row">
        <div class="col-lg-6">
            <form @submit.prevent="searchDate">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="form-label-group">
                                <label>Search By Date : </label>
                                <input type="date" v-model="date" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>

<!------------Search By Month---------------->
        <div class="col-lg-6">
            <form @submit.prevent="searchMonth">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="form-label-group">
                                <label>Search By Month : </label>
                                <select class="form-control" v-model="month">
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
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>
    </div>
</div>  <!-----------End_Search_text_box------------------>


<!-----------Search_Result------------------>
    <div class="row container pt-4">
        <div class="card col-lg-12 border-primary shadow mb-3">
            <div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">
                <i class="fas fa-chart-area"></i>
                Searched Order Details
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover table-warning border-primary" id="" width="100%" cellspacing="0">

                        <thead>
                            <tr class="bg-info text-white">
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th>Vat</th>
                                <th>Total</th>
                                <th>Pay</th>
                                <th>Due</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr v-for="order in orders" :key="order.id">
                                <td>{{ order.name }}</td>
                                <td>{{ order.qty }}</td>
                                <td>{{ order.sub_total }}</td>
                                <td>{{ order.vat }}</td>
                                <td>{{ order.total }}</td>
                                <td>{{ order.pay }}</td>
                                <td>{{ order.due }}</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td>{{ quantity }} piece</td>
                                <td>{{ subtotal }} Tk</td>
                                <td></td>
                                <td>{{ total }} Tk</td>
                                <td>{{ pay }} Tk</td>
                                <td>{{ due }} Tk</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
    </div>
    <!--------End_Search_Result------------>


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
                date :'',
                orders:'',
                month:'',
            }
        },
        computed:{
            quantity(){
                let sum=0;
                for(let i=0; i < this.orders.length; i++ ){
                    sum += (parseFloat(this.orders[i].qty));
                }
                return sum;
            },
            subtotal(){
                let sum=0;
                for(let i=0; i < this.orders.length; i++ ){
                    sum += (parseFloat(this.orders[i].sub_total));
                }
                return sum;
            },
            total(){
                let sum=0;
                for(let i=0; i < this.orders.length; i++ ){
                    sum += (parseFloat(this.orders[i].total));
                }
                return sum;
            },
            pay(){
                let sum=0;
                for(let i=0; i < this.orders.length; i++ ){
                    sum += (parseFloat(this.orders[i].pay));
                }
                return sum;
            },
            due(){
                let sum=0;
                for(let i=0; i < this.orders.length; i++ ){
                    sum += (parseFloat(this.orders[i].due));
                }
                return sum;
            },
        },
        methods:{
            searchDate(){
                var data = {date: this.date}
                axios.post('/api/search/order',data)
                    .then(({data}) => (this.orders = data))
                    .catch()
            },
            searchMonth(){
                var data = {month: this.month}
                axios.post('/api/search/month',data)
                    .then(({data}) => (this.orders = data))
            }
        }
    }
</script>


<style>
    #add_new{
        float: right;
    }
</style>
