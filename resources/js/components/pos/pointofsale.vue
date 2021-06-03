<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Point Of Sale</li>
        </ol>

        <div class="row mb-4">
    <!--------------------------Left_Side_"Expense Insert"------------2nd_task----------->
            <div class="card col-lg-5 border-primary shadow">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Expense Insert</b>
                    <a class="btn btn-sm btn-primary text-white" data-toggle="modal" data-target="#exampleModal" id="add_new"> Add Customer</a>
                </div>

                <div class="card-body">
                    <table class="table table-sm table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Unit</th>
                            <th scope="col">Total</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>                 <!------Expense_Insert_Table(Top_Left)--------->
                        <tr v-for="card in cards" :key="card.id">       <!-------pos_table---------3----->
                            <th>{{ card.pro_name }}</th>
                            <td><input type="text" readonly="" style="width: 20px;" :value="card.pro_quantity">

                                <button @click.prevent="increment(card.id)" class="btn btn-sm btn-success">+</button>

                                <button @click.prevent="decrement(card.id)" class="btn btn-sm btn-danger" v-if="card.pro_quantity >= 2">-</button>      <!----------------->
                                <button class="btn btn-sm btn-danger" v-else="" disabled="">-</button>  <!-------------->

                            </td>
                            <td>{{ card.product_price }}</td>
                            <td>{{ card.sub_total }}</td>
                            <td><a @click="removeItem(card.id)" class="btn btn-sm btn-danger text-white">x</a></td>
                        </tr>

                        </tbody>
                    </table>
                    <hr>
                </div>
                <div class="card-footer">       <!-----Expense_Insert_Table(Middle_Left)------->
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Quantity:
                            <strong>{{ qty }}</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Sub Total:
                            <strong>{{ subtotal }} Tk</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Vat:
                            <strong> {{ vats.vat }} % </strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total:
                            <strong> {{ subtotal*vats.vat /100 +subtotal }} Tk</strong>
                        </li>
                    </ul>
                    <br>                   <!-----Expense_Insert_Table(Bottom_Left)------>
                    <form @submit.prevent="orderdone">          <!--------------2----------------->
                        <label>Customer Name</label>
                        <select class="form-control" v-model="customer_id">
                            <option :value="customer.id" v-for="customer in customers">{{ customer.name }}</option>
                        </select>

                        <label>Pay</label>
                        <input type="text" class="form-control" required v-model="pay">

                        <label>Due</label>                              <!---------"due" dynamic kora hoyeche------------>
                        <!-- <input type="text" class="form-control" required v-model="due"> -->
                        <input type="text" class="form-control" required :value="((subtotal*vats.vat /100 +subtotal) - pay).toFixed(2)">

                        <label>Pay By</label>
                        <select class="form-control" v-model="payby">
                            <option value="HandCash">Hand Cash</option>
                            <option value="Cheaque">Cheaque</option>
                            <option value="GiftCard">Gift Card</option>
                        </select>

                        <br>
                        <button type="submit" class="btn btn-success mb-4">Submit</button>
                    </form>
                </div>
            </div>

    <!------------------customer add modal------------------2-------->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Customer</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeModal">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form @submit.prevent="customerInsert" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-label-group">
                                                <input type="text" v-model="form.name" class="form-control" required>
                                                <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                                                <label for="firstName">Full Name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-label-group">
                                                <input type="email" v-model="form.email" class="form-control" >
                                                <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                                                <label for="lastName">Email Address</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-label-group">
                                                <input type="text" v-model="form.address" class="form-control" required>
                                                <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
                                                <label for="firstName">Address</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-label-group">
                                                <input type="text" v-model="form.phone" class="form-control" required>
                                                <label for="lastName">Phone</label>
                                                <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-label-group">
                                                <input type="file" class="btn" @change="onFileselected">
                                                <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <img :src="form.photo" style="height:40px; width: 40px;">
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-success">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    <!------------end customer modal------------------------->






