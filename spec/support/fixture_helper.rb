module FixtureHelper
  def load_fixture(file_name)
    file_path = Rails.root.join('spec', 'fixtures', file_name)
    JSON.parse(File.read(file_path))
  end
end

RSpec.configure do |config|
  config.include FixtureHelper
end
