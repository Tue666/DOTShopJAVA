// Common
const pathname = window.location.pathname;
const appName = pathname.substr(0, window.location.pathname.indexOf("/", 2));
const xhrURL = window.location.origin + appName + '/ajax';

const currencyVN = money => money.toLocaleString('vi', { style: 'currency', currency: 'VND' });
const currencyToNumber = money => {
	money = money.replace(/[.]/g, ',');
	money = money.replace(/[^0-9.-]+/g, '');
	return parseInt(money);
};

//Load theme
const theme = localStorage.getItem('theme') || 'light';
document.querySelector(':root').setAttribute('data-theme', theme);

//Toggle dark theme
const toggleBtn = document.getElementById('toggle-btn');
if (toggleBtn) {
	toggleBtn.addEventListener('click', () => {
		const root = document.querySelector(':root');
		const isLightMode = root.getAttribute('data-theme') === 'dark' ? false : true;
		if (isLightMode) {
			root.setAttribute('data-theme', 'dark');
		} else {
			root.setAttribute('data-theme', 'light');
		}
		localStorage.setItem('theme', isLightMode ? 'dark' : 'light');
	});
}

// Format quantity in detail
const inputElement = document.querySelector('.detail-qty-input');
const subBtn = document.querySelector('.sub-btn');
const plusBtn = document.querySelector('.plus-btn');
if (inputElement) {
	inputElement.addEventListener('input', () => {
		var value = inputElement.value;
		const regex = /^[1-9][0-9]*$/;
		if (!regex.test(value)) {
			value = value.slice(0, -1);
			if (value === '') {
				value = 1;
			}
		}
		inputElement.value = value;
		if (parseInt(value) <= 1) subBtn.classList.add('disabled');
		else subBtn.classList.remove('disabled');
	});
}
if (inputElement && subBtn) {
	subBtn.addEventListener('click', () => {
		var currentValue = parseInt(inputElement.value);
		newValue = currentValue - 1;
		inputElement.value = newValue;
		if (newValue <= 1) {
			subBtn.classList.add('disabled');
		}
	});
}
if (inputElement && plusBtn) {
	plusBtn.addEventListener('click', () => {
		var currentValue = parseInt(inputElement.value);
		newValue = currentValue + 1;
		inputElement.value = newValue;
		if (newValue > 1) {
			subBtn.classList.remove('disabled');
		}
	});
}

// Validate cart selected to navigate payment page
const paymentBtn = document.querySelector('.payment-btn');
paymentBtn && paymentBtn.addEventListener('click', () => {
	const cartContent = document.querySelector('.cart-content');
	const selectedItems = cartContent.querySelectorAll('input[type="checkbox"]:checked');
	if (selectedItems.length < 1) {
		showToast('Failure!', 'Please select the product to remove', 'ERROR', 'bottom-center');
	} else {
		window.location.href = appName + '/payment';
	}
});