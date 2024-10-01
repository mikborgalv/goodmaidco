require "test_helper"

class ServiceRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_record = service_records(:one)
  end

  test "should get index" do
    get service_records_url
    assert_response :success
  end

  test "should get new" do
    get new_service_record_url
    assert_response :success
  end

  test "should create service_record" do
    assert_difference("ServiceRecord.count") do
      post service_records_url, params: { service_record: { date: @service_record.date, location_id: @service_record.location_id, partner_id: @service_record.partner_id, status: @service_record.status } }
    end

    assert_redirected_to service_record_url(ServiceRecord.last)
  end

  test "should show service_record" do
    get service_record_url(@service_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_record_url(@service_record)
    assert_response :success
  end

  test "should update service_record" do
    patch service_record_url(@service_record), params: { service_record: { date: @service_record.date, location_id: @service_record.location_id, partner_id: @service_record.partner_id, status: @service_record.status } }
    assert_redirected_to service_record_url(@service_record)
  end

  test "should destroy service_record" do
    assert_difference("ServiceRecord.count", -1) do
      delete service_record_url(@service_record)
    end

    assert_redirected_to service_records_url
  end
end