<!--------------Right_Side_"Product"----------1st_task----------1----->
            <div class="card col-lg-7 border-primary">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Products</b>
                </div>

                <div class="card-body">
                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">All Product</a>
                        </li>

                        <li class="nav-item" v-for="category in categories" :key="category.id">
                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" @click="subproduct(category.id)">{{ category.category_name }}</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <!-----Search----->
                            <input type="text" v-model="searchTerm" class="form-control" placeholder="Search here..."><br>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="product in filtersearch" :key="product.id">
                                    <button v-if="product.product_quantity >= 1" class="btn btn-sm" @click.prevent="AddToCart(product.id)">  <!--------3------->
                                        <div class="card" style="width: 9rem; height: 180px;">
                                            <img :src="product.image" class="card-img-top" style="height: 100px; width: 100px;">
                                            <div class="card-body">
                                                <small class="card-title">{{ product.product_name }}</small><br>
                                                <span class="badge badge-success" v-if="product.product_quantity >= 1"> Availble ({{ product.product_quantity }}) </span>
                                                <span class="badge badge-danger" v-else>Stock Out</span>
                                                <span class="text-primary d-block m-0 p-0 small"> BDT: {{product.selling_price}}</span>
                                            </div>
                                        </div>
                                    </button>
                                    <button v-else disabled class="btn btn-sm" @click.prevent="AddToCart(product.id)">  <!--------3------->
                                        <div class="card" style="width: 9rem; height: 180px;">
                                            <img :src="product.image" class="card-img-top" style="height: 100px; width: 100px;">
                                            <div class="card-body">
                                                <small class="card-title">{{ product.product_name }}</small><br>
                                                <span class="badge badge-success" v-if="product.product_quantity >= 1"> Availble ({{ product.product_quantity }}) </span>
                                                <span class="badge badge-danger" v-else>Stock Out</span>
                                                <span class="text-primary d-block m-0 p-0 small"> BDT: {{product.selling_price}}</span>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <input type="text" v-model="getsearchTerm" class="form-control" placeholder="Search here..."><br>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="getproduct in getfiltersearch" :key="getproduct.id">
                                    <button v-if="getproduct.product_quantity >= 1" class="btn btn-sm" @click.prevent="AddToCart(getproduct.id)">
                                        <div class="card" style="width: 9rem; height: 180px;">
                                            <img :src="getproduct.image" class="card-img-top" style="height: 100px; width: 100px;">
                                            <div class="card-body">
                                                <small class="card-title">{{ getproduct.product_name }}</small> <br>
                                                <span class="badge badge-success" v-if="getproduct.product_quantity >= 1"> Availble ({{ getproduct.product_quantity }}) </span>
                                                <span class="badge badge-danger" v-else>Stock Out</span>
                                                <span class="text-primary d-block m-0 p-0 small"> BDT: {{getproduct.selling_price}}</span>
                                            </div>
                                        </div>
                                    </button>
                                    <button v-else disabled class="btn btn-sm" @click.prevent="AddToCart(getproduct.id)">
                                        <div class="card" style="width: 9rem; height: 180px;">
                                            <img :src="getproduct.image" class="card-img-top" style="height: 100px; width: 100px;">
                                            <div class="card-body">
                                                <small class="card-title">{{ getproduct.product_name }}</small> <br>
                                                <span class="badge badge-success" v-if="getproduct.product_quantity >= 1"> Availble ({{ getproduct.product_quantity }}) </span>
                                                <span class="badge badge-danger" v-else>Stock Out</span>
                                                <span class="text-primary d-block m-0 p-0 small"> BDT: {{getproduct.selling_price}}</span>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Icon Cards-->
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
            this.allProduct();    //---------1--
            this.allCategory();   //---------1--
            this.allCustomer();     //--------2---
            this.cartProduct();        //--------3--
            this.vat();
            Reload.$on('AfterAdd', ()=>{    //--------3--
                this.cartProduct();
            });
            Reload.$on('customerReload',()=>{   //--added by me
                this.allCustomer();
            })
        },
        data(){
            return{
                form:{                   //------2---
                    // details :'',
                    // amount:'',
                    name :'',
                    email :'',
                    address:'',
                    photo :'',
                    phone:'',
                },
                customer_id:'',     //--customer_form-
                pay:'',
                due:'',
                payby:'',
                products:[],       //---------1---
                categories:'',     //---------1---
                getproducts:[],    //---------1---
                searchTerm:'',     //---------1---
                getsearchTerm:'',  //---------1---
                customers:'',           //-------2---
                errors:'',         //---------1---
                cards:[],                   //--------3--//Controller থেকে ডাটা তুলে এনে এই cards Array মধ্যে রাখবে।
                vats:''
            }
        },
        computed:{
            filtersearch(){                          //----------------1-------
                return this.products.filter(product => {
                    //return product.product_name.match(this.searchTerm)
                    return product.product_name.toLowerCase().match(this.searchTerm.toLowerCase())
                })
            },
            getfiltersearch(){                       //-----------------1-------
                return this.getproducts.filter(getproduct => {
                    //return getproduct.product_name.match(this.getsearchTerm)
                    return getproduct.product_name.toLowerCase().match(this.getsearchTerm.toLowerCase())
                })
            },
            qty(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++ ){
                    sum += (parseFloat(this.cards[i].pro_quantity));    //The parseFloat() function parses a string and returns a floating point number. That means a number of string convert into floating number.
                }
                return sum;
            },
            subtotal(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++){
                    sum += (parseFloat(this.cards[i].pro_quantity) * parseFloat(this.cards[i].product_price));
                }
                return sum;
            },
        },
        methods:{
            //--start cart methods--                //------------------3----
            AddToCart(id){
                axios.get('/api/addTocart/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                        Notification.cart_success()
                    })
            },
            cartProduct(){                          //selected product show in card
                axios.get('/api/cart/product')
                    .then(({data}) => (this.cards = data))
                    .catch()
            },
            removeItem(id){                         //id = Pos's id
                axios.get('/api/remove/cart/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                        Notification.success()
                    })
            },
            increment(id){      //id = Pos's id        //------------------4----
                axios.get('/api/increment/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                        Notification.success()
                    })
            },
            decrement(id){      //id = Pos's id
                axios.get('/api/decrement/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                        Notification.success()
                    })
            },
            vat(){
                axios.get('/api/vats')
                    .then(({data}) => (this.vats = data))
                    .catch()
            },
            orderdone(){
                let total = this.subtotal * this.vats.vat /100 + this.subtotal;
                let due = (total - this.pay).toFixed(2)         //variable.toFixed(2)=take 2 specified decimal number
                var data = {qty:this.qty, subtotal:this.subtotal, customer_id:this.customer_id, payby:this.payby, pay:this.pay, due:due, vat:this.vats.vat, total:total}       //due:this.due //due_dynamic

                axios.post('/api/orderdone/',data)
                .then(()=>{
                    Notification.success()
                    this.$router.push({ name: 'home'})
                })
            },
            //---End_cart_methods----

            allProduct(){                                         //------------1---
                axios.get('/api/product')
                    .then(({data}) => (this.products = data))
                    .catch()
            },
            allCategory(){                                       //-------------1---
                axios.get('/api/category/')
                    .then(({data}) => (this.categories = data))
                    .catch()
            },
            allCustomer(){                              //------2----
                axios.get('/api/Customer/')
                    .then(({data}) => (this.customers = data))
                    .catch()
            },
            subproduct(id){                                      //-------------1---
                axios.get('/api/getting/product/'+id)
                    .then(({data}) => (this.getproducts = data))
                    .catch(error => this.errors = error.response.data.errors)
            },
            //---image validationmethod---
            onFileselected(event){                  //------------2----
                let file=event.target.files[0];
                if (file.size > 1048770) {
                    Notification.image_validation()
                }else{
                    let reader = new FileReader();
                    reader.onload = event => {
                        this.form.photo = event.target.result

                        console.log(event.target.result);
                    };
                    reader.readAsDataURL(file);
                }
            },
            customerInsert(){                   //-------------2---
                axios.post('/api/Customer/',this.form)
                    .then(() => {
                        $('#closeModal').click();
                        Reload.$emit('customerReload'); //first global declar in app.js, then goto created() on above
                        Notification.success()
                        // this.customers = this.customers.filter(customer =>{   //--Or-/use Reload--
                        //     return customer.id !=id
                        // })
                    })
            }
        }
    }
</script>


<style scoped>
    #add_new{
        float: right;
    }
    #em_photo{
        height: 100px;
        width: 90px;
    }
</style>
