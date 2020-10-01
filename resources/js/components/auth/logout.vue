<template>

</template>


<script>
    export default {
        created(){
            localStorage.removeItem('token')
            localStorage.removeItem('user')
            Toast.fire({
                type: 'success',
                icon: 'success',
                title: 'Logout Successfully'
            })
            this.$router.push('/')
        }
    }
</script>


<style>

</style>
