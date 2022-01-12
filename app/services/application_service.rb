class ApplicationService
  def index(params)
    @applications = Application.paginate(:page => params[:page], :per_page => 10)
  end

  def create(params)
    @application = Application.create(params)
  end

  def update(uuid, params)
    @application = Application.find(uuid)
    @application.update(params)

    @application
  end

  def show(uuid)
    @application = Application.find(uuid)
  end

  def is_application_exists(uuid)
    @application_exists = Application.exists?(:uuid => uuid)
  end

end