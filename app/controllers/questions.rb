LearnIt.controllers :questions do

  get :index do
    @questions = Question.enabled.with_answers
    render 'questions/index'
  end

  get :show, :with => :id do
    @questions = Question.enabled.find(params[:id])
    render 'questions/show'
  end

  get :random do
    # FIXME: ineffecient
    @question = Question.all.shuffle.first
    render 'questions/show'
  end

  post :check do
    results = {}

    params['questions'].each do |question_id, data|
      answer_ids = data['answers'].map { |x| x.first }
      correct = Question.correct_answers_for_question_id(question_id).map { |x| x.id.to_s } - answer_ids == []
      results[question_id] = correct
    end

    ap results

    ''
  end
end
