class AccountsController < ApplicationController
  before_action :authenticate_user!

  def new
    @account = Account.new
  end

  def edit
    @account = Account.friendly.find(params[:id])
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        affiliation = AccountAffiliation.new
        affiliation.user_id = current_user.id
        affiliation.account_id = @account.id
        affiliation.role = "admin"
        affiliation.save

        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def select
    @accounts = current_user.accounts
  end

  def manage
    @accounts = current_user.accounts
  end

  def search
    if params[:username_search].present?
      @accounts = Account.where("username ILIKE ? AND category = 'user'", "%#{params[:username_search]}%")
    else
      @accounts = []
    end
    puts "----search----"
    puts params[:destination_account]
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_results", partial: "accounts/search_results", locals: { accounts: @accounts, destination_account: params[:destination_account] })
      end
    end
  end

  def user_info
    affiliate = AccountAffiliation.find_by(account_id: params[:account_id])
    @user_info = User.find(affiliate.user_id)
    @account = Account.find(params[:account_id])
    @destination_account = params[:destination_account]
    puts "----destination account---------"
    puts @destination_account
    
  end

  def new_affiliation
    affiliation = AccountAffiliation.new(user_id: params[:user_id], account_id: params[:destination_account], role: "editor")
    affiliation.save
    @account = Account.find(params[:id])
  end

  def switch
    if(params.has_key?(:channel_id))
      @channel = Channel.find(params[:channel_id])
      @account = Account.find(@channel.account_id)
    else
      @account = current_user.account.find_by(role: 'user')
    end
    session[:account_id] = @account.id
    session[:channel_id] = @channel.id
    @current_affiliation = AccountAffiliation.find_by(user_id: current_user.id, account_id: @account.id)
    current_user.role = @current_affiliation.role
    current_user.save
    
    redirect_to root_path
  end

  private

    def account_params
      params.require(:account).permit(:name, :username, :category, :username_search, :destination_account)
    end

end