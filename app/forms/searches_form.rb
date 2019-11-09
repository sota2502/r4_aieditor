class SearchesForm
  include ActiveModel::Model

  def initialize(searches_params = {})
    @searches_params = searches_params
  end  

  def save
    action_state_id = @searches_params[:action_state_id]
    searches = search_instances(action_state_id) + new_search_instances(action_state_id)
    Search.import searches, on_duplicate_key_update: [:name, :x1, :y1, :x2, :y2]
  end

  private

    def search_instances(action_state_id)
      @searches_params[:search][:searches].to_h.map do |_, param|
        Search.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end

    def new_search_instances(action_state_id)
      @searches_params[:search][:new_searches].to_a.map do |param|
        Search.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end
end
