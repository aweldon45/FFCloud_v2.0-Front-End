<template>
  <nav>
    <ul>
      <li>
        <a href="/">FilmFestivalCircle Beta</a>
      </li>
      <li style="float: right">
        <a href="#">Connect with us</a>
      </li>
      <li style="float: right">
        <a href="/About">How it works</a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  computed: {
    listStyling: function () {
      return {
        backgroundColor: '#333',
        position: 'fixed',
        top: '0',
        width: '100%'
      }
    }
  }
}
</script>

<style scoped>
ul {
    margin: 0;
    padding: 0;
    overflow: hidden;
    position: fixed;
    top: 0;
    width: 100%;
    height: 60px;
    z-index: 1;
}
li {
    float: left;
    list-style-type: none;
}
li a {
    display: block;
    font-weight: 600;
    color:#263238;
    font-size: 20px;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}
</style>
