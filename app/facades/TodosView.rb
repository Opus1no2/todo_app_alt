class TodosView
  def initialize(user, params)
    @user = user
    @params = params
  end

  def todo_lists
    @todo_lists ||= user.todo_lists
  end

  def todo_list
    @todo_list ||= todo_lists.find(list_id)
  end

  def todos
    @todos ||= todo_list.todos.order(created_at: :desc)
  end

  def list_id
    params[:todo_list_id]
  end

  private

  attr_reader :user, :params
end