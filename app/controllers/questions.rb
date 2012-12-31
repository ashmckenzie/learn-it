LearnIt.controllers :questions do

  get :index do
    @questions = Question.all
    render 'questions/index'
  end

  get :show, :with => :id do
    @questions = Question.find(params[:id])
    render 'questions/show'
  end
end
