class WidgetsController < ApplicationController
  
  expose(:user) { User.find(params[:user_id]) }
  expose(:widgets) { user.widgets }
  expose(:widget)

  cache_sweeper :user_sweeper, :only => [ :create, :update, :delete ]

  # GET /widgets 
  def index   
  end

  # GET /widgets/1  
  def show   
  end

  # GET /widgets/new 
  def new    
  end

  # GET /widgets/1/edit
  def edit    
  end

  # POST /widgets  
  def create   
    if widget.save
      redirect_to([user, widget], :notice => 'Widget was successfully created.')      
    else
      render :action => "new"        
    end    
  end

  # PUT /widgets/1  
  def update   
    if widget.update_attributes(params[:widget])
      redirect_to([user, widget], :notice => 'Widget was successfully updated.')     
    else
      render :action => "edit"     
    end    
  end

  # DELETE /widgets/1  
  def destroy
    widget.destroy
    redirect_to(user_widgets_url(@user))      
  end
  
end

