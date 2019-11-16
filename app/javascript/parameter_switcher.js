'use strict'
$(function() {
  const CANCEL_TYPES = window.cancelTypes
  class ParameterSwitcher {
    constructor(elem) {
      this.element = $(elem)
      this.targetSelector = this.element.find('.js-cancel-type').first()
      this.targetSelector.on('change', this.changeHandler.bind(this))
      this.switchSelector()
    }
    changeHandler() {
      this.switchSelector()
    }
    value() {
      return this.targetSelector.prop('value')
    }
    switchSelector() {
      const cancel_type = CANCEL_TYPES[this.value()]
      this._switchSelectorByName(cancel_type, 'parameter1')
      this._switchSelectorByName(cancel_type, 'parameter2')
    }
    _switchSelectorByName(cancel_type, name) {
      const selectorName = '.js-' + name
      this.element.find(selectorName).each((i, e) => {
        const selector = $(e)
        if ( selector.data().type == cancel_type[name] ) {
          selector.prop('disabled', false)
          selector.show()
        }
        else {
          selector.prop('disabled', true)
          selector.hide()
        }
      })
    }
  }

  $('.js-cancel-condition-row').each( (i, elem) => {
    new ParameterSwitcher(elem)
  })

  $('.js-new-trigger').on('click', (evt) => {
    const elem = $('.js-added-form-item').last()
    new ParameterSwitcher(elem)
  })
});
