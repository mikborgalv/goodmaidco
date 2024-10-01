require "application_system_test_case"

class ServiceRecordsTest < ApplicationSystemTestCase
  setup do
    @service_record = service_records(:one)
  end

  test "visiting the index" do
    visit service_records_url
    assert_selector "h1", text: "Service records"
  end

  test "should create service record" do
    visit service_records_url
    click_on "New service record"

    fill_in "Date", with: @service_record.date
    fill_in "Location", with: @service_record.location_id
    fill_in "Partner", with: @service_record.partner_id
    fill_in "Status", with: @service_record.status
    click_on "Create Service record"

    assert_text "Service record was successfully created"
    click_on "Back"
  end

  test "should update Service record" do
    visit service_record_url(@service_record)
    click_on "Edit this service record", match: :first

    fill_in "Date", with: @service_record.date
    fill_in "Location", with: @service_record.location_id
    fill_in "Partner", with: @service_record.partner_id
    fill_in "Status", with: @service_record.status
    click_on "Update Service record"

    assert_text "Service record was successfully updated"
    click_on "Back"
  end

  test "should destroy Service record" do
    visit service_record_url(@service_record)
    click_on "Destroy this service record", match: :first

    assert_text "Service record was successfully destroyed"
  end
end
