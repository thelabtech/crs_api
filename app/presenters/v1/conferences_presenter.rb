class V1::ConferencesPresenter

  def initialize(conferences)
    @conferences = conferences
  end

  def as_json(options={})
    # fill me in...
  end

  def to_xml(options={}, &block)
    xml = options[:builder] ||= Builder::XmlMarkup.new
    # fill me in...
  end
end
