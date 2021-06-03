<template>
	<div>
		<!-- Breadcrumbs-->
		<ol class="breadcrumb mt-3">		<!--------f-------->
			<li class="breadcrumb-item">
				<a href="#">Dashboard</a>
			</li>
			<li class="breadcrumb-item active">Employee / Add</li>
		</ol>

		<!-- Icon Cards-->
		<div class="row container">
			<div class="card col-lg-12 border-primary shadow">	    <!--------f------->
				<div class="card-header text-primary" style="font-size: 20px; font-weight: 700;">  <!------f----->
					<i class="fas fa-chart-area"></i>
					Employee Insert
					<router-link to="/employee" class="btn btn-primary" id="add_new"> All Employee</router-link>  <!----------->
				</div>

				<div class="card-body">
					<form @submit.prevent="employeeInsert" enctype="multipart/form-data">	<!------------------------>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<div class="form-label-group">
										<label for="firstName">Full Name</label>
										<input type="text" id="firstName" v-model="form.name" class="form-control" required placeholder="Enter Name">
										<small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-label-group">
										<label for="email">Email Address</label>
										<input type="email" id="email" v-model="form.email" class="form-control" placeholder="Enter Email" required>
										<small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<div class="form-label-group">
										<label for="firstName">Address</label>
										<input type="text" v-model="form.address" class="form-control" required placeholder="Enter Address">
										<small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-label-group">
										<label for="sallery">Salary</label>
										<input type="text" id="sallery" v-model="form.salary" class="form-control" required placeholder="Enter Salary">
										<small class="text-danger" v-if="errors.salary">{{ errors.salary[0] }}</small>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-4">
									<div class="form-label-group">
										<label for="firstName">Joining Date</label>
										<input type="date" v-model="form.joining_date" class="form-control" autofocus="autofocus" required>
										<small class="text-danger" v-if="errors.joining_date">{{ errors.joining_date[0] }}</small>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-label-group">
										<label for="nid">NID Number</label>
										<input type="text" id="nid" v-model="form.nid" class="form-control" required placeholder="Enter NID">
										<small class="text-danger" v-if="errors.nid">{{ errors.nid[0] }}</small>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-label-group">
										<label for="phone">Phone Number</label>
										<input type="text" id="phone" v-model="form.phone" class="form-control" required placeholder="Enter Phone Number">
										<small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
									</div>
								</div>
							</div>
						</div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="file" class="btn btn-info" @change="onFileselected">   <!----------------->
                                        <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <img :src="form.photo" style="height:40px; width: 40px;">	<!------------------>
                                </div>
                            </div>
                        </div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
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
		data(){
			return{
				form:{
					name :'',
					email :'',
					salary:'',
					address:'',
					photo :'',
					phone:'',
					nid : '',
					joining_date:''
				},
				errors:{}
			}
		},

		methods:{
			onFileselected(event){        //click korlei ai 'event' er vitor pic er sob details chole asbe
				//console.log(event)
				let file=event.target.files[0];      //now,File's(name,size,type) available in variable 'file'
				if (file.size > 1048770) {           //made condition: file will less than 1MB
				    Notification.image_validation()     //used 'Noti'
				}else{
                    let reader = new FileReader();     //created new instance
                    reader.onload = event => {
                        this.form.photo = event.target.result   //storing/taking pic's extention in 'photo'
                        console.log(event.target.result);
                    };
                    reader.readAsDataURL(file);
				}
			},
			employeeInsert(){
				axios.post('/api/employee/',this.form)  //resource_route|api.php|post_method+route= go>Controller>Store()
				.then(() => {
					this.$router.push({ name: 'employee' })   //(index.vue)all-employee vue page e jabe
					Notification.success()
				})
				.catch(error => this.errors = error.response.data.errors)
			},
		}
	}
</script>


<style>
	#add_new {
		float: right;
	}
</style>
