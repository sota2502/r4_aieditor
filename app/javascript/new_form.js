$(function() {
  let new_form = $('.js-form-table .js-new-form-item')
  new_form.find('input, select, textarea').prop('disabled', true)
  new_form.hide()
  $('.js-new-trigger').on('click', (evt) => {
    evt.preventDefault()
    evt.stopPropagation()

    let element = new_form.clone(true)
    element.removeClass('js-new-form-item')
    element.addClass('js-added-form-item')
    element.find('input, select, textarea').prop('disabled', false)

    element.find('.js-delete').on('click', (evt) => {
      evt.preventDefault()
      evt.stopPropagation()
      element.remove();
    });
    
    new_form.before(element)
    element.show(300)
  });
});
