class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!, except: :index
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit destroy update update_inline]

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.written.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :visible, :time_to_complete)
  end
end
