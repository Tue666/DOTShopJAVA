// Promise call XMLHttpRequest
const serialize = (obj) => {
	return Object.keys(obj).map(key => {
		return encodeURIComponent(key) + '=' + encodeURIComponent(obj[key]);
	}).join('&');
}
const xhrCall = (method, data = null) => {
	return new Promise((resolve, reject) => {
		const xhr = new XMLHttpRequest();
		xhr.open(method, xhrURL);
		xhr.onload = () => resolve(xhr.response);
		xhr.onerror = () => reject({
			status: this.status,
			statusText: xhr.statusText
		});
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send(serialize(data));
	});
};

// Load product list
const listProductWrapper = document.querySelector('.product-list-wrapper');
const loadMoreBtn = document.getElementById('load-more-btn');
var page = 1;
const loadProductList = () => {
	listProductWrapper && xhrCall('POST', {
		action: 'LOAD_LIST_PRODUCT',
		page: page
	})
		.then(res => JSON.parse(res))
		.then(json => {
			const products = json.products.map(product => {
				return `
						<a href="${appName}/product/${product.Slug}/pid-${product.ID}">
							<div class="product-card">
								<div class="image-wrapper">
									<img class="image card-image" src="${product.Image}"
										alt="${product.Name}" />
								</div>
								<div class="card-content">
									<div class="product-name">
										<span>${product.Name}</span>
									</div>
									<div class="product-rating">
										<div class="in-row">
											<i class="bi bi-star-fill" style="font-size: 11px; color: rgb(253, 216, 54); margin: 0 1px;"></i>
											<i class="bi bi-star-fill" style="font-size: 11px; color: rgb(253, 216, 54); margin: 0 1px;"></i>
											<i class="bi bi-star-fill" style="font-size: 11px; color: rgb(253, 216, 54); margin: 0 1px;"></i>
											<i class="bi bi-star-fill" style="font-size: 11px; color: rgb(253, 216, 54); margin: 0 1px;"></i>
											<i class="bi bi-star-fill" style="font-size: 11px; color: rgb(199, 199, 199); margin: 0 1px;"></i>
											${product.Sold > 0 && `<span class="sold">${product.Sold} Sold</span>`}
										</div>
									</div>
									<div class="product-price">
										<div class="in-row">
											${product.Discount > 0 ? `
												<span class="price sale">${currencyVN(product.Price - product.Price * product.Discount / 100)}</span>
												<div class="sale-tag">-${product.Discount}%</div>
											`: `
												<span class="price">${currencyVN(product.Price)}</span>					
											`}
										</div>
									</div>
								</div>
							</div>
						</a>
					`;
			});
			listProductWrapper.insertAdjacentHTML('beforeend', products);
			if (!json.hasMore) {
				loadMoreBtn.innerHTML = '';
			} else {
				loadMoreBtn.innerHTML = '<div class="load-more-btn">Load more</div>';
			}
		})
		.catch(error => console.log('Error: ', error));
};
loadProductList(page);
loadMoreBtn && loadMoreBtn.addEventListener('click', () => {
	page = page + 1;
	loadMoreBtn.innerHTML = '<div class="loading"></div>';
	setTimeout(() => {
		loadProductList(page);
	}, 500);
});

// Load cart badge
const cartBadge = document.querySelector('.cart-badge');
const toggleBadge = (records) => {
	if (cartBadge) {
		if (records === 0) {
			cartBadge.classList.remove('badge');
			cartBadge.innerHTML = '';
		} else {
			cartBadge.classList.add('badge');
			cartBadge.innerHTML = records;
		}
	}
}
const loadCartBadge = () => {
	xhrCall('POST', {
		action: 'LOAD_CART_BADGE'
	})
		.then(res => toggleBadge(parseInt(res)))
};
loadCartBadge();

