require 'jargon/client'
require 'jargon/version'

module Jargon
  def self.root
    File.expand_path '../..', __FILE__
  end
end
