<template>
  <div id="container">
    <navigation :logo="logo" :logoAlt="logoAlt" :menus="menus" />
    <div class="page-main">
        <router-view/>
    </div>
    <Footer />
  </div>
</template>


<script>
import Navigation from './components/Navigation.vue'
import Footer from './components/Footer.vue'
export default {
    name: 'container',
    data: function(){
        return {
            logo: 'https://i.pinimg.com/736x/de/a0/f3/dea0f3b7f480b1151c08db4a402a43b9.jpg',
            logoAlt: 'Blog tech site logo',
            menus: [
                {
                    title: 'Home',
                    url: '/',
                },
                {
                    title: 'Skills',
                    url: '/skills',
                },
                {
                    title: 'About',
                    url: '/about',
                },
                {
                    title: 'Contact',
                    url: '/contact',
                }
            ]
        }        
    },
    components:{Navigation, Footer}
}
</script>


<style lang="scss">
    .page-main{
        padding: 10px;
    }
</style>
