# coding: utf-8

require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class OrganizationTest < ActiveSupport::TestCase
  
  should validate_presence_of :name  
  should validate_presence_of :contact
  should validate_presence_of :city
  should validate_presence_of :city_slug
  should validate_presence_of :country
  should validate_presence_of :password
  should validate_presence_of :email
  should validate_presence_of :announcer  

  should validate_uniqueness_of :name
  
  should_not allow_value("invalidmail").for(:email)
  should_not allow_value("@b.com").for(:email)
  should allow_value("a@b.com").for(:email)
  should allow_value("valid.string+alias@mail.com").for(:email)
 
  test "should return if the given tag is associated to the organization" do
    org = organizations(:wwf)
    
    assert org.has_tag?(tags(:cloth)), 'have tag cloth'
    assert org.has_tag?(tags(:food)), 'have tag food'
    assert !org.has_tag?(tags(:money)), 'doesn\'t has tag money'
  end
  
  test "should create slug city automatically" do
    org = organizations(:wwf)
    
    org.city = 'Jaraguá do Sul'
    assert_equal 'jaragua do sul', org.city_slug
    assert org.save
    
    org.city = 'São Paulo'
    assert_equal 'sao paulo', org.city_slug
    assert org.save
  end

  test "should create slug name with approximated ascii characters" do
    params = { :name => 'Minha organização', :contact => 'test@test.com', :city => 'Porto Alegre', :city_slug => 'porto alegre',
      :country => 'Brazil', :needs => 'mucha cosa', :password => '1', :email => 'test@test.com', :announcer => 'announcer'}
    org = Organization.create(params)
    assert_equal "minha-organizacao", org.name_slug, "name slug is '#{org.name_slug}', but 'minha-organizacao' was expected"
  end
  
end
