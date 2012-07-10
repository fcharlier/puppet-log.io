require 'spec_helper'

describe 'logio::harvester' do

  it do should contain_class('logio::package') end

  let :facts do
    { :fqdn => 'harvester.example.com' }
  end

  describe 'with default parameters' do
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*host: '127.0.0.1',$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*port: 8998,$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*instance_name : 'harvester.example.com'$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*log_file_paths:\s*\{\n\s*logio_harvester\s*:\s*\/var\/log\/log.io\/harvester.log\s*\n\s*\},\s*$/m)
    end
  end

  describe 'when overriding default parameters' do
    let :params do
      {
        :host          => 'server.example.com',
        :port          => 1234,
        :instance_name => 'other_harvester.example.com',
        :log_files     => { 'file_1' => '/var/log/file_one', 'file_2' => '/var/log/custom_app/file_two' }
      }
    end

    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*host: 'server.example.com',$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*port: 1234,$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*instance_name : 'other_harvester.example.com'$/)
    end
    it do should contain_file('/etc/log.io/harvester.conf') \
      .with_content(/^\s*log_file_paths:\s*\{\n\s*file_1\s*:\s*\/var\/log\/file_one\s*,\s*\n\s*file_2\s*:\s*\/var\/log\/custom_app\/file_two\s*\n\s*\},\s*$/m)
    end
  end

end
