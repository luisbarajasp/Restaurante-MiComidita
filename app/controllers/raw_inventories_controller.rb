class RawInventoriesController < ApplicationController
  before_action :set_raw_inventory, only: [:show, :edit, :update, :destroy]

  # GET /raw_inventories
  # GET /raw_inventories.json
  def index
    @raw_inventories = RawInventory.all
  end

  # GET /raw_inventories/1
  # GET /raw_inventories/1.json
  def show
  end

  # GET /raw_inventories/new
  def new
    @raw_inventory = RawInventory.new
  end

  # GET /raw_inventories/1/edit
  def edit
  end

  # POST /raw_inventories
  # POST /raw_inventories.json
  def create
    @raw_inventory = RawInventory.new(raw_inventory_params)

    respond_to do |format|
      if @raw_inventory.save
        format.html { redirect_to @raw_inventory, notice: 'Raw inventory was successfully created.' }
        format.json { render :show, status: :created, location: @raw_inventory }
      else
        format.html { render :new }
        format.json { render json: @raw_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_inventories/1
  # PATCH/PUT /raw_inventories/1.json
  def update
    respond_to do |format|
      if @raw_inventory.update(raw_inventory_params)
        format.html { redirect_to @raw_inventory, notice: 'Raw inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_inventory }
      else
        format.html { render :edit }
        format.json { render json: @raw_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_inventories/1
  # DELETE /raw_inventories/1.json
  def destroy
    @raw_inventory.destroy
    respond_to do |format|
      format.html { redirect_to raw_inventories_url, notice: 'Raw inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_inventory
      @raw_inventory = RawInventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_inventory_params
      params.require(:raw_inventory).permit(:quantity, :expired_at)
    end
end