// Cart checkboxes change
const cartCheckboxAll = document.getElementById('cart-checkbox-all');
const cartCheckboxItems = document.querySelectorAll('.cart-checkbox-item');
const loadCart = () => {
	const cart = document.querySelector('.cart');
	const cartContent = document.querySelector('.cart-content');
	const records = cartContent.children.length;
	toggleBadge(records);
	if (cartContent.children.length < 1) {
		cart.innerHTML = `
			<div class="in-column w-100">
				<img src="https://salt.tikicdn.com/desktop/img/mascot@2x.png" alt="" />
				<span class="title my-3">There are no products in your cart.</span>
				<a href="${appName}/landing" class="btn btn-success">BUY NOW</a>
			</div>
		`;
	}
}
const loadTotalPrice = () => {
	const cartItems = document.querySelectorAll('.cart-child');
	if (cartItems) {
		var guess = 0;
		var coupon = 0;
		var shipFee = 0;
		var freeShip = 0;
		cartItems.forEach(item => {
			const isChecked = item.querySelector('.cart-checkbox-item').checked;
			const price = currencyToNumber(item.querySelector('.total-single-price').innerHTML);
			const VAT = parseInt(item.querySelector('.cart-checkbox-item').getAttribute('data-vat'));
			if (isChecked) {
				guess = guess + price;
				shipFee = shipFee + VAT;
			}
		});
		const total = guess - coupon + (shipFee - freeShip > 0 ? shipFee - freeShip : 0);
		const guessInner = document.querySelector('.guess');
		const couponInner = document.querySelector('.coupon');
		const shipFeeInner = document.querySelector('.ship-fee');
		const freeShipInner = document.querySelector('.free-ship');
		const totalInner = document.querySelector('.total');
		if (guessInner && couponInner && shipFeeInner && freeShipInner && totalInner) {
			guessInner.innerHTML = currencyVN(guess);
			couponInner.innerHTML = currencyVN(coupon);
			shipFeeInner.innerHTML = currencyVN(shipFee);
			freeShipInner.innerHTML = currencyVN(freeShip);
			totalInner.innerHTML = guess !== 0 ? currencyVN(total) : 'Please choose a product';
		}
	}
};
const toggleChecked = (productID, checked) => {
	return xhrCall('POST', {
		action: 'TOGGLE_CHECKED',
		productID: productID,
		checked: checked
	});
};
cartCheckboxAll && cartCheckboxAll.addEventListener('change', e => {
	const isCheckedAll = e.target.checked;
	toggleChecked(0, isCheckedAll)
		.then(res => {
			if (res === 'SUCCESS' && cartCheckboxItems) {
				cartCheckboxItems.forEach(item => {
					item.checked = isCheckedAll;
				});
				loadTotalPrice();
			}
		})
});
cartCheckboxItems && cartCheckboxItems.forEach(item => {
	item.addEventListener('change', () => {
		const productID = item.closest('div[data-item]').getAttribute('data-item');
		toggleChecked(productID, item.checked)
			.then(res => {
				if (res === 'SUCCESS') {
					cartCheckboxAll.checked = cartCheckboxItems.length === document.querySelectorAll('input.cart-checkbox-item:checked').length;
					loadTotalPrice();
				}
			})
	});
});

