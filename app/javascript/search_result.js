window.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById('search-form');
  searchInput.addEventListener("submit", (e) => {
    const input = document.getElementById('q_name_eq').value;
    console.log(input)
    if (input === '') {
      alert('商品を検索してください');
      e.preventDefault();
    }
  });
});