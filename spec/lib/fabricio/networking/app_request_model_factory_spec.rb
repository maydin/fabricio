require 'rspec'
require 'fabricio/networking/app_request_model_factory'
require 'fabricio/networking/request_model'
require 'fabricio/authorization/session'
require 'fabricio/authorization/memory_param_storage'

describe 'AppRequestModelFactory' do

  before(:each) do
    param_storage = Fabricio::Authorization::MemoryParamStorage.new
    param_storage.store_organization_id('1')
    param_storage.store_app_id('1')
    @factory = Fabricio::Networking::AppRequestModelFactory.new(param_storage)
  end

  it 'should form all apps request model' do
    result = @factory.all_apps_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form get app request model' do
    result = @factory.get_app_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form active_now app request model' do
    result = @factory.active_now_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form daily_new app request model' do
    result = @factory.daily_new_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form daily_active app request model' do
    result = @factory.daily_active_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form weekly_active app request model' do
    result = @factory.weekly_active_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form monthly_active app request model' do
    result = @factory.monthly_active_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form session_count app request model' do
    result = @factory.total_sessions_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form crashes app request model' do
    result = @factory.crash_count_request_model

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form top issues request model' do
    result = @factory.top_issues_request_model

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form single issue request model' do
    result = @factory.single_issue_request_model(issue_id: '1')

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form issue session request model' do
    result = @factory.issue_session_request_model(issue_id: '1')

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form add comment request model' do
    result = @factory.add_comment_request_model(issue_id: '1')

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form oomfree app request model' do
    result = @factory.oom_count_request_model

    expect(result.type).to eq :POST
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form all custom event request model' do
    result = @factory.all_custom_event_request_model

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form custom event total request model' do
    result = @factory.custom_event_total_request_model(event_type: 'Custom Event Name')

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form custom event unique devices request model' do
    result = @factory.custom_event_unique_devices_request_model(event_type: 'Custom Event Name')

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form all custom event attribute request model' do
    result = @factory.all_custom_event_attribute_request_model(event_type: 'Custom Event Name')

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end

  it 'should form custom event attribute request model' do
    result = @factory.custom_event_attribute_request_model(event_type: 'Custom Event Name', event_attribute: 'Custom Attribute', selected_time: 1523800800)

    expect(result.type).to eq :GET
    expect(result.base_url).not_to be_nil
    expect(result.api_path).not_to be_nil
    expect(result.headers).not_to be_nil
  end
end
