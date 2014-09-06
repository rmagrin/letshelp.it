# coding: UTF-8

require 'rails_helper'

describe OrganizationsController, :type => :controller do

  it 'should have an index page' do
    get :index
    expect(response).to be_success
    expect(response).to render_template(:index)
    expect(request.flash).to be_empty
  end

  it 'should have a new page' do
    get :new
    expect(response).to be_success
  end

  it 'should create an organization' do
    expect {post :create, :organization => FactoryGirl.attributes_for(:organization)}.to change(Organization, :count).by(1)
    expect(response).to redirect_to(Organization.last)
  end
  context 'when manipulating organizations' do
    let(:organization) { FactoryGirl.create(:organization)}

    it 'should show an organization' do
      get :show, :id => organization
      expect(response).to be_success
    end

    it 'should be able to edit an organization' do
      get :edit, :id => organization
      expect(response).to be_success
    end

    it 'should be able to successfully update an organization' do
      put :update, :id => organization, :organization => {:name => "EvilOrganization"}
      expect(response).to be_redirect
    end

    it 'should be able to successfully delete an organization' do
      delete :destroy, :id => organization
      expect(response).to redirect_to(organizations_path)
    end

    it 'should show tags when there is a validation error while creating an organization' do
      put :create, :organization => {}
      expect(response).to be_success
    end
  end

  context 'when searching for organizations' do
    let(:organization) { FactoryGirl.create(:organization) }

    it 'should return organizations based on its name' do
      get :search, :q => organization.name
      expect(assigns(:organizations)).to include(organization)
    end

    it 'should return organizations based on its city' do
      get :search, :q => organization.city
      expect(assigns(:organizations)).to include(organization)
    end

    it 'should return organizations based on tags' do
      tag = FactoryGirl.create(:tag)
      organization.tags << tag
      get :search, :tag_ids => [tag]
      expect(assigns(:organizations)).to include(organization)
    end

    it 'should not return an organization without the tag being searched' do
      tag = FactoryGirl.create(:tag)
      get :search, :tag_ids => [tag]
      expect(assigns(:organizations)).not_to include(organization)
    end

    it 'should be able to find organizations based on cities with/without accents' do
      organization.city = 'São Paulo'
      organization.save!
      get :search, :q => 'sao paulo'
      expect(assigns(:organizations)).to include(organization)
      get :search, :q => 'são paulo'
      expect(assigns(:organizations)).to include(organization)
    end

    it 'should not allow SQL injections' do
      get :search, :q => "' or '1=1"
      expect(assigns(:organizations)).to be_empty
    end
  end
end
