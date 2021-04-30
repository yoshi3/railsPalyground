class PeopleController < ActionController::Base
  layout 'people'

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
  def find
    @message = 'please type any search word...'
    @data = Array.new
    if request.post? then
      @data = Person.where('name like ?', "%#{params[:find]}%")
                    .order('age asc')
    end
  end
  def create
    @person = Person.new person_params
    if @person.save then
      redirect_to '/people'
    else
      render 'add'
    end
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
