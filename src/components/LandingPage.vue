<template>
  <div class='background'>
    <img src='../assets/FFCLogo.png' class='logo'>
    <h1 id='herotxt'>Film Festival Circle</h1>
    <h2 id='logline'>A platform focused on creating a global community for all lovers of film festivals and independent film.</h2>
    <h2 id='logline'>Click below to stay updated on our upcoming launch!</h2>
    <button v-on:click="signup" class='button'>Keep me updated!</button>
    <form class='modal'>Modal check
      <label>Email:</label>
      <input/>
    </form>
  </div>
</template>

<script>
export default {
  methods: {
    signup: function (msg) {
      alert('test signup message')
    }
  }
}
</script>

<style scoped>
.background {
  background-color: #E8DAEF;
  position: absolute;
  vertical-align: middle;
  width: 100%;
  left: 0;
  top: 0;
  min-height: 100vh;
}
.class {
  margin-top: 0%;
}
@media screen and (min-width: 601px) {
#herotxt {
  color: #5B2C6F;
  font-size: 75px;
}
#logline {
  color: #5B2C6F;
  font-size: 25px;
}
.button {
  background-color: #E8DAEF;
  border: 4px solid #5B2C6F;
  color: #5B2C6F;
  font-weight: bold;
  font-size: 25px;
  border-radius: 8px;
  padding: 16px 40px;
}
.button:hover {
  background-color: #5B2C6F;
  color: white;
}
.modal {
  display:none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
}
}

@media screen and (max-width: 600px) {
#herotxt {
  color: #5B2C6F;
  font-size: 40px;
}
#logline {
  color: #5B2C6F;
  font-size: 15px;
}
.button {
  background-color: #E8DAEF;
  border: 4px solid #5B2C6F;
  color: #5B2C6F;
  font-weight: bold;
  font-size: 15px;
  border-radius: 8px;
  padding: 16px 40px;
}
.button:hover {
  background-color: #5B2C6F;
  color: white;
}}
</style>
