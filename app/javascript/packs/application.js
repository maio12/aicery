import "bootstrap";
import { autocompleteSearch } from '../components/autocomplete.js'
const searchData = document.getElementById('search-data')






document.addEventListener('DOMContentLoaded', (event) => {
  if (searchData) {

autocompleteSearch();
}

});

