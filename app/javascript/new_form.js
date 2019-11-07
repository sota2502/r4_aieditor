$(function() {
  $('.js-new-form-item').hide()
  $('.js-new-trigger').on('click', (evt) => {
    evt.preventDefault()
    evt.stopPropagation()

    let element = $('.js-form-table .js-new-form-item').clone(true)
    element.addClass('js-form-item')
    element.removeClass('js-new-form-item')
    
    $('.js-form-table').append(element)
    element.show(300)
  });
});
