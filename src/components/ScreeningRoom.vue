<template>
  <div>
  <div :style='screenBackground'>
    <br>
    <div data-vjs-player>
      <video id="vidPlayer" class="video-js" controls preload="auto" height="575px" data-setup='{}'>
      <source :src="this.reqFilm.Items[0].info.screeningUrl" type="application/x-mpegURL">
    </video>
  </div>
  </div>
  </div>
</template>

<script>
// eslint-disable-next-line
import videojs from 'video.js'
import FilmService from '@/services/FilmService'

export default {
  data () {
    return {
      vidPlayer: null,
      reqFilm: {},
      title1: null
    }
  },
  created () {
    this.title1 = this.$route.params.title
  },
  async mounted () {
    this.reqFilm = (await FilmService.screeningFilm(this.title1)).data
    console.log('reqFilm', this.reqFilm)
    // mount player on next tick to prevent hard refresh FU
    this.$nextTick(function () {
      this.vidPlayer = videojs('vidPlayer')
    })
  },
  updated () {
    console.log('player created', this)
  },
  computed: {
    screenBackground: function () {
      return {
        position: 'fixed',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'black',
        width: '100%',
        height: '100%'
      }
    },
    inputStyling: function () {
      return {
        display: 'block',
        width: '400px',
        padding: '12px 20px',
        fontSize: '16px',
        margin: '0 auto'
      }
    }
  }
}
</script>

<style scoped>
</style>
