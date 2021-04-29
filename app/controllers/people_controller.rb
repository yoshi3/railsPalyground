class PeopleController < ActionController::Base
  def index
    @message = 'Person datas.'
    @data = Person.all
  end
  def show
    @message = 'Indexed data.'
    @data = Person.find(params[:id])
  end
  def add
    @message = 'Add a new data.'
    @person = Person.new
  end
  def create
    if request.post? then
      object = Person.create(person_params)
    end
    redirect_to '/people'
  end
  def edit
    @message = "Edit data.[id = #{params[:id]}]"
    @person = Person.find(params[:id])
  end
  def update
    object = Person.find(params[:id])
    object.update(person_params)
    redirect_to '/people'
  end
  def delete
    object = Person.find(params[:id])
    object.destroy
    redirect_to '/people'
  end
  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end
end
