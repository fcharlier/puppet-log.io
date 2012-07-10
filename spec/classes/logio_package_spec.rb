require 'spec_helper'

describe 'logio::package' do

  it { should contain_package('log.io').with(
    :ensure   => 'installed',
    :provider => 'npm',
    :require  => ['Class[Nodejs]', 'User[logio]']
  ) }

  it { should contain_package('forever').with(
    :ensure   => 'installed',
    :provider => 'npm',
    :require  => ['Class[Nodejs]', 'User[logio]']
  ) }

end
