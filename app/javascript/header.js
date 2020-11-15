window.addEventListener("DOMContentLoaded", () => {
  const headerCategories = document.getElementById('categories');
  const category = document.getElementById('category');
  const headerBrands = document.getElementById('brands');
  const brand = document.getElementById('brand');
  headerCategories.addEventListener('mouseover', function(){
    category.style.display = 'block';
  });
  headerCategories.addEventListener('mouseout', function(){
    category.style.display = 'none';
  });
  headerBrands.addEventListener('mouseover', function(){
    brand.style.display = 'block';
  });
  headerBrands.addEventListener('mouseout', function(){
    brand.style.display = 'none';
  });
});