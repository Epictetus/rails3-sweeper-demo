class WidgetsController < ApplicationController
  before_filter :grab_user_from_user_id

  # GET /widgets
  # GET /widgets.xml
  def index
    @widgets = @user.widgets.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
    end
  end

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    @widget = @user.widgets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/new
  # GET /widgets/new.xml
  def new
    @widget = @user.widgets.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = @user.widgets.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.xml
  def create
    @widget = @user.widgets.new(params[:widget])

    respond_to do |format|
      if @widget.save
        format.html { redirect_to([@user, @widget], :notice => 'Widget was successfully created.') }
        format.xml  { render :xml => @widget, :status => :created, :location => @widget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = @user.widgets.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to([@user, @widget], :notice => 'Widget was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.xml
  def destroy
    Widget.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(user_widgets_url(@user)) }
      format.xml  { head :ok }
    end
  end

  private

  def grab_user_from_user_id
    @user = User.find(params[:user_id])
  end
end

