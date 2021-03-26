
<template>
    <div>   <!-----total_<div>----->
<!--------------------Dashboard------------------------>
<h1 class="mt-4">Dashboard</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Dashboard - Inventory - Laravel - Vue</li>
</ol>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body">{{ todaysell }} Taka</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="text-white stretched-link" href="#">Today Sell</a>
                <div class="text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success text-white mb-4">
            <div class="card-body">{{ income }} Taka</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class=" text-white stretched-link" href="#">Today Income</a>
                <div class=" text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-info text-white mb-4">
            <div class="card-body">{{ due }} Taka</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class=" text-white stretched-link" href="#">Today Due</a>
                <div class=" text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger text-white mb-4">
            <div class="card-body">{{ expense }} Taka</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class=" text-white stretched-link" href="#">Today Expense</a>
                <div class=" text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>      <!------End_Dashboard------>

<!------Stock_Out_Products------>
<div class="row my-3">
    <div class="col-xl-12">
        <div class="card border-primary">
            <div class="card-header text-primary font-weight-bold">
                <i class="fas fa-chart-area mr-1"></i>
                Stock Out Products
            </div>
            <div class="card-body">
                <div class="card-body pt-0">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover table-warning" id="" width="100%" cellspacing="0">
                            <thead>
                                <tr class="bg-info text-white">
                                    <th>Name</th>
                                    <th>Code</th>
                                    <th>Photo</th>
                                    <th>Status</th>
                                    <th>Available Product</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr v-for="product in products" :key="product.id">
                                    <td>{{ product.product_name}}</td>
                                    <td>{{ product.product_code}}</td>
                                    <td><img :src="product.image" id="em_photo"></td>
                                    <td v-if="product.product_quantity >= 1"><span class="badge badge-success">Availble</span></td>
                                    <td v-else=""><span class="badge badge-danger">Stock Out</span></td>
                                    <td>{{ product.product_quantity }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  <!------End_Stock_ Out_Products------>


    </div>  <!------End_total_<div>------>
</template>


<script>
    export default {
        created(){
            if (!User.loggedIn()) {
                this.$router.push({name : '/'})
            }
        },
        mounted(){
            this.TodaySell();
            this.TodayIncome();
            this.TodayDue();
            this.TodayExpense();
            this.Stockout();
        },
        data(){
            return{
                todaysell:'',
                income:'',
                expense:'',
                due:'',
                products:'',
            }
        },
        methods:{
            TodaySell(){
                axios.get('/api/today/sell')
                    .then(({data}) => (this.todaysell = data))
                    .catch()
            },
            TodayIncome(){
                axios.get('/api/today/income')
                    .then(({data}) => (this.income = data))
                    .catch()
            },
            TodayDue(){
                axios.get('/api/today/due')
                    .then(({data}) => (this.due = data))
            },
            TodayExpense(){
                axios.get('/api/today/expense')
                    .then(({data}) => (this.expense = data))
            },
            Stockout(){
                axios.get('/api/stockout')
                    .then(({data}) => (this.products = data))
            },
        }
    }
</script>


<style scoped>
    #em_photo{
        height: 40px;
        width: 40px;
    }
</style>