// Update quantity product in cart
const decreaseBtns = document.querySelectorAll('.cart-qty-dec');
const increaseBtns = document.querySelectorAll('.cart-qty-inc');
const quantityInputs = document.querySelectorAll('.cart-qty-input');
const updateQuantityCart = (productID, newQuantity, item) => {
	xhrCall('POST', {
		action: 'UPDATE_QUANTITY_CART',
		productID: productID,
		newQuantity: newQuantity
	})
		.then(res => JSON.parse(res))
		.then(res => {
			const quantity = item.querySelector('.cart-qty-input');
			const singlePrice = item.querySelector('.single-price');
			const totalSinglePrice = item.querySelector('.total-single-price');
			if (res.status === 'SUCCESS') {
				const cartItem = JSON.parse(res.item);
				quantity.value = cartItem.Quantity;
				totalSinglePrice.innerHTML = currencyVN(currencyToNumber(singlePrice.innerHTML) * cartItem.Quantity);
				loadTotalPrice();
			}
			else {
				quantity.value = res.prevent;
				showToast('Failure!', res.message, res.status, 'bottom-center');
			}
		})
}
quantityInputs && quantityInputs.forEach(input => {
	input.addEventListener('input', e => {
		var value = e.target.value;
		const regex = /^[1-9][0-9]*$/;
		if (!regex.test(value)) {
			value = value.slice(0, -1);
			if (value === '') {
				value = 1;
			}
		}
		const cartChild = input.closest('div[data-item]');
		updateQuantityCart(cartChild.getAttribute('data-item'), value, cartChild);
	});
})
decreaseBtns && decreaseBtns.forEach(button => {
	button.addEventListener('click', () => {
		const cartChild = button.closest('div[data-item]');
		const productID = cartChild.getAttribute('data-item');
		const quantity = parseInt(cartChild.querySelector('.cart-qty-input').value);
		if (quantity === 1) {
			removeCart(productID);
			return;
		}
		updateQuantityCart(productID, quantity - 1, cartChild);
	})
});
increaseBtns && increaseBtns.forEach(button => {
	button.addEventListener('click', () => {
		const cartChild = button.closest('div[data-item]');
		const productID = cartChild.getAttribute('data-item');
		const quantity = parseInt(cartChild.querySelector('.cart-qty-input').value);
		updateQuantityCart(productID, quantity + 1, cartChild);
	})
});

// Add product to cart
const addCartBtn = document.getElementById('add-cart-btn');
addCartBtn && addCartBtn.addEventListener('click', () => {
	const amount = parseInt(inputElement.value);
	const pathID = pathname.split('/').pop();
	const productID = pathID.split('-').pop();
	xhrCall('POST', {
		action: 'ADD_CART',
		amount: amount,
		productID: productID
	})
		.then(res => JSON.parse(res))
		.then(res => {
			console.log(res);
			showToast(res.status === 'SUCCESS' ? 'Successfully!' : 'Failure!', res.message, res.status, res.status === 'SUCCESS' ? 'top-right' : 'bottom-center');
			if (res.totalRecords) {
				toggleBadge(res.totalRecords);
			}
		})
});

// Remove item cart
const removeAllCartButton = document.getElementById('cart-remove-all');
const removeCartButtons = document.querySelectorAll('.cart-remove-btn');
const removeCart = productID => {
	swalAjax('Are you sure you wanna remove these products?', 'The products will be permanently removed from the cart!', 'warning', true)
		.then(() => xhrCall('POST', {
			action: 'REMOVE_CART',
			productID: productID
		}))
		.then(res => JSON.parse(res))
		.then(res => {
			if (res.status !== 'SUCCESS') {
				swal('Failure!', res.message, 'error');
				return;
			}
			swal('Successfully!', res.message, 'success');
			if (res.productID === 0) {
				const cartItems = document.querySelectorAll('.cart-child');
				cartItems && cartItems.forEach(item => {
					isCheckedItem = item.querySelector('.cart-checkbox-item').checked;
					isCheckedItem && item.remove();
				})
			}
			else {
				document.querySelector(`[data-item="${res.productID}"]`).remove();
			}
			loadTotalPrice();
			loadCart();
		})
};
removeAllCartButton && removeAllCartButton.addEventListener('click', () => {
	const isCheckedAny = document.querySelectorAll('input.cart-checkbox-item:checked').length > 0;
	if (!isCheckedAny) {
		showToast('Failure!', 'Please select the product to remove', 'ERROR', 'bottom-center');
		return;
	}
	removeCart(0);
})
removeCartButtons && removeCartButtons.forEach(item => {
	item.addEventListener('click', () => {
		const productID = item.closest('div[data-item]').getAttribute('data-item');
		removeCart(productID);
	})
});