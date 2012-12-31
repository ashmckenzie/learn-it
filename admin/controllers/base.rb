Admin.controllers :base do

  get :index, :map => '/' do
    # render "base/index"
    redirect '/admin/questions'
  end
end
