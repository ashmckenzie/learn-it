Admin.controllers :questions do

  get :index do
    @questions = Question.all
    render 'questions/index'
  end

  get :new do
    @question = Question.new
    @question.answers.build
    render 'questions/new'
  end

  post :create do
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = 'Question was successfully created.'
      redirect url(:questions, :edit, :id => @question.id)
    else
      @question.answers.build
      flash[:error] = 'Question was not created.'
      render 'questions/new'
    end
  end

  get :edit, :with => :id do
    @question = Question.find(params[:id])
    @question.answers.build
    render 'questions/edit'
  end

  put :update, :with => :id do
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = 'Question was successfully updated.'
      redirect url(:questions, :edit, :id => @question.id)
    else
      flash[:error] = 'Question was not updated.'
      render 'questions/edit'
    end
  end

  delete :destroy, :with => :id do
    question = Question.find(params[:id])
    if question.destroy
      flash[:notice] = 'Question was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Question!'
    end
    redirect url(:questions, :index)
  end
end
