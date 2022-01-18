class AccountAffiliationsController < ApplicationController
  before_action :set_account_affiliation, only: %i[ update destroy ]
  before_action :authenticate_user!

  def index
    @account_affiliations = AccountAffiliation.where(account_id: params[:account_id])
  end

  def show
    @account_affiliation = AccountAffiliation.find_or_create_by(user_id: params[:user_id], account_id: params[:account_id], role: params[:role])
  end

  

  def info
    @account_affiliation = AccountAffiliation.find(params[:id])
  end

  def become_admin
    @account_affiliation = AccountAffiliation.find(params[:id])
    @account_affiliation.role = "admin"
    @account_affiliation.save
  end

  def new
    @account_affiliation = AccountAffiliation.new
  end

  def create
    @account_affiliation = AccountAffiliation.new(account_affiliation_params)

    respond_to do |format|
      if @account_affiliation.save
        format.html { render accounts_confirmed_path(id: @account_affiliation.account_id) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account_affiliation = AccountAffiliation.find(params[:id])
    @account_affiliation.destroy
  end

  private
    def set_account_affiliation
      @account_affiliation = AccountAffiliation.find(params[:id])
    end

    def account_affiliation_params
      params.require(:account_affiliation).permit(:user_id, :account_id, :role)
    end

end