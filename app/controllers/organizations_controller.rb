class OrganizationsController < ApplicationController

  before_filter :find_organization, :only => [:show, :edit, :ajax_edit, :update, :destroy]

private
  def find_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params
      .require(:organization)
      .permit(:name, :contact, :city, :country, :needs, :password,  :announcer, :email, { :tag_ids => [] })
  end

public
  # GET /organizations
  # GET /organizations.xml
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @tags = Tag.all
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Organization.new
    @tag = Tag.new
  end

  # GET /organizations/1/edit
  def edit
    render :layout => "layouts/organization_edit"
  end

  def ajax_edit
    respond_to do |format|
      if(@organization.password == params[:password]) then
        format.js { render :partial => "organizations/form" , :locals => { :action => "Update" } }
      else
        format.js { render :text => t("wrong_password"), :status => :forbidden }
      end
    end
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    params[:organization][:tag_ids] ||= []
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        flash[:notice] = t("organization.success_created")
        format.html { redirect_to(@organization) }
      else
        @tag = Tag.new
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    params[:organization][:tag_ids] ||= []

    respond_to do |format|
      if @organization.update_attributes(organization_params)
        flash[:notice] = t("organization.success_updated")
        format.html { redirect_to(@organization) }
      else
        format.html { render :layout => "layouts/organization_edit" }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.xml
  def destroy
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to(organizations_url) }
    end
  end

  def search
    tag_ids = params[:tag_ids]
    name_slug = "%#{Organization.slug_name(params[:q])}%"
    city_slug = "%#{Organization.slug_city(params[:q])}%"
    @organizations = Organization.all(:conditions => ["name_slug like ? OR city_slug like ?", name_slug , city_slug ] )
    @organizations &= Tag.find(tag_ids).inject([]) { |a,t| a + t.organizations } if tag_ids && !tag_ids.empty?

    respond_to do |format|
      format.html { render :action => :index }
    end
  end

end
