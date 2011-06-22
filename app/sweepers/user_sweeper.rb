class UserSweeper < ActionController::Caching::Sweeper
  observe User, Widget

  def after_create(resource)
    expire_action(:controller => 'users', :action => 'show', :id => get_id(resource))
  end

  def after_update(resource)
    expire_action(:controller => 'users', :action => 'show', :id => get_id(resource))
  end


  def after_destroy(resource)
    expire_action(:controller => 'users', :action => 'show', :id => get_id(resource))
  end

  private

  def get_id(resource)
    resource.class.name == 'User' ? resource.id : resource.user_id
  end
end

