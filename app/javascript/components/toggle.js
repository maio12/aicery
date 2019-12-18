const toggleItem = document.querySelectorAll(".purchase-card")

// document.querySelectorAll(".purchase-card").forEach((el) => {
//   el.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("purchase-card-strike");
// });
// };

toggleItem.forEach((el) => {
  el.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("purchase-card-strike");
  });
});
