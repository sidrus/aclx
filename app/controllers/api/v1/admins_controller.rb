class Api::V1::AdminsController < Api::V1::BaseController
  include ActiveHashRelation


  skip_before_filter :authenticate_admin! 

  def show 
    admin = Admin.find(params[:id])
    render(json: Api::V1::AdminSerializer.new(admin).to_json)
  end

  def index
    admins = Admin.all
    render(json: ActiveModel::Serializer::CollectionSerializer.new(admins, serializer: Api::V1::AdminSerializer,root: 'admins'))
  end
end