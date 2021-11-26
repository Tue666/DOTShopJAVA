const AutomaticSlideshow = (object) => {
    const parentSelector = document.querySelector(object.parentSelector);
    const slideElements = document.querySelectorAll(object.slideSelector);
    const iconElements = object.iconBottom ? document.querySelectorAll(object.iconSelector) : [];
    var index = 0;
    if (parentSelector && slideElements) {
        const prevBtn = parentSelector.querySelector('.btn-prev');
        const nextBtn = parentSelector.querySelector('.btn-next');

        prevBtn.addEventListener('click', () => prevSlide());
        nextBtn.addEventListener('click', () => nextSlide());

        const prevSlide = () => {
            index--;
            if (index < 0) index = slideElements.length - 1;
            slideElements[index].classList.add('active');
            removeActiveSlide(slideElements, index);
            if (object.iconBottom) {
                iconElements[index].classList.add('active');
                removeActiveSlide(iconElements, index);
            }
        }
        const nextSlide = () => {
            index++;
            if (index >= slideElements.length) index = 0;
            slideElements[index].classList.add('active');
            removeActiveSlide(slideElements, index);
            if (object.iconBottom) {
                iconElements[index].classList.add('active');
                removeActiveSlide(iconElements, index);
            }
        }

        if (object.iconBottom) {
            iconElements.forEach((element, i) => {
                element.addEventListener('click', () => {
                    index = i;
                    slideElements[index].classList.add('active');
                    removeActiveSlide(slideElements, index);
                    if (object.iconBottom) {
                        iconElements[index].classList.add('active');
                        removeActiveSlide(iconElements, index);
                    }
                })
            })
        }

        if (object.autoPlay) {
            const autoPlay = () => {
                playSlide = setInterval(() => {
                    nextSlide();
                }, object.delay);
            }
            autoPlay();

            parentSelector.addEventListener('mouseover', () => pausePlay());
            parentSelector.addEventListener('mouseout', () => autoPlay());
            const pausePlay = () => {
                clearInterval(playSlide);
            }
        }
    }
}
const removeActiveSlide = (removeElements, currentIndex) => {
    removeElements.forEach((element, index) => {
        if (currentIndex !== index) {
            element.classList.remove('active');
        }
    });
}