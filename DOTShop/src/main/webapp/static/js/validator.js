/*
=== Init =================================================================================
    + Import or linking this file
    NOTE: The effect of validate error, success only occurs when using BOOTSTRAP

=== Usage =================================================================================
    ========================================================================
    | Definition of validate                                                |
    | + required              => This field will be required                |
    | + isEmail               => This field must be an email                |
    | + minLength:{number}    => This field at least {number} characters    |
    | + maxLength:{number}    => This field up to {number} characters       |
    | + same:{selector}       => This field must same the {selector} value  |
    ========================================================================

    ---------------------------------- HTML ----------------------------------
    + Add name, attribute for input need to be validate: rules="YOUR_VALIDATE_STRING_1|YOUR_VALIDATE_STRING_2"
    ---------------------------------- JS ------------------------------------
    + Call method:
    Validator({
        selector: String[required]         => The form's class name needs to be validated (WITH a dot of the beginning) 
        parentNodeClass: String[required]  => The parent element name of each child element needs to be validated (WITHOUT a dot of the beginning)
        messageNodeClass: String[required] => The element name contains the message of each child element needs to be validated (WITH a dot of the beginning)
        requiredRadio: Bool[optional]      => Optional if want setting for required radio button
        requiredCheckbox: Bool[optional]   => Optional if want setting for required checkbox button
        onSubmit: Function[optional]       => Callback function with params is the form data
    })

=== Example =================================================================================
    ---------------------------------- HTML ----------------------------------
    <form class="register-form">
        <div class="form-group">
            <label for="register-user-name" class="form-label">Email</label>
            <input type="email" name="registerUsername" rules="required|isEmail" class="form-control shadow-none" id="register-user-name" autocomplete="off">
            <div class="form-message form-text text-danger"></div>
        </div>
    </form>
    ---------------------------------- JS ------------------------------------
    Validator({
        selector: '.register-form',
        parentNodeClass: 'form-group',
        messageNodeClass: '.form-message',
        requiredRadio: true,
        requiredCheckbox: true,
        onSubmit: data => {
            console.log(data);
        }
    });
*/
const Validator = (object) => {
    // Definition of rules
    const validateRules = {
        required: (value) => {
            return value ? undefined : 'Please enter this field!';
        },
        isEmail: (value) => {
            const regexEmail = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return regexEmail.test(value) ? undefined : 'This field requies an email!';
        },
        minLength: (minValue) => {
            return value => value.length >= minValue ? undefined : `Enter at least ${minValue} characters `;
        },
        maxLength: (maxValue) => {
            return value => value.length < maxValue ? undefined : `Enter up to ${maxValue} characters `;
        },
        same: (selector) => {
            return value => value === document.getElementsByName(selector)[0].value ? undefined : 'Password not sync';
        }
    }
    var formElement = document.querySelector(object.selector);
    var formRules = {};

    if (formElement) {
        if (object.requiredRadio) {
            var radioElements = formElement.querySelectorAll('input[type="radio"]');
            radioElements.forEach(element => element.setAttribute('rules', 'required'));
        }
        if (object.requiredCheckbox) {
            var checkboxElements = formElement.querySelectorAll('input[type="checkbox"]');
            checkboxElements.forEach(element => element.setAttribute('rules', 'required'));
        }
        var inputElements = formElement.querySelectorAll('[name]');
        inputElements.forEach(element => {
            if (element.hasAttribute('rules')) {
                // Get all rules of this element
                var rules = element.getAttribute('rules').split('|');
                rules.forEach(rule => {
                    var ruleFunc = validateRules[rule];
                    // If the rule has params
                    if (rule.includes(':')) {
                        var ruleInfor = rule.split(':');
                        ruleFunc = validateRules[ruleInfor[0]](ruleInfor[1]);
                    }

                    // If already have rule(s) for element
                    if (Array.isArray(formRules[element.name]) && element.type !== 'radio' && element.type !== 'checkbox') {
                        formRules[element.name].push(ruleFunc);
                    }
                    else {
                        formRules[element.name] = [ruleFunc];
                    }
                })

                // Event listener for element
                element.onblur = event => handlerValidate(event);
                element.oninput = event => handlerClearValidate(event);
            }
        })

        const handlerValidate = event => {
            // Get all rules of this element
            var rules = formRules[event.target.name];
            var errorMessage;
            for (var rule of rules) {
                switch (event.target.type) {
                    case 'radio':
                        errorMessage = rule(formElement.querySelector('input[type="radio"]:checked'));
                        break;
                    case 'checkbox':
                        errorMessage = rule(formElement.querySelector('input[type="checkbox"]:checked'));
                        break;
                    default:
                        errorMessage = rule(event.target.value);
                        break;
                }
                if (errorMessage) break;
            }

            var parentNode = getParentNode(event.target, object.parentNodeClass);
            if (parentNode) {
                if (errorMessage) {
                    event.target.classList.add('is-invalid');
                    var messageNode = parentNode.querySelector(object.messageNodeClass);
                    messageNode.innerHTML = errorMessage;
                }
                else {
                    if (event.target.type == 'checkbox') {
                        var checkboxElements = formElement.querySelectorAll('input[type="checkbox"]:checked');
                        checkboxElements.forEach(element => element.classList.add('is-valid'));
                    }
                    else {
                        event.target.classList.add('is-valid');
                    }
                }
            }

            return !errorMessage;
        }

        const handlerClearValidate = event => {
            var parentNode = getParentNode(event.target, object.parentNodeClass);
            if (parentNode) {
                switch (event.target.type) {
                    case 'checkbox':
                    case 'radio':
                        var targetElements = parentNode.querySelectorAll('input[type="' + event.target.type + '"]');
                        targetElements.forEach(element => {
                            element.classList.remove('is-invalid');
                            element.classList.remove('is-valid');
                        });
                        break;
                    default:
                        event.target.classList.remove('is-invalid');
                        event.target.classList.remove('is-valid');
                        break;
                }
                var messageNode = parentNode.querySelector(object.messageNodeClass);
                messageNode.innerHTML = '';
            }
        }

        // Event listener for form
        formElement.onsubmit = event => handlerSubmitForm(event);

        const handlerSubmitForm = (event) => {
            event.preventDefault();
            var isValid = true;
            var inputElements = formElement.querySelectorAll('[name]');
            for (var element of inputElements) {
                if (element.hasAttribute('rules')) {
                    isValid ? isValid = handlerValidate({ target: element }) : handlerValidate({ target: element });
                }
            };

            // The form now can be submit
            if (isValid) {
                var data = {};
                inputElements.forEach(element => {
                    switch (element.type) {
                        case 'radio':
                            var radioElement = formElement.querySelector('input[type="radio"]:checked');
                            data[element.name] = radioElement ? radioElement.value : "";
                            break;
                        case 'checkbox':
                            data[element.name] = [];
                            var checkboxElements = formElement.querySelectorAll('input[type="checkbox"]:checked');
                            checkboxElements.forEach(element => data[element.name].push(element.value));
                            break;
                        case 'file':
                            data[element.name] = element.files[0];
                            break;
                        default:
                            data[element.name] = element.value;
                            break;
                    }
                });
                // Callback exist
                if (typeof object.onSubmit === 'function') {
                    object.onSubmit(data);
                }
                else {
                    event.target.submit();
                }
            }
        }
    }
}

const getParentNode = (currentNode, parentNodeName) => {
    if (currentNode.classList.contains(parentNodeName)) return currentNode;
    return getParentNode(currentNode.parentNode, parentNodeName);
}