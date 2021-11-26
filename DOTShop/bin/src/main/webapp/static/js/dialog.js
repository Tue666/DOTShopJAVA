const swalAjax = (title = '', content = '', icon = '', danger = false) => {
	return new Promise(resolve => {
		swal({
			title: title,
			text: content,
			icon: icon,
			dangerMode: danger,
			buttons: {
				cancel: {
					text: "Cancel",
					value: false,
					visible: true,
					closeModal: true,
				},
				confirm: {
					text: "OK",
					value: true,
					visible: true,
					closeModal: false
				}
			}
		})
			.then(value => {
				if (value) {
					resolve();
				}
				else {
					swal("Got away safely!");
				}
			})
	});
};