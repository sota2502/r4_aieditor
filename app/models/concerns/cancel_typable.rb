module CancelTypable
  extend ActiveSupport::Concern

  def cancel_type
    CancelType.new(cancel_type_id)
  end

  def cancel_type=(cancel_type)
    self.cancel_type_id = cancel_type.id
  end
end
