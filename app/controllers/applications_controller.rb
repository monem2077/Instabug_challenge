class ApplicationsController < ApplicationController

  def initialize
    @application_service = ApplicationService.new
  end

  def index
    @applications = @application_service.index(params)
  end

  def create
    @application = @application_service.create(application_params)
    unless @application.save
      render json: { message: "Validation failed", errors: @application.errors }, status: 404
    end
  end

  def update
    @application =  @application_service.update(params[:uuid], application_params)
    unless @application.save
      render json: { message: "Validation failed", errors: @application.errors }, status: 404
    end
  end

  def show
    @application = @application_service.show(params[:uuid])
  end


  def application_params
    params.require(:application).permit(:name)
  end

end
