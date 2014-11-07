require 'jargon/version'
require 'jargon/client'

module Jargon
  def self.root
    File.expand_path '../..', __FILE__
  end
end
