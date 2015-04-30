LIB_DIR = File.expand_path("../../lib", File.dirname(__FILE__))
require 'aruba/cucumber'

Before do
  write_file "features/support/_.rb", %{$LOAD_PATH.unshift "#{LIB_DIR}"}
end

Given(/^a server running on port "([^"]*)"$/) do |port|
  WebServer.start(Integer(port), File.expand_path("tmp/aruba/_web_docs"))
end

Given(/^the http plugin is installed$/) do
  write_file "features/support/http.rb", %{require 'cucumber/http'}
end

Given(/^a remote gherkin document at "([^"]*)":$/) do |path,gherkin|
  write_file File.join("_web_docs", path), gherkin
end
