require 'spec_helper'

describe LongTermPlannerController do
  render_views

  describe "#index" do
    it "renders the index page" do
      get :index
      assert_template "index"
      expect(response).to be_success
    end
  end

  describe "#next_year" do
    it "calculates the long term plan for the parameters" do
      get :next_year, :balance => 1_000, :contributions => 1_000,
        :withdraws => 500

      assert_template "index"

      expect(assigns(:planner)).to_not be_nil
      expect(assigns(:planner_results).average).to eq(1_500)
    end

    it "applies Investments if requested" do
      get :next_year, :balance => 1_000, :investment => {
        :annual_yield => "0.1", :std_dev => "1"
      }

      expect(assigns(:planner_results).average).to be > 1_000
      expect(assigns(:planner_results).average).to be < 1_200
    end

    it "applies inflation as a negative investment" do
      get :next_year, :balance => 1_000, :inflation => {
        :annual_yield => "0.1", :std_dev => "1"
      }

      expect(assigns(:planner_results).average).to be > 800
      expect(assigns(:planner_results).average).to be < 1_000
    end
  end

end
