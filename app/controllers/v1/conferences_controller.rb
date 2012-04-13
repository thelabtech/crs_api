class V1::ConferencesController < V1::BaseController
  respond_to :json

  def registrants
    @conference = Crs2Conference.find(params[:id])
    @profiles = @conference.crs2_profiles.includes(:ministry_person, :crs2_person)
  end
end
