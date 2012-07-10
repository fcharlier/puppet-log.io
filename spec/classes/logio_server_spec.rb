require 'spec_helper'

describe 'logio::server' do

  it do should contain_class('logio::package') end

  describe 'with default parameters' do
    it do should contain_file('/etc/log.io/server.conf') \
      .with_content(/^\s*port: 8998,$/)
    end
  end

  describe 'when overriding default parameters' do
    let :params do
      {
        :port => 1234,
      }
    end

    it do should contain_file('/etc/log.io/server.conf') \
      .with_content(/^\s*port: 1234,$/)
    end
  end

end
