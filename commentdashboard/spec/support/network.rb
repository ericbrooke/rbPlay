# Override network access and return sample data

def stub_network
  xml = File.read(File.join('spec', 'fixtures', 'feed.xml'))
  Wordpress::Comments::Client.any_instance.stub(:get).and_return(xml)
end
