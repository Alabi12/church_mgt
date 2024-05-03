class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
    @groups = Member.all.group_by(&:group)
    @members = @members.joins(:cs_members) if params[:group] == "CS"
    @members = @members.where(id: params[:member_id]) if params[:member_id].present?
    @members = @members.where('first_name ILIKE ?', "%#{params[:first_name]}%") if params[:first_name].present?
    @members = @members.joins(:generational_groups).where('generational_groups.name ILIKE ?', "%#{params[:generational_group]}%") if params[:generational_group].present?
    @members = @members.joins(:service_groups).where('service_groups.name ILIKE ?', "%#{params[:service_group]}%") if params[:service_group].present?
    @members = if params[:search].present?
      Member.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search", search: "%#{params[:search].downcase}%")
    else
      Member.all
    end
end

  # GET /members/1 or /members/1.json
  def show
    @member = Member.find(params[:id])
    @groups = Member.where(group: @member.group).group_by(&:group)
    selected_groups = params[:selected_groups] || [@member.group]
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:user_id, :first_name, :last_name, :gender, :date_of_birth, :contact_number, :address, :avatar, :group, :group2)
      # params.require(:member).permit(:first_name, :last_name, :avatar) 
    end
end
