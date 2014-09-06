# coding: UTF-8

require 'ui_helper'

describe 'Submitting organization' do
  before { visit "/organizations/new" }

  context 'invalid organization' do
    before { find('#organization_submit').click }

    it 'should validade a new organization' do
      expected_error_messages = ["Name", "Contact", "City", "Country", "Password", "Announcer", "Email"].collect {|field| "#{field} can't be blank"}
      displayed_errors_messages = all(:xpath, "//div[@id='errorExplanation']/ul/li").collect {|field| field.text }

      expect(displayed_errors_messages.sort).to eq(expected_error_messages.sort)
    end

    it 'should not show success message' do
      expect(page).not_to have_xpath("//h4[@class='successfulUpdated']")
    end
  end

  context 'organization with invalid mail' do
    before do
      fill_in 'organization[name]', :with => 'Casa da Mae Joana'
      fill_in 'organization[contact]', :with => 'Fulano'
      fill_in 'organization[city]', :with => 'Cidade'
      fill_in 'organization[country]', :with => 'País'
      fill_in 'organization[announcer]', :with => 'Announcer'
      fill_in 'organization[password]', :with => 'password'
      fill_in 'organization[email]', :with => 'a'

      click_button 'organization_submit'
    end

    it 'should preserver input when organization is not valid' do
      expect(find(:xpath, "//input[@name='organization[name]']").value).to eq('Casa da Mae Joana')
    end

    it 'should tell invalid field' do
      expect(find(:xpath, "//div[@id='errorExplanation']/ul/li").text).to match(/Email(.*)invalid/)
    end

    it 'should not show success message' do
      expect(page).not_to have_xpath("//h4[@class='successfulUpdated']")
    end
  end

  it 'should create a valid organization' do
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
    expect(page).to have_xpath("//h4[@class='successfulUpdated']")
  end

end

describe 'Editing organization' do
  before(:each) do
    visit "/organizations/new"
    fill_in 'organization[name]', :with => 'Casa da Mae Joana'
    fill_in 'organization[contact]', :with => 'Fulano'
    fill_in 'organization[city]', :with => 'Cidade'
    fill_in 'organization[country]', :with => 'País'
    fill_in 'organization[announcer]', :with => 'Announcer'
    fill_in 'organization[password]', :with => 'password'
    fill_in 'organization[email]', :with => 'a@a.com'
    click_button 'organization_submit'
    visit "/"
    find(:xpath, "//div[@class='wrapper featuredOrg']/a/div").click
    click_link 'Edit'
  end

  it 'should validate wrong password' do
    fill_in 'pass_field', :with => 'XXX'
    click_button 'Validate'
    expect(has_content? 'Invalid password').to be_truthy
  end

  it 'should validate empty password' do
    click_button 'Validate'
    expect(has_content? 'Invalid password').to be_truthy
  end

  it 'should validate correct password' do
    fill_in 'pass_field', :with => 'senha'
    click_button 'Validate'
    expect(has_content? 'Casa da Mae Joana').to be_truthy
  end

  it 'should edit organization' do
    fill_in 'pass_field', :with => 'password'
    click_button 'Validate'
    fill_in 'organization[city]', :with => 'Tangamandapio'
    find_field 'organization[city]'
    fill_in 'organization[password]', :with => 'password'
    click_button 'organization_submit'
    expect(page).to have_xpath("//h4[@class='successfulUpdated']")
  end

end
