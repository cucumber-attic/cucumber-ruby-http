require 'net/http'

class Cucumber::Runtime
  def features
    feature_files.map do |uri|
      source = Net::HTTP.get(URI(uri))
      Cucumber::Core::Gherkin::Document.new(uri, source)
    end
  end
end
