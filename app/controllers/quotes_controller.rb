class QuotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :create_authorized_quote, only: [:create]
  before_action :set_authorized_quote, only: [:edit, :update, :destroy]
  before_action :set_quote, only: [:show]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show; end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit; end

  # POST /quotes
  # POST /quotes.json
  def create
    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Quote.find(params[:id])
  end

  # Set a quote only if authorized o act on it
  def set_authorized_quote
    @quote = current_user.quotes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |f|
      f.html { redirect_to quotes_url, alert: "Quote does not exist or you don't own it" }
      f.json {}
    end
  end

  # Create a new quote for the current user
  def create_authorized_quote
    @quote = current_user.quotes.new(quote_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quote_params
    params.fetch(:quote, {}).permit(:text, :source)
  end
end
