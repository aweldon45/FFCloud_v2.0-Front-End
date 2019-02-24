import api from '@/services/api'

export default {
  index () {
    return api().get('allfilms')
  },
  screeningFilm (title) {
    return api().get('film', {
      params: {
        title: encodeURIComponent(title)
      }
    })
  }
}
