document.addEventListener('DOMContentLoaded', () => {
  fetch("http://localhost:3000/api/v1/locations").then(res => res.json()).then(console.log)
})
