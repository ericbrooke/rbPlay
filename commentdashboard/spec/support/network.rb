# Override network access and return sample data

def stub_network
  xml = Factory.comments_feed_xml
  Wordpress::Comments::Client.any_instance.stub(:get).and_return(xml)
end
