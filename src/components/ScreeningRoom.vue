<template>
  <div>
  <div :style='screenBackground'>
    <br>
    <div data-vjs-player v-if="Items.length">
      <video id="vidPlayer" class="video-js" controls preload="none" height="575px" data-setup='{}'>
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
      title1: null,
      Items: []
    }
  },
  created () {
    this.title1 = this.$route.params.title
    /* this.reqFilm = (await FilmService.screeningFilm(this.title1)).data
    this.$nextTick(function () {
      this.vidPlayer = videojs('vidPlayer')
      console.log('player ready')
    console.log('reqFilm', this.reqFilm)
    this.Items = this.reqFilm.Items
    console.log('item length', this.Items.length)
  }) */
  },
  async mounted () {
    this.reqFilm = (await FilmService.screeningFilm(this.title1)).data
    console.log('reqFilm', this.reqFilm)
    this.Items = this.reqFilm.Items
    console.log('item length', this.Items.length)
    // mount player on next tick to prevent hard refresh FU
    this.$nextTick(function () {
      this.vidPlayer = videojs('vidPlayer')
      console.log('player ready')
    })
  },
  destroyed () {
    this.vidPlayer.dispose()
    console.log('player disposed')
  },
  methods: {

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
