require 'puppetlabs_spec_helper/module_spec_helper'
require 'rake'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.pattern = FileList[c.pattern].exclude(/^spec\/fixtures/)
end

Puppet::Util::Log.level = :warning
Puppet::Util::Log.newdestination(:console)
