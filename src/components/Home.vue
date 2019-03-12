<template>
  <div>
    <div id='banner'>
      <h2>{{message}}</h2>
      <div id='bannerimage'>
    </div>
  </div>
  <br>
  <div id='festivalheaders' v-for="festivals in festivalCount" :key="festivals">
    <h2>{{festivals}}</h2>
  <ul id='scrollingwrapper'>
   <li :style='cardStyling' v-if="films.festival === festivals" v-for="films in filmList.Items" :key="films.title">
     <div :style='cardImgStyling'>
       <router-link :to="{name: 'screeningroom', params: {title: films.title} }">
       <img :src="films.info.posterUrl" :style='Imgstyling'>
     </router-link>
     </div>
    <div :style='cardTxtStyling'>
      <p id='filmtitle'>{{films.title}}</p>
      <p id='filmscreen'>{{films.info.screeningDate}} | {{films.info.screeningTime}}</p>
      <p>Director: {{films.info.directors[0]}}</p>
      <!--<p id='filmlogline'>{{films.info.logline}}</p>-->
    </div>
  </li>
</ul>
</div>
</div>
</template>

<script>
import FilmService from '@/services/FilmService'
export default {
  data () {
    return {
      message: 'Discover new filmmakers without barriers.',
      message2: 'Simultaneous broadcast with live screenings',
      filmList: {},
      festivalCount: null
    }
  },
  async mounted () {
    // request films from backend
    this.filmList = (await FilmService.index()).data
    console.log('filmList', this.filmList)
    // create festival headers
    let i = 0
    let festCheck = []
    for (i = 0; i < await this.filmList.Items.length; i++) {
      festCheck.push(this.filmList.Items[i].festival)
    }
    let festCheckResponse = festCheck.filter(function (item, pos) {
      return festCheck.indexOf(item) === pos
    })
    this.festivalCount = festCheckResponse
  },
  computed: {
    cardStyling: function () {
      return {
        position: 'relative',
        boxSizing: 'border-box',
        margin: '20px 20px',
        width: '325px',
        height: '450px',
        borderRadius: '5px',
        display: 'inline-block'
      }
    },
    cardImgStyling: function () {
      return {
        position: 'absolute',
        boxSizing: 'border-box',
        width: '100%',
        height: '350px',
        top: '0px',
        border: '1px solid #D5DBDB',
        borderRadius: '5%',
        boxShadow: '8px 0 8px 0 #D5DBDB'
      }
    },
    cardTxtStyling: function () {
      return {
        position: 'absolute',
        boxSizing: 'border-box',
        textAlign: 'center',
        lineHeight: '50%',
        width: '100%',
        height: '100px',
        bottom: '0',
        backgroundColor: 'white',
        borderRadius: '10%'
      }
    },
    Imgstyling: function () {
      return {
        width: '100%',
        height: '100%',
        borderRadius: '5%'
      }
    }
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Oswald');
#banner {
  display: block;
  height: 650px;
  font-family: 'Oswald', sans-serif;
  font-weight: bold;
  font-size: 40px;
  color: white;
  text-align: center;
  text-shadow: 0 0 10px #2C3E50;
  border-bottom: 1px solid #5D6D7E;
  background-image: url("../assets/CroniesImg.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
#festivalheaders {
  display: inline;
  font-family: 'Oswald', sans-serif;
  font-weight: bold;
  font-size: 30px;
  width: 100%;
  color: #263238;
  text-align: left;
}
#filmtitle {
  font-weight: bold;
  font-size: 20px;
  color: #7E5109;
  text-transform: uppercase;
}
#filmscreen {
  font-weight: bold;
  font-size: 18px;
  text-transform: uppercase;
}
#filmlogline {
  overflow-wrap: break-word;
  white-space: normal;
}
#scrollingwrapper {
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
}
::-webkit-scrollbar {
   display: none;
}
</style>
