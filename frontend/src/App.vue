<template>
  <div>
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent({
  data() {
    return {
      message: '',
    };
  },
  mounted() {
    this.fetchHello();
  },
  methods: {
    fetchHello() {
      axios.get('http://localhost:3000')
          .then(response => {
            this.message = response.data.message;
          })
          .catch(error => {
            console.error('Error fetching data:', error);
          });
    },
  },
});
</script>
