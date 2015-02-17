require 'spec_helper'
require 'rails_helper'

describe MembershipsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:membership) { double(:membership) }
  let(:current_user) { double(:current_user) }
  let(:params) { { id: "1" } }
  let(:community)

  before do
    sign_in user
  end

  describe "#index" do
    before do
      allow(Community).to receive(:find).with(params[:community_id]).and_return(community)
      allow(Membership).to receive(:all) { [membership] }

      allow(controller).to receive(:render)
    end

    it "assigns the instance variables" do
      get :index
      expect(assigns(:memberships)).to eq([membership])
    end
  end

  describe "#new" do
    before do
      allow(Membership).to receive(:new) { membership }
      allow(controller).to receive(:render)
    end

    it "assigns a new instance of membership to the membership ivar" do
      get :new
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe "#show" do
    let(:params) { { id: "1" } }

    before do
      allow(Membership).to receive(:find).with(params[:id]) { membership }
      allow(controller).to receive(:render)
    end

    it "finds the membership in the params and assigns it to the membership ivar" do
      get :show, params
      expect(assigns(:membership)).to eq(membership)
    end
  end

  # describe "#create" do
    # let(:params) { { id: "1" } }

    # before do
      # allow(Membership).to receive(:new).with(membership_params) { membership }
      # allow(membership).to receive(:save)
      # allow(controller).to receive(:render)
    # end

    # context "it successfully saves the membership" do
      # post :create, params
      # expect(response).to redirect_to('/').with(notice: "You have joined this community")
    # end

    # context "it does not successfully saves the membership" do
      # post :create, params
      # expect(response).to redirect_to('/').with(notice: "Couldn't join community")
    # end
  # end
end
