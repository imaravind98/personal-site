<template>
  <div id="navigation-bar">
      <div class="site-logo">
          <a href="/"><img :src="logo" :alt="logoAlt"></a>
      </div>
      <div class="menus desktop">
          <router-link v-for="(menu, i) in menus" :to="menu.url" :key="i">{{menu.title}}</router-link>
      </div>
      <div class="menus mobile">
          <fa class="menu-icon" :icon="iconChange" @click="showMenu" />
          <div class="menu-links" :class="toggleMenu">
              <router-link v-for="(menu, i) in menus" :to="menu.url" :key="i" @click="showMenu">{{menu.title}}</router-link>
            </div>
      </div>
  </div>
</template>

<script>
export default {
    name: "navigation-bar",
    props:["logo", "logoAlt", "menus"],
    data: function(){
        return {
            toggleMenu: '',
            iconChange: 'bars'
        }
    },
    methods:{
        showMenu: function(){
            this.toggleMenu = this.toggleMenu == 'active' ? '' : 'active';
            this.iconChange = this.toggleMenu == 'active' ? 'times' : 'bars'
        }
    }

}

</script>

<style lang="scss">
#navigation-bar{
    position: relative;
    width: 100%;
    height: 100px;

    .site-logo{
        width: 100px;
        height: 100px;
        position: absolute;
        left: 10px;
        img{
            width: 100%;
        }
    }
    .menus.desktop{
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translate(0%,-50%);
        a{
            padding: 10px;
            text-align: center;
            text-decoration: none;
            color: #000;
        }
        a:hover{
            background-color: #000;
            color: #fff;
        }
        .router-link-active{
            background-color: #000;
            color: #fff;
        }
    }
    .menus.mobile{
        display: none;
    }
}
@media only screen and (max-width:640px){
    #navigation-bar{
        .menus.mobile{
            display: block;
            position: relative;
            right: 10px;
            top: 50%;
            transform: translate(0%,-50%);

            .menu-icon{
                position: absolute;
                font-size: 25px;
                right: 0;
                top: 50%;
                transform: translate(0%,-50%);
                cursor: pointer;
            }

            .menu-links{
                position: absolute;
                top: 45px;
                left: 10px;
                background-color: #fff;
                width: 100%;
                max-height: 0;
                transition: max-height 0.3s ease-out;
                overflow: hidden;
                a{
                    display: block;
                    padding: 10px;
                    text-align: center;
                    text-decoration: none;
                    color: #000;
                }
                .router-link-active{
                    font-weight: 700;
                }
            }

            .menu-links.active{
                max-height: 400px;
                transition: max-height 0.5s ease-in;
            }
        }
        .menus.desktop{
            display: none;
        }
    }
}

</style>