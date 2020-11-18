window.addEventListener("DOMContentLoaded", () => {
  const sellHistory = document.getElementById("sell-histories");
  const purchaseHistory = document.getElementById("purchase-histories");

  sellHistory.onclick = function() {
    const showSellItem = document.getElementById("sell-history");
    const html = `<ul class='item-lists'>
                    <li class='list'>
                      <div class='item-img-content'>
                      <img src="${sell_item.images}">
                      </div>
                      <div class='item-info'>
                        <h3 class='item-name'>
                          ${sell_item.name}
                        </h3>
                        <div class='item-price'>
                          <span>${sell_item.price}円<br>(税込み)</span>
                          <div class='star-btn'>
                            <img class="star-icon" src="/assets/star-7f3ed77654d6c9dfc47f9ce980dedbb1b4bb8f858e6c4ee37f69a4844479500b.png" />
                            <span class='star-count'>0</span>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>`;
    showSellItem.insertAdjacentHTML('afterend', html);
    sellHistory.remove();
  };

  purchaseHistory.onclick = function() {
    const showPurchaseItem = document.getElementById("purchase-history");
    const html = `<ul class='item-lists'>
                    <li class='list'>
                      <div class='item-img-content'>
                        <img src="${latest_item.images}">
                      </div>
                      <div class='item-info'>
                        <h3 class='item-name'>
                          ${latest_item.name}
                        </h3>
                        <div class='item-price'>
                          <span>${latest_item.price}円<br>(税込み)</span>
                          <div class='star-btn'>
                            <img class="star-icon" src="/assets/star-7f3ed77654d6c9dfc47f9ce980dedbb1b4bb8f858e6c4ee37f69a4844479500b.png" />
                            <span class='star-count'>0</span>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>`;
    showPurchaseItem.insertAdjacentHTML('beforebegin', html);
    purchaseHistory.remove();
  };
});