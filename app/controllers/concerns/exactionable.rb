module Exactionable
  extend ActiveSupport::Concern

  included do
    helper_method :exaction
  end

  def exaction
    @exaction = Exaction.find(params[:exaction_id])
  end
end
