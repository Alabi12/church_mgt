class MembersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = search_members
    @groups = @members.group_by(&:group)
    @members = filter_by_group(@members)
    @members = filter_by_member_id(@members)
    @members = filter_by_first_name(@members)
    @members = filter_by_generational_group(@members)
    @members = filter_by_service_group(@members)
  end

  def show
    @groups = Member.where(group: @member.group).group_by(&:group)
    @selected_groups = params[:selected_groups] || [@member.group]
  end


  def posts
    @posts = @member.posts
  end

  def new
    @member = Member.new
  end
  
  def edit
  end

  def create
    @member = current_user.members.build(member_params)
  
    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:avatar, :title, :first_name, :last_name, :member_id, :gender, :communion_status, :nationality, :hometown, :region, :profession, :occupation, :employer, :educational_level, :name_of_school, :school_address, :admission_date, :date_of_completion, :course, :date_of_birth, :home_phone, :mobile, :work_phone, :email_address, :postal_address, :house_number, :location, :date_of_baptism, :place_of_baptism, :minister_baptism, :certificate_number_baptism, :date_confirm, :place_of_confirm, :minister_confirm, :certificate_number_confirm, :memory_verse, :date_joined, :marital_status, :date_of_marriage, :type_of_marriage, :place_of_marriage, :how_become_member, :spouse_name, :church_spouse, :mobile_number_spouse, :mobile, :avatar, :group, :group2,
    
    )
  end


  def search_members
    if params[:search].present?
      Member.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search", search: "%#{params[:search].downcase}%")
    else
      Member.all
    end
  end

  def filter_by_group(members)
    members = members.joins(:cs_members) if params[:group] == 'CS'
    members
  end

  def filter_by_member_id(members)
    members = members.where(id: params[:member_id]) if params[:member_id].present?
    members
  end

  def filter_by_first_name(members)
    members = members.where('first_name ILIKE ?', "%#{params[:first_name]}%") if params[:first_name].present?
    members
  end

  def filter_by_generational_group(members)
    members = members.joins(:generational_groups).where('generational_groups.name ILIKE ?', "%#{params[:generational_group]}%") if params[:generational_group].present?
    members
  end

  def filter_by_service_group(members)
    members = members.joins(:service_groups).where('service_groups.name ILIKE ?', "%#{params[:service_group]}%") if params[:service_group].present?
    members
  end

  private

  def set_member
    @member = Member.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Member not found."
    redirect_to members_path
  end
end
